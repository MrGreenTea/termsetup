local wezterm = require 'wezterm'
local utils = require 'utils'

local module = {}

-- Git repository information
function module.get_git_info(cwd)
  if not cwd or not cwd.file_path then
    return nil
  end
  
  local git_dir = cwd.file_path .. '/.git'
  local file = io.open(git_dir .. '/HEAD', 'r')
  if not file then 
    return nil 
  end
  
  local head = file:read('*line')
  file:close()
  
  if not head then
    return nil
  end
  
  local branch = head:match('ref: refs/heads/(.+)')
  return branch or 'detached'
end

-- Status bar formatting
function module.format_status_bar(window, pane)
  local cwd = pane:get_current_working_dir()
  local stats = utils.get_system_stats()
  local git_branch = module.get_git_info(cwd)
  
  local elements = {}
  
  -- Current directory
  if cwd and cwd.file_path then
    local dir_name = cwd.file_path:match('[^/]+$') or '~'
    table.insert(elements, wezterm.format({
      {Text = ' ' .. dir_name .. ' '}
    }))
  end
  
  -- Git branch
  if git_branch then
    table.insert(elements, wezterm.format({
      {Foreground = {Color = '#a6adc8'}},
      {Text = ' ' .. git_branch .. ' '}
    }))
  end
  
  -- System stats
  if stats.cpu_load and stats.memory_percent then
    table.insert(elements, wezterm.format({
      {Foreground = {Color = '#fab387'}},
      {Text = string.format(' CPU: %s | MEM: %d%% ', stats.cpu_load, stats.memory_percent)}
    }))
  end
  
  -- Current time
  table.insert(elements, wezterm.format({
    {Text = ' ' .. os.date('%H:%M') .. ' '}
  }))
  
  window:set_right_status(table.concat(elements))
end

function module.apply_to_config(config)
  -- Set up status bar event handler
  wezterm.on('update-status', module.format_status_bar)
end

return module