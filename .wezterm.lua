-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- set shell to powershell 7
config.default_prog = { "pwsh", "-NoLogo" }

-- set color scheme similar to alacritty
config.colors = {
	foreground = "#d8d8d8",
	background = "#1a1a1a",

	cursor_bg = "#d8d8d8",
	cursor_fg = "#1a1a1a",

	selection_bg = "#d8d8d8",
	selection_fg = "#1a1a1a",

	ansi = {
		"#1a1a1a", -- black
		"#ac4142", -- red
		"#90a959", -- green
		"#f4bf75", -- yellow
		"#6a9fb5", -- blue
		"#aa759f", -- magenta
		"#75b5aa", -- cyan
		"#d8d8d8", -- white
	},
	brights = {
		"#7b7b7b", -- bright black
		"#ac4142", -- bright red
		"#90a959", -- bright green
		"#f4bf75", -- bright yellow
		"#6a9fb5", -- bright blue
		"#aa759f", -- bright magenta
		"#75b5aa", -- bright cyan
		"#f8f8f8", -- bright white
	},
}

-- disable tab and window padding
config.enable_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- font config
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12
config.freetype_load_target = "HorizontalLcd"

-- Finally, return the configuration to wezterm:
return config
