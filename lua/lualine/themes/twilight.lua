local colors = require("twilight.colors").load()

local twilight = {}

twilight.normal = {
	a = { bg = colors.blue, fg = colors.black },
	b = { bg = colors.fg_gutter, fg = colors.blue },
	c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

twilight.insert = {
	a = { bg = colors.green, fg = colors.black },
	b = { bg = colors.fg_gutter, fg = colors.green },
}

twilight.command = {
	a = { bg = colors.yellow, fg = colors.black },
	b = { bg = colors.fg_gutter, fg = colors.yellow },
}

twilight.visual = {
	a = { bg = colors.magenta, fg = colors.black },
	b = { bg = colors.fg_gutter, fg = colors.magenta },
}

twilight.replace = {
	a = { bg = colors.red, fg = colors.black },
	b = { bg = colors.fg_gutter, fg = colors.red },
}

twilight.inactive = {
	a = { bg = colors.bg_statusline, fg = colors.blue },
	b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
	c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

return twilight
