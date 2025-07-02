local wezterm = require("wezterm")
local utils = require("utils")

local module = {}

-- Cache for git status to avoid excessive I/O
local git_cache = {}
local cache_duration = 2000 -- 2 seconds in milliseconds

-- Get file modification time
local function get_file_mtime(path)
	local stat = wezterm.filesystem.metadata(path)
	if stat and stat.mtime then
		-- Convert to seconds for comparison
		return math.floor(stat.mtime)
	end
	return 0
end

-- Test function with hardcoded status
local function get_test_git_status()
	wezterm.log_info("DEBUG: Using TEST git status with hardcoded values")
	return {
		modified = 3,
		added = 1,
		deleted = 0,
		untracked = 2,
	}
end

-- Format pane running time
local function format_running_time(pane)
	if not pane then
		return "00:00"
	end

	-- Initialize pane start times table if it doesn't exist
	if not wezterm.GLOBAL.pane_start_times then
		wezterm.GLOBAL.pane_start_times = {}
	end

	local pane_id = tostring(pane:pane_id())
	local current_time = os.time()

	-- Record start time for this pane if not already recorded
	if not wezterm.GLOBAL.pane_start_times[pane_id] then
		wezterm.GLOBAL.pane_start_times[pane_id] = current_time
		wezterm.log_info("DEBUG: Recorded start time for pane " .. pane_id .. ": " .. current_time)
	end

	local elapsed = current_time - wezterm.GLOBAL.pane_start_times[pane_id]
	local hours = math.floor(elapsed / 3600)
	local minutes = math.floor((elapsed % 3600) / 60)
	local seconds = elapsed % 60

	if hours > 0 then
		return string.format("%dh %dm", hours, minutes)
	elseif minutes > 0 then
		return string.format("%dm %ds", minutes, seconds)
	else
		return string.format("%ds", seconds)
	end
end

-- Get git status information
local function get_git_status(repo_path)
	wezterm.log_info("DEBUG: get_git_status called with repo_path: " .. tostring(repo_path))

	local success, result = pcall(function()
		local cmd = "git -C '" .. repo_path .. "' status --porcelain"
		wezterm.log_info("DEBUG: Executing command: " .. cmd)

		local handle = io.popen(cmd)
		if not handle then
			wezterm.log_error("DEBUG: io.popen failed - handle is nil")
			return nil
		end
		wezterm.log_info("DEBUG: io.popen succeeded, got handle")

		local output = handle:read("*all")
		wezterm.log_info("DEBUG: Raw git output: '" .. tostring(output) .. "'")

		local exit_code = handle:close()
		wezterm.log_info("DEBUG: Command exit_code: " .. tostring(exit_code))

		-- Process output regardless of exit_code - empty output is valid (no changes)
		wezterm.log_info("DEBUG: Processing git output (length: " .. #output .. ")")

		local status = {
			modified = 0,
			added = 0,
			deleted = 0,
			untracked = 0,
		}
		wezterm.log_info("DEBUG: Initialized status object")

		local line_count = 0
		for line in output:gmatch("[^\r\n]+") do
			line_count = line_count + 1
			wezterm.log_info("DEBUG: Processing line " .. line_count .. ": '" .. line .. "'")

			local status_chars = line:sub(1, 2)
			wezterm.log_info("DEBUG: Status chars: '" .. status_chars .. "'")

			if status_chars == "??" then
				status.untracked = status.untracked + 1
				wezterm.log_info("DEBUG: Incremented untracked to " .. status.untracked)
			else
				local staged = status_chars:sub(1, 1)
				local unstaged = status_chars:sub(2, 2)
				wezterm.log_info("DEBUG: Staged: '" .. staged .. "', Unstaged: '" .. unstaged .. "'")

				-- Count staged changes
				if staged == "A" then
					status.added = status.added + 1
					wezterm.log_info("DEBUG: Incremented added to " .. status.added)
				elseif staged == "M" then
					status.modified = status.modified + 1
					wezterm.log_info("DEBUG: Incremented modified to " .. status.modified)
				elseif staged == "D" then
					status.deleted = status.deleted + 1
					wezterm.log_info("DEBUG: Incremented deleted to " .. status.deleted)
				end

				-- Count unstaged changes
				if unstaged == "M" then
					status.modified = status.modified + 1
					wezterm.log_info("DEBUG: Incremented modified (unstaged) to " .. status.modified)
				elseif unstaged == "D" then
					status.deleted = status.deleted + 1
					wezterm.log_info("DEBUG: Incremented deleted (unstaged) to " .. status.deleted)
				end
			end
		end

		wezterm.log_info(
			"DEBUG: Final status - Modified: "
				.. status.modified
				.. ", Added: "
				.. status.added
				.. ", Deleted: "
				.. status.deleted
				.. ", Untracked: "
				.. status.untracked
		)
		return status
	end)

	if not success then
		wezterm.log_error("DEBUG: pcall failed with error: " .. tostring(result))
		return nil
	end

	wezterm.log_info("DEBUG: get_git_status returning: " .. tostring(result))
	return result
end

-- Find git repository by walking up the directory tree
local function find_git_repo(start_path)
	local path = start_path
	while path and path ~= "/" do
		local git_dir = path .. "/.git"
		local head_file = io.open(git_dir .. "/HEAD", "r")
		if head_file then
			head_file:close()
			wezterm.log_info("DEBUG: Found git repo at: " .. path)
			return path
		end
		-- Go up one directory
		path = path:match("(.+)/[^/]*$")
	end
	wezterm.log_info("DEBUG: No git repo found from: " .. start_path)
	return nil
end

-- Enhanced git repository information
function module.get_git_info(cwd)
	wezterm.log_info("DEBUG: get_git_info called")

	if not cwd or not cwd.file_path then
		wezterm.log_info("DEBUG: No cwd or file_path, returning nil")
		return nil
	end

	-- Find the actual git repository
	local repo_path = find_git_repo(cwd.file_path)
	if not repo_path then
		wezterm.log_info("DEBUG: No git repository found")
		return nil
	end

	local cache_key = repo_path
	local current_time = os.time() * 1000 -- Convert to milliseconds

	wezterm.log_info("DEBUG: repo_path: " .. repo_path .. ", current_time: " .. current_time)

	-- Check cache first
	if git_cache[cache_key] and (current_time - git_cache[cache_key].timestamp) < cache_duration then
		return git_cache[cache_key].data
	end

	local git_dir = repo_path .. "/.git"
	local head_file = io.open(git_dir .. "/HEAD", "r")
	if not head_file then
		wezterm.log_info("DEBUG: No .git/HEAD file found")
		return nil
	end

	local head = head_file:read("*line")
	head_file:close()

	if not head then
		wezterm.log_info("DEBUG: Could not read HEAD file")
		return nil
	end

	local branch = head:match("ref: refs/heads/(.+)")
	if not branch then
		branch = "detached"
	end
	wezterm.log_info("DEBUG: Found branch: " .. branch)

	wezterm.log_info("DEBUG: Calling get_git_status...")
	local status = get_git_status(repo_path)
	wezterm.log_info("DEBUG: get_git_status returned: " .. tostring(status))

	local git_info = {
		branch = branch,
		status = status,
	}
	wezterm.log_info(
		"DEBUG: Created git_info object with branch: " .. git_info.branch .. ", status: " .. tostring(git_info.status)
	)

	-- Cache the result
	git_cache[cache_key] = { data = git_info, timestamp = current_time }
	wezterm.log_info("DEBUG: Cached git_info")

	return git_info
end

-- Status bar formatting
function module.format_status_bar(window, pane)
	wezterm.log_info("DEBUG: format_status_bar called")

	-- Get working directory from pane
	local cwd_uri = pane:get_current_working_dir()
	wezterm.log_info("DEBUG: pane:get_current_working_dir() returned: " .. tostring(cwd_uri))

	local cwd = nil
	if cwd_uri then
		wezterm.log_info("DEBUG: cwd_uri type: " .. type(cwd_uri))

		-- Handle different return types (URI string or Url object)
		if type(cwd_uri) == "string" then
			-- Extract file path from URI (e.g., "file:///path/to/dir")
			local file_path = cwd_uri:match("^file://(.*)$")
			if file_path then
				cwd = { file_path = file_path }
				wezterm.log_info("DEBUG: Extracted file path from URI: " .. file_path)
			end
		elseif type(cwd_uri) == "userdata" and cwd_uri.file_path then
			-- Already a Url object with file_path
			cwd = cwd_uri
			wezterm.log_info("DEBUG: Using Url object directly: " .. cwd_uri.file_path)
		elseif type(cwd_uri) == "table" and cwd_uri.file_path then
			-- Table with file_path
			cwd = cwd_uri
			wezterm.log_info("DEBUG: Using table with file_path: " .. cwd_uri.file_path)
		end
	end

	-- Fallback: use pane foreground process cwd
	if not cwd then
		local proc_info = pane:get_foreground_process_info()
		if proc_info and proc_info.cwd then
			wezterm.log_info("DEBUG: Using foreground process cwd fallback: " .. proc_info.cwd)
			cwd = { file_path = proc_info.cwd }
		end
	end

	wezterm.log_info("DEBUG: Final cwd: " .. tostring(cwd and cwd.file_path or "nil"))

	local stats = utils.get_system_stats()
	local git_info = nil

	if cwd and cwd.file_path then
		wezterm.log_info("DEBUG: Calling get_git_info...")
		git_info = module.get_git_info(cwd)
		wezterm.log_info("DEBUG: get_git_info returned git_info: " .. tostring(git_info))
		if git_info then
			wezterm.log_info("DEBUG: git_info.branch: " .. tostring(git_info.branch))
			wezterm.log_info("DEBUG: git_info.status: " .. tostring(git_info.status))
			if git_info.status then
				wezterm.log_info(
					"DEBUG: status details - modified: "
						.. tostring(git_info.status.modified)
						.. ", added: "
						.. tostring(git_info.status.added)
						.. ", deleted: "
						.. tostring(git_info.status.deleted)
						.. ", untracked: "
						.. tostring(git_info.status.untracked)
				)
			end
		end
	end

	local elements = {}

	-- Current directory
	if cwd and cwd.file_path then
		local dir_name
		local home_dir = wezterm.home_dir
		
		-- Show ~ if we're in the home directory
		if cwd.file_path == home_dir then
			dir_name = "~"
		else
			dir_name = cwd.file_path:match("[^/]+$") or "~"
		end
		
		table.insert(
			elements,
			wezterm.format({
				{ Text = " " .. dir_name .. " " },
			})
		)
	else
		table.insert(
			elements,
			wezterm.format({
				{ Text = " ~ " },
			})
		)
	end

	-- Git branch and status display
	wezterm.log_info("DEBUG: Git display section - git_info: " .. tostring(git_info))
	if git_info and git_info.branch then
		wezterm.log_info("DEBUG: Git info available, branch: " .. git_info.branch)
		local git_text = " " .. git_info.branch

		-- Add status indicators if available
		if git_info.status then
			wezterm.log_info("DEBUG: Git status available")
			local status_indicators = {}
			if git_info.status.added > 0 then
				table.insert(status_indicators, "+" .. git_info.status.added)
				wezterm.log_info("DEBUG: Added indicator: +" .. git_info.status.added)
			end
			if git_info.status.modified > 0 then
				table.insert(status_indicators, "~" .. git_info.status.modified)
				wezterm.log_info("DEBUG: Modified indicator: ~" .. git_info.status.modified)
			end
			if git_info.status.deleted > 0 then
				table.insert(status_indicators, "-" .. git_info.status.deleted)
				wezterm.log_info("DEBUG: Deleted indicator: -" .. git_info.status.deleted)
			end
			if git_info.status.untracked > 0 then
				table.insert(status_indicators, "?" .. git_info.status.untracked)
				wezterm.log_info("DEBUG: Untracked indicator: ?" .. git_info.status.untracked)
			end

			wezterm.log_info("DEBUG: Status indicators count: " .. #status_indicators)
			if #status_indicators > 0 then
				git_text = git_text .. " " .. table.concat(status_indicators, " ")
				wezterm.log_info("DEBUG: Added status indicators to git_text")
			end
		else
			wezterm.log_info("DEBUG: No git status available")
		end

		git_text = git_text .. " "
		wezterm.log_info("DEBUG: Final git_text: '" .. git_text .. "'")

		table.insert(
			elements,
			wezterm.format({
				{ Foreground = { Color = "#a6adc8" } },
				{ Text = git_text },
			})
		)
		wezterm.log_info("DEBUG: Added git element to status bar")
	else
		wezterm.log_info("DEBUG: No git info or branch available")
	end

	-- System stats
	if stats.cpu_load and stats.memory_percent then
		table.insert(
			elements,
			wezterm.format({
				{ Foreground = { Color = "#fab387" } },
				{ Text = string.format(" CPU: %s | MEM: %d%% ", stats.cpu_load, stats.memory_percent) },
			})
		)
	end

	-- Pane running time
	table.insert(
		elements,
		wezterm.format({
			{ Text = " " .. format_running_time(pane) .. " " },
		})
	)

	window:set_right_status(table.concat(elements))
end

function module.apply_to_config(config)
	-- Enable status bar
	config.status_update_interval = 1000

	-- Set up status bar event handler
	wezterm.on("update-status", module.format_status_bar)
end

return module
