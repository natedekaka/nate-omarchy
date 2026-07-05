--[[
  Stage Layout — by Sisyphus
  ============================
  Active window gets the center stage.
  Other windows stack on left and right sidebars.
  
  Interactive commands (layout_msg):
    ratio <0.3-0.7>  — set center width ratio
    grow             — increase center by 5%
    shrink           — decrease center by 5%
    balance          — equal split left/right
    promote          — move active window to center
]]

local state = {
    center_ratio = 0.50,    -- how much space the center takes
    left_count = 0,          -- how many windows on left
    margin = 0,              -- gap between sections
}

local function clamp(x, min, max)
    return math.max(min, math.min(max, x))
end

local function active_target(ctx)
    for _, t in ipairs(ctx.targets) do
        local w = t.window
        if w and w.active then
            return t
        end
    end
    return ctx.targets[1]
end

-- Count windows excluding the active one
local function split_targets(ctx)
    local active = active_target(ctx)
    local left, right = {}, {}

    local fill_left = true
    for _, t in ipairs(ctx.targets) do
        if t ~= active then
            if fill_left then
                table.insert(left, t)
            else
                table.insert(right, t)
            end
            fill_left = not fill_left
        end
    end

    return active, left, right
end

-- Distribute targets vertically within an area
local function stack_vertically(targets, area, gaps)
    if #targets == 0 then return end
    if #targets == 1 then
        targets[1]:place(area)
        return
    end

    local total_gaps = (#targets - 1) * gaps
    local cell_h = (area.h - total_gaps) / #targets
    local y = area.y

    for _, t in ipairs(targets) do
        t:place {
            x = area.x,
            y = y,
            w = area.w,
            h = cell_h,
        }
        y = y + cell_h + gaps
    end
end

hl.layout.register("stage", {
    recalculate = function(ctx)
        local n = #ctx.targets
        if n == 0 then return end

        -- Single window = fullscreen (with gaps handled by Hyprland)
        if n == 1 then
            ctx.targets[1]:place(ctx.area)
            return
        end

        local area = ctx.area
        local gap = 6  -- gap between sections, complementing Hyprland gaps_in/out
        local active, left, right = split_targets(ctx)

        local center_w = math.floor(area.w * state.center_ratio)
        local side_w = math.floor((area.w - center_w - gap) / 2)
        if side_w < 100 then
            -- Fallback: if too narrow, just do a simple split
            side_w = 100
            center_w = area.w - (side_w * 2) - gap
        end

        local center_x = area.x + side_w + gap
        local left_x = area.x
        local right_x = center_x + center_w + gap

        -- Place active window in center (full height)
        active:place {
            x = center_x,
            y = area.y,
            w = center_w,
            h = area.h,
        }

        -- Stack remaining windows on left and right
        stack_vertically(left, { x = left_x, y = area.y, w = side_w, h = area.h }, 4)
        stack_vertically(right, { x = right_x, y = area.y, w = side_w, h = area.h }, 4)
    end,

    layout_msg = function(ctx, msg)
        local command, arg = msg:match("^(%S+)%s*(.*)$")

        if command == "ratio" then
            local r = tonumber(arg)
            if r then
                state.center_ratio = clamp(r, 0.25, 0.75)
            else
                return "stage: ratio <0.25-0.75>"
            end
        elseif command == "grow" then
            state.center_ratio = clamp(state.center_ratio + 0.05, 0.25, 0.75)
        elseif command == "shrink" then
            state.center_ratio = clamp(state.center_ratio - 0.05, 0.25, 0.75)
        elseif command == "balance" then
            state.center_ratio = 0.50
        elseif command == "promote" then
            -- promote is a no-op here since stage always puts active in center
            -- but accept it for compatibility
        else
            return "stage: expected ratio, grow, shrink, balance, or promote"
        end

        return true
    end,
})
