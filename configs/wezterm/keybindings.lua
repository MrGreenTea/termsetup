local wezterm = require('wezterm')

local module = {}

-- Safe module loading for panes functionality
local function safe_require(module_name, fallback)
  local success, loaded_module = pcall(require, module_name)
  if success then
    return loaded_module
  else
    wezterm.log_warn('Failed to load module: ' .. module_name)
    return fallback or {}
  end
end

function module.apply_to_config(config)
  wezterm.log_info('Loading key bindings configuration')
  
  -- Load panes module for navigation functionality
  local panes = safe_require('panes', {})
  
  -- Initialize keys table if it doesn't exist
  config.keys = config.keys or {}
  
  -- Add pane-related key bindings if panes module loaded successfully
  if panes.get_all_pane_bindings then
    local pane_bindings = panes.get_all_pane_bindings()
    
    -- Add each pane binding to the config
    for _, binding in ipairs(pane_bindings) do
      table.insert(config.keys, binding)
    end
    
    wezterm.log_info('Added ' .. #pane_bindings .. ' pane-related key bindings')
  else
    wezterm.log_warn('Panes module not available, skipping pane key bindings')
  end
  
  -- Add additional convenience bindings
  local convenience_bindings = {
    -- Quick new tab/window
    { key = 't', mods = 'CTRL|ALT', action = wezterm.action.SpawnTab('CurrentPaneDomain') },
    { key = 'n', mods = 'CTRL|SHIFT|ALT', action = wezterm.action.SpawnWindow },
    
    -- Workspace management
    { key = 'n', mods = 'CTRL|ALT', action = wezterm.action.EmitEvent('create-workspace') },
  }
  
  for _, binding in ipairs(convenience_bindings) do
    table.insert(config.keys, binding)
  end
  
  wezterm.log_info('Key bindings module loaded successfully with ' .. #config.keys .. ' total bindings')
end

return module