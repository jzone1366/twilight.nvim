local M = {}

M.styles = {
	"light",
	"dark",
}

-- Adds subtle and harsh colors depending if the colors are dark or light
-- @param colors table
-- @return table of colors
local function construct(colors)
	colors.harsh = colors.meta.light and colors.black or colors.white
	colors.subtle = colors.meta.light and colors.white or colors.black
	return colors
end

-- Returns a color table based on the name provided
-- This returns the initial colors defined by the colorscheme
-- without overrides from the configuration
-- If name is not found will default to light
-- If the style is invalid the it will return light colors
-- @param name string (optional)
-- @return table of colors
function M.init(name)
	name = name or require("twilight.config").options.style

	if name == "random" then
		local index = math.random(#M.styles)
		return construct(require("twilight.colors." .. M.styles[index]).init())
	end

	for _, style in ipairs(M.styles) do
		if style == name then
			return construct(require("twilight.colors." .. name).init())
		end
	end

	require("twilight.util").warn("colorscheme " .. name .. " was not found")
	return construct(require("twilight.colors.light").init())
end

-- Return color table based on the name provided
-- If no name is provided it will return the style set in the config
-- If the style defined in the configuration is invalid the it will return light colors
-- @param name string (optional)
-- @return table of colors
function M.load(name)
	name = name or require("twilight.config").options.style

	if name == "random" then
		local index = math.random(#M.styles)
		return construct(require("twilight.colors." .. M.styles[index]).load())
	end

	for _, style in ipairs(M.styles) do
		if style == name then
			return construct(require("twilight.colors." .. name).load())
		end
	end

	require("twilight.util").warn("colorscheme " .. name .. " was not found")
	return construct(require("twilight.colors.light").load())
end

return M
