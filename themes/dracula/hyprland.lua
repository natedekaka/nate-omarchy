local active_border_color = { colors = { "rgba(bd93f9ee)", "rgba(8be9fdee)" }, angle = 45 }
local inactive_border_color = "rgba(44475aaa)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },
  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },
})
