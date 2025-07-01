local module = {}

-- Safe file reading with error handling
function module.read_proc_file(path)
  local file = io.open(path, 'r')
  if not file then
    return nil
  end
  
  local content = file:read('*all')
  file:close()
  return content
end

-- System statistics collection
function module.get_system_stats()
  local stats = {}
  
  -- CPU load average (1-minute)
  local loadavg = module.read_proc_file('/proc/loadavg')
  if loadavg then
    stats.cpu_load = loadavg:match('^([%d%.]+)')
  end
  
  -- Memory usage calculation
  local meminfo = module.read_proc_file('/proc/meminfo')
  if meminfo then
    local total = meminfo:match('MemTotal:%s*(%d+)')
    local available = meminfo:match('MemAvailable:%s*(%d+)')
    if total and available then
      local total_num = tonumber(total)
      local available_num = tonumber(available)
      if total_num and available_num and total_num > 0 then
        stats.memory_percent = math.floor((1 - available_num/total_num) * 100)
      end
    end
  end
  
  return stats
end

function module.apply_to_config(config)
  -- Utility functions - no direct config changes
end

return module