local wezterm = require("wezterm")
local quick_select_patterns = require("quick_select")

local config = wezterm.config_builder()

local init = require("init")
init.apply_to_config(config)

config.quick_select_patterns = quick_select_patterns
config.ssh_domains = {
	{
		name = "server",
		remote_address = "192.168.2.107",
		username = "root",
	},
}

return config
