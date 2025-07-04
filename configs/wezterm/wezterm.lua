local wezterm = require("wezterm")

local config = wezterm.config_builder()

local init = require("init")
init.apply_to_config(config)

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
