local util = require("twilight.util")

local M = {}

-- Set the configuration values for twilight.
-- This functions sets the configuration options for twilight. These settings will be used when the colorscheme is
-- applied. The colorscheme is applied with the `load` function.
-- @param opts table
function M.setup(opts)
	require("twilight.config").set_options(opts)
end

-- Loads colorscheme and applies the highlight groups.
-- If a name is passed it will override what was set in the configuration setup.
-- @param name string
function M.load(name)
	local colors = require("twilight.colors").load(name)
	local theme = require("twilight.theme").apply(colors)

	util.load(theme, true)
end

-- Loads colorscheme and applies the highlight groups.
-- If a name is passed it will override what was set in the configuration setup.
--
-- This function is internal and should not be called by the user. This funciton is
-- to be called from the `colors/*.vim` files. This function will not execute the
-- autocmd `ColorScheme`. The command `:colorscheme` is already handling this.
-- @param name string
function M._colorscheme_load()
	local colors = require("twilight.colors").load()
	local theme = require("twilight.theme").apply(colors)

	util.load(theme, false)
end

-- Completion function for the TwilightLoad command
-- @param lead string The current typed string
function M.load_complete(lead, _, _)
	local styles = require("twilight.colors").styles

	if lead == "" then
		return styles
	end

	local completion_list = {}
	for _, name in pairs(styles) do
		if name:sub(1, #lead) == lead then
			table.insert(completion_list, name)
		end
	end

	return completion_list
end

function M.set()
	util.warn(
		"`set()` has been deprecated in favor of `load()`",
		"See https://github.com/jzone1366/twilight.nvim for more info"
	)
	M.load()
end

return M
