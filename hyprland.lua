-- Workbench 1.3: flat pens, square chrome, no motion, no tiling snap.
hl.env("XCURSOR_THEME", "Workbench-1.3")
hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_THEME", "Workbench-1.3")
hl.env("HYPRCURSOR_SIZE", "32")

local active_border_color = "rgb(ff8800)"
local inactive_border_color = "rgb(000000)"

hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_size = 2,
    resize_on_border = true,
    extend_border_grab_area = 20,
    hover_icon_on_border = true,
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
    snap = {
      enabled = false,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    rounding = 0,
    shadow = {
      enabled = false,
    },
    blur = {
      enabled = false,
    },
  },

  animations = {
    enabled = false,
  },
})

-- Intuition windows overlap freely. Super+T still tiles a window if needed.
o.window(".*", { float = true, persistent_size = true, no_max_size = true, tag = "+wb13-float" })
