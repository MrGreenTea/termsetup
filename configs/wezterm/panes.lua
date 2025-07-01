local wezterm = require('wezterm')

local module = {}

-- Get pane dimensions safely with error handling
local function get_pane_dimensions(pane)
  local success, dimensions = pcall(function()
    return pane:get_dimensions()
  end)
  
  if success and dimensions then
    return dimensions
  else
    wezterm.log_warn('Failed to get pane dimensions, using fallback')
    return { cols = 80, viewport_rows = 24 } -- Safe fallback
  end
end

-- Smart split function that chooses direction based on terminal size
function module.smart_split(window, pane)
  local dimensions = get_pane_dimensions(pane)
  local split_direction = (dimensions.cols > 120) and 'Right' or 'Bottom'
  
  wezterm.log_info('Smart split: terminal width=' .. dimensions.cols .. ', direction=' .. split_direction)
  
  local success, new_pane = pcall(function()
    return pane:split({
      direction = split_direction,
      domain = 'CurrentPaneDomain'
    })
  end)
  
  if success then
    return new_pane
  else
    wezterm.log_warn('Smart split failed, falling back to default vertical split')
    return pane:split({ direction = 'Bottom', domain = 'CurrentPaneDomain' })
  end
end

function module.apply_to_config(config)
  -- Smart split functionality will be integrated via key bindings in Phase 2.2
  wezterm.log_info('Panes module loaded with smart split functionality')
end

return module