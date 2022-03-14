local util = require("twilight.util")

local M = {}

-- Return the initial colors of the colorscheme. This is the default defined colors
-- without the color overrides from the configuration.
function M.init()
  -- stylua: ignore
  local colors = {
    meta       = { name = "twilight_light", light = true },

    none       = "NONE",

    bg         = "#FDFFFC",
    bg_alt     = "#E4E6E3",

    fg         = "#070A0E",
    fg_gutter  = "#CBCCCA",

    black      = "#123059",
    red        = "#800E13",
    green      = "#0D751B",
    yellow     = "#DED03C",
    blue       = "#1C88CE",
    magenta    = "#C91457",
    cyan       = "#3B8395",
    white      = "#C1C8C9",
    orange     = "#E66A17",
    pink       = "#D46D8D",

    -- +10 brightness, +10 saturation
    black_br   = "#0B3773",
    red_br     = "#990209",
    green_br   = "#018F14",
    yellow_br  = "#F7E62A",
    blue_br    = "#098FE8",
    magenta_br = "#E32D70",
    cyan_br    = "#3495AD",
    white_br   = "#DAE2E3",
    orange_br  = "#FF6700",
    pink_br    = "#ED618E",

    -- -10 brightness, -10 saturation
    black_dm   = "#132640",
    red_dm     = "#661519",
    green_dm   = "#135C1D",
    yellow_dm  = "#C4BA49",
    blue_dm    = "#2B7EB5",
    magenta_dm = "#B02357",
    cyan_dm    = "#3D6E7A",
    white_dm   = "#A9AFB0",
    orange_dm  = "#CC6A29",
    pink_dm    = "#BA7289",

    comment    = "#91A5C2",

    git = {
      add      = "#0D6E40",
      change   = "#BC5D2E",
      delete   = "#52050A",
      conflict = "#3F2A2B",
    },

    gitSigns = {
      add    = "#2F8C24",
      change = "#2C2C99",
      delete = "#820D0D",
    },
  }

	colors.bg_highlight = util.darken(colors.bg, 0.90)

	util.bg = colors.bg
	util.fg = colors.fg

	colors.diff = {
		add = util.darken(colors.green, 0.15),
		delete = util.darken(colors.red, 0.15),
		change = util.darken(colors.blue, 0.15),
		text = util.darken(colors.blue, 0.4),
	}

	colors.gitSigns = {
		add = util.brighten(colors.gitSigns.add, 0.2),
		change = util.brighten(colors.gitSigns.change, 0.2),
		delete = util.brighten(colors.gitSigns.delete, 0.2),
	}

	colors.git.ignore = colors.black
	colors.border_highlight = colors.blue
	colors.border = colors.black

	-- Popups and statusline always get a dark background
	colors.bg_popup = colors.bg_alt
	colors.bg_statusline = colors.bg_alt

	colors.bg_sidebar = colors.bg
	colors.bg_float = colors.bg_alt

	colors.bg_visual = util.darken(colors.blue, 0.2)
	colors.bg_search = util.darken(colors.cyan, 0.3)
	colors.fg_sidebar = colors.fg_alt

	colors.error = colors.red
	colors.warning = colors.yellow
	colors.info = colors.blue
	colors.hint = colors.cyan

	colors.variable = colors.fg_alt

	return colors
end

-- Returns the completed colors with the overrides from the configuration
-- @param config table
function M.load(config)
	config = config or require("twilight.config").options

	local colors = M.init()
	util.color_overrides(colors, config)

	return colors
end

return M
