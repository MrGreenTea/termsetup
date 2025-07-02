local wezterm = require("wezterm")

local module = {}

local function safe_require(module_name, fallback)
	local success, mod = pcall(require, module_name)
	if success then
		return mod
	else
		wezterm.log_warn("Failed to load module: " .. module_name)
		return fallback or {}
	end
end

function module.apply_to_config(config)
	wezterm.log_info("Initializing WezTerm modular configuration")

	local modules = {
		appearance = safe_require("appearance"),
		panes = safe_require("panes"),
		status = safe_require("status"),
		keybindings = safe_require("keybindings"),
		utils = safe_require("utils"),
		workspaces = safe_require("workspaces"),
	}

	-- Apply modules in correct order: appearance first, then panes, then keybindings that depend on panes
	if modules.appearance and modules.appearance.apply_to_config then
		wezterm.log_info("Applying appearance configuration")
		modules.appearance.apply_to_config(config)
	end

	if modules.panes and modules.panes.apply_to_config then
		wezterm.log_info("Applying panes configuration")
		modules.panes.apply_to_config(config)
	end

	if modules.keybindings and modules.keybindings.apply_to_config then
		wezterm.log_info("Applying keybindings configuration")
		modules.keybindings.apply_to_config(config)
	end

	if modules.status and modules.status.apply_to_config then
		wezterm.log_info("Applying status configuration")
		modules.status.apply_to_config(config)
	end

	if modules.workspaces and modules.workspaces.apply_to_config then
		wezterm.log_info("Applying workspaces configuration")
		modules.workspaces.apply_to_config(config)
	end

	wezterm.log_info("WezTerm modular configuration initialized successfully")
end

return module
