---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "kanagawa",
	theme_toggle = { "kanagawa", "kanagawa" },
	transparency = true,
	cmp = {
		style = "default",
	},
	statusline = {
		theme = "default",
		separator_style = "round",
	},

	hl_override = highlights.override,
	hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
