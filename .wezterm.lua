-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Color config:
-- config.color_scheme = "Catppuccin Macchiato"
config.color_scheme = "tokyonight_moon"
-- config.colors = {
-- 	background = "#27243f",
-- }
-- Font general:
config.font_size = 12.8
config.line_height = 1.0

-- JetBrains Config:
-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = "Bold",
		}),
	},
}

-- Github monaspice config:
-- config.font = wezterm.font({ -- Normal text
-- 	family = "MonaspiceAr Nerd Font",
-- 	harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
-- 	weight = "Regular",
-- })
--
-- config.font_rules = {
-- 	{ -- Italic
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font({
-- 			-- family="Monaspace Radon",  -- script style
-- 			family = "MonaspiceRn Nerd Font", -- courier-like
-- 			style = "Italic",
-- 		}),
-- 	},
--
-- 	{ -- Bold
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font({
-- 			family = "MonaspiceKr Nerd Font",
-- 			-- weight='ExtraBold',
-- 			weight = "Bold",
-- 		}),
-- 	},
--
-- 	{ -- Bold Italic
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font({
-- 			family = "MonaspiceXe Nerd Font",
-- 			style = "Italic",
-- 			weight = "Bold",
-- 		}),
-- 	},
-- }
-- Misc:
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0.5cell",
	bottom = "0.5cell",
}
-- Tab bar config
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
-- config.color.tab_bar = {
--   background = "rgba(0,0,0,0)"
-- },
config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		-- rgba(34, 36, 54, 0.7)
		background = "rgba(34,36,54,0.93)",
	},
}

-- background transparency
-- config.window_background_opacity = 0.93
-- config.macos_window_background_blur = 90000

-- background img
config.background = {
	{
		source = {
			File = "/Users/jp133020/Documents/wallpaper.png",
		},
		hsb = {
			hue = 1.0,
			saturation = 1.02,
			brightness = 0.25,
		},
		width = "100%",
		height = "100%",
	},
	{
		source = {
			Color = "#222436",
		},
		width = "100%",
		height = "100%",
		opacity = 0.65,
	},
}
-- and finally, return the configuration to wezterm
return config
