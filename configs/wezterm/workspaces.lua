-- ABOUTME: Core workspace management system for WezTerm
-- ABOUTME: Provides persistent, project-aware development environments with JSON storage

local wezterm = require("wezterm")

local module = {}

-- Workspace data structure
local function create_workspace(name, root_path, project_type)
	return {
		name = name,
		root_path = root_path,
		project_type = project_type or "generic",
		created_at = os.date("%Y-%m-%dT%H:%M:%SZ"),
		last_accessed = os.date("%Y-%m-%dT%H:%M:%SZ"),
		socket_path = "",
		layout = {
			panes = {},
			split_direction = "horizontal",
		},
		environment = {},
		metadata = {
			git_branch = "",
			last_command = "",
			active_pane = "",
		},
	}
end

-- Project type detection - order matters! More specific types first
local project_detectors = {
	{
		name = "nodejs",
		files = { "package.json", "node_modules" },
		template = "nodejs_template",
	},
	{
		name = "rust",
		files = { "Cargo.toml", "src/main.rs", "src/lib.rs" },
		template = "rust_template",
	},
	{
		name = "python",
		files = { "requirements.txt", "pyproject.toml", "setup.py", "poetry.lock" },
		template = "python_template",
	},
	{
		name = "git",
		files = { ".git" },
		template = "git_template",
	},
}

local function detect_project_type(path)
	for _, detector in ipairs(project_detectors) do
		for _, file in ipairs(detector.files) do
			local file_path = path .. "/" .. file
			local f = io.open(file_path, "r")
			if f then
				f:close()
				return detector.name
			end
		end
	end
	return "generic"
end

-- Workspace persistence
local function get_workspace_dir()
	local home = os.getenv("HOME")
	local workspace_dir = home .. "/.config/wezterm/workspaces"

	-- Create directory if it doesn't exist
	local success, err = pcall(function()
		os.execute("mkdir -p " .. workspace_dir)
	end)

	if not success then
		wezterm.log_warn("Failed to create workspace directory: " .. tostring(err))
	end

	return workspace_dir
end

local function get_workspace_path(workspace_name)
	return get_workspace_dir() .. "/" .. workspace_name .. ".json"
end

local function save_workspace(workspace)
	local workspace_path = get_workspace_path(workspace.name)

	local success, err = pcall(function()
		local temp_file = workspace_path .. ".tmp"
		local file = io.open(temp_file, "w")
		if not file then
			error("Failed to open temp file for writing")
		end

		file:write(wezterm.json_encode(workspace))
		file:close()

		-- Atomic rename
		os.rename(temp_file, workspace_path)
	end)

	if not success then
		wezterm.log_error("Failed to save workspace '" .. workspace.name .. "': " .. tostring(err))
		return false
	end

	wezterm.log_info("Saved workspace: " .. workspace.name)
	return true
end

local function load_workspace(workspace_name)
	local workspace_path = get_workspace_path(workspace_name)

	local success, workspace = pcall(function()
		local file = io.open(workspace_path, "r")
		if not file then
			return nil
		end

		local content = file:read("*all")
		file:close()

		return wezterm.json_parse(content)
	end)

	if not success then
		wezterm.log_warn("Failed to load workspace '" .. workspace_name .. "': " .. tostring(workspace))
		return nil
	end

	return workspace
end

local function list_all_workspaces()
	local workspace_dir = get_workspace_dir()
	local workspaces = {}

	-- Get list of JSON files in workspace directory
	local success, files = pcall(function()
		local handle = io.popen("find " .. workspace_dir .. " -name '*.json' -type f 2>/dev/null | sort")
		local result = handle:read("*a")
		handle:close()
		return result
	end)

	if not success then
		wezterm.log_warn("Failed to list workspace directory: " .. tostring(files))
		return {}
	end

	-- Process each workspace file
	for workspace_file in files:gmatch("[^\r\n]+") do
		local workspace_name = workspace_file:match("([^/]+)%.json$")
		if workspace_name then
			local workspace = load_workspace(workspace_name)
			if workspace then
				table.insert(workspaces, {
					name = workspace.name,
					project_type = workspace.project_type or "generic",
					root_path = workspace.root_path,
					last_accessed = workspace.last_accessed,
					created_at = workspace.created_at,
				})
			else
				wezterm.log_warn("Failed to load workspace: " .. workspace_name)
			end
		end
	end

	-- Sort by last_accessed (most recent first)
	table.sort(workspaces, function(a, b)
		return (a.last_accessed or "") > (b.last_accessed or "")
	end)

	wezterm.log_info("Found " .. #workspaces .. " workspaces")
	return workspaces
end

-- Workspace management functions
local function switch_to_workspace(workspace_name, window, pane)
	local workspace = load_workspace(workspace_name)
	if not workspace then
		wezterm.log_error("Workspace '" .. workspace_name .. "' not found")
		window:toast_notification("WezTerm Workspace", "Failed to load workspace: " .. workspace_name, nil, 4000)
		return false
	end

	-- Update last_accessed timestamp
	workspace.last_accessed = os.date("%Y-%m-%dT%H:%M:%SZ")
	if not save_workspace(workspace) then
		wezterm.log_warn("Failed to update workspace timestamp for: " .. workspace_name)
	end

	-- Switch to the workspace
	window:perform_action(
		wezterm.action.SwitchToWorkspace({
			name = workspace_name,
			spawn = {
				cwd = workspace.root_path,
			},
		}),
		pane
	)

	-- Show success notification
	window:toast_notification("WezTerm Workspace", "Switched to workspace: " .. workspace_name, nil, 4000)
	wezterm.log_info("Switched to workspace: " .. workspace_name)
	return true
end

local function create_workspace_from_current_directory(workspace_name, current_path)
	if not workspace_name or workspace_name == "" then
		wezterm.log_error("Workspace name cannot be empty")
		return false
	end

	if not current_path then
		wezterm.log_error("Current path is required")
		return false
	end

	-- Check if workspace already exists
	if load_workspace(workspace_name) then
		wezterm.log_warn("Workspace '" .. workspace_name .. "' already exists")
		return false
	end

	local project_type = detect_project_type(current_path)
	local workspace = create_workspace(workspace_name, current_path, project_type)

	if save_workspace(workspace) then
		wezterm.log_info("Created workspace: " .. workspace_name .. " (" .. project_type .. ")")
		return true
	end

	return false
end

-- WezTerm integration
function module.apply_to_config(config)
	wezterm.log_info("Applying workspace configuration")

	-- Register workspace creation action
	wezterm.on("create-workspace", function(window, pane)
		local current_path = pane:get_current_working_dir()
		if current_path then
			current_path = current_path.file_path -- Extract file path from Url object
		else
			current_path = os.getenv("HOME")
		end

		window:perform_action(
			wezterm.action.PromptInputLine({
				description = "Enter workspace name:",
				action = wezterm.action_callback(function(window, pane, line)
					if line and line ~= "" then
						if create_workspace_from_current_directory(line, current_path) then
							window:toast_notification("WezTerm Workspace", "Created workspace: " .. line, nil, 4000)
						else
							window:toast_notification(
								"WezTerm Workspace",
								"Failed to create workspace: " .. line,
								nil,
								4000
							)
						end
					end
				end),
			}),
			pane
		)
	end)

	-- Register workspace listing action
	wezterm.on("list-workspaces", function(window, pane)
		local workspaces = list_all_workspaces()
		
		if #workspaces == 0 then
			window:toast_notification("WezTerm Workspace", "No workspaces found", nil, 4000)
			return
		end

		local choices = {}
		for _, workspace in ipairs(workspaces) do
			local label = string.format("[%s] %s - %s", workspace.project_type, workspace.name, workspace.root_path)
			if workspace.last_accessed then
				label = label .. " (last: " .. workspace.last_accessed .. ")"
			end
			
			table.insert(choices, {
				id = workspace.name,
				label = label,
			})
		end

		window:perform_action(
			wezterm.action.InputSelector({
				action = wezterm.action_callback(function(window, pane, id, label)
					if id then
						switch_to_workspace(id, window, pane)
					end
				end),
				title = "Select Workspace",
				choices = choices,
				fuzzy = true,
			}),
			pane
		)
	end)

	wezterm.log_info("Workspace configuration applied successfully")
end

return module
