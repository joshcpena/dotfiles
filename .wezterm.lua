-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Color config:
config.color_scheme = "Catppuccin Macchiato"
config.colors = {
	background = "#27243f",
}
-- Fonts:
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 12.8
config.line_height = 1.05
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = "Bold",
		}),
	},
}
-- Misc:
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = "0px",
	right = "0px",
	top = "0px",
	bottom = "0px",
}

-- and finally, return the configuration to wezterm
return config
