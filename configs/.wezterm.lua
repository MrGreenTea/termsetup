local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

-- HACK: fractional scaling / Wayland issue: https://github.com/wez/wezterm/issues/5263
config.use_fancy_tab_bar = false
config.font = wezterm.font("JetBrains Mono")

config.quick_select_patterns = {
	-- emails
	"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}",
}

config.ssh_domains = {
	{
		name = "server",
		remote_address = "192.168.2.107",
		username = "root",
	},
}

return config
