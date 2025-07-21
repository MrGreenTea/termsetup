local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha"
	config.font = wezterm.font("JetBrains Mono")
	config.use_fancy_tab_bar = false
	config.window_decorations = "RESIZE"
end

return module
