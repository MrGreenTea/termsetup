local wezterm = require('wezterm')

local module = {}

local function safe_require(module_name, fallback)
  local success, mod = pcall(require, module_name)
  if success then
    return mod
  else
    wezterm.log_warn('Failed to load module: ' .. module_name)
    return fallback or {}
  end
end

function module.apply_to_config(config)
  local modules = {
    appearance = safe_require('appearance'),
    panes = safe_require('panes'),
    status = safe_require('status'),
    keybindings = safe_require('keybindings'),
    utils = safe_require('utils')
  }
  
  if modules.appearance and modules.appearance.apply_to_config then
    modules.appearance.apply_to_config(config)
  end
  
  if modules.keybindings and modules.keybindings.apply_to_config then
    modules.keybindings.apply_to_config(config)
  end
  
  if modules.status and modules.status.apply_to_config then
    modules.status.apply_to_config(config)
  end
  
  if modules.panes and modules.panes.apply_to_config then
    modules.panes.apply_to_config(config)
  end
end

return module