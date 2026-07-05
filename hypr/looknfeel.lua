-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
  general = {
    -- Master layout: one master window on the left, stack on the right.
    layout = "master",
    -- Allow dragging window borders with mouse to resize.
    resize_on_border = true,
  },
})

-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
  master = {
    -- Master takes 60% of screen width.
    mfact = 0.6,
    -- Master on the left, stack on the right.
    orientation = "left",
    -- New windows appear at the top of the stack.
    new_on_top = true,
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
hl.config({
  layout = {
    -- Avoid overly wide single-window layouts on wide screens.
    single_window_aspect_ratio = { 1, 1 },
  },
})

o.window("org.codeberg.dnkl.foot", { float = false, tag = "-floating-window" })

-- Curve overshoot untuk efek bounce ringan
hl.curve("overshoot", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.1 } } })

-- Override window animations dengan overshoot
hl.animation({ leaf = "windows", enabled = true, speed = 8, bezier = "overshoot", style = "popin 87%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 8, bezier = "overshoot", style = "popin 87%" })
