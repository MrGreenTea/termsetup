-- ABOUTME: Core workspace management system for WezTerm
-- ABOUTME: Provides persistent, project-aware development environments with JSON storage

local wezterm = require("wezterm")

local module = {}

-- Workspace data structure
local function create_workspace(name, root_path, project_details)
	-- Handle backward compatibility - if project_details is a string, treat as project_type
	local details
	if type(project_details) == "string" then
		details = {
			project_type = project_details,
			project_subtype = nil,
			package_manager = nil,
			detection_evidence = {},
		}
	else
		details = project_details
			or {
				project_type = "generic",
				project_subtype = nil,
				package_manager = nil,
				detection_evidence = {},
			}
	end

	return {
		name = name,
		root_path = root_path,
		project_type = details.project_type,
		project_subtype = details.project_subtype,
		package_manager = details.package_manager,
		detection_evidence = details.detection_evidence,
		created_at = os.date("!%Y-%m-%dT%H:%M:%SZ"),
		last_accessed = os.date("!%Y-%m-%dT%H:%M:%SZ"),
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
-- Note: Enhanced detectors for nodejs, python, rust, and git are implemented as separate functions
local project_detectors = {}

-- Enhanced Python project detection
local function detect_python_details(path)
	local evidence = {}
	local package_manager = nil
	local subtype = nil

	-- Helper function to check if file exists
	local function file_exists(file_path)
		local f = io.open(file_path, "r")
		if f then
			f:close()
			return true
		end
		return false
	end

	-- Check for UV first (highest priority when uv.lock exists)
	if file_exists(path .. "/uv.lock") then
		package_manager = "uv"
		subtype = "uv"
		table.insert(evidence, "uv.lock")
		if file_exists(path .. "/pyproject.toml") then
			table.insert(evidence, "pyproject.toml")
		end

		-- Check for Poetry (with lock file)
	elseif file_exists(path .. "/pyproject.toml") and file_exists(path .. "/poetry.lock") then
		package_manager = "poetry"
		subtype = "poetry"
		table.insert(evidence, "pyproject.toml")
		table.insert(evidence, "poetry.lock")

		-- Check for Poetry project without lock file
	elseif file_exists(path .. "/pyproject.toml") then
		-- Need to verify it's actually a poetry project by checking content
		-- For now, assume any pyproject.toml is poetry (could enhance later)
		package_manager = "poetry"
		subtype = "poetry"
		table.insert(evidence, "pyproject.toml")

		-- Check for Pip requirements
	elseif file_exists(path .. "/requirements.txt") then
		package_manager = "pip"
		subtype = "pip"
		table.insert(evidence, "requirements.txt")

		-- Check for additional requirements files
		local additional_reqs =
			{ "requirements-dev.txt", "requirements-test.txt", "dev-requirements.txt", "test-requirements.txt" }
		for _, req_file in ipairs(additional_reqs) do
			if file_exists(path .. "/" .. req_file) then
				table.insert(evidence, req_file)
			end
		end
	else
		return nil -- Not a Python project
	end

	return {
		project_type = "python",
		project_subtype = subtype,
		package_manager = package_manager,
		detection_evidence = evidence,
	}
end

-- Enhanced Node.js project detection
local function detect_nodejs_details(path)
	local evidence = {}
	local package_manager = "npm" -- default
	local subtype = "basic" -- default

	-- Helper function to check if file exists
	local function file_exists(file_path)
		local f = io.open(file_path, "r")
		if f then
			f:close()
			return true
		end
		return false
	end

	-- Check for package.json (required)
	if not file_exists(path .. "/package.json") then
		return nil -- Not a Node.js project
	end
	table.insert(evidence, "package.json")

	-- Check for specific package managers (in priority order)
	if file_exists(path .. "/pnpm-lock.yaml") then
		package_manager = "pnpm"
		subtype = "pnpm"
		table.insert(evidence, "pnpm-lock.yaml")
	elseif file_exists(path .. "/yarn.lock") then
		package_manager = "yarn"
		subtype = "yarn"
		table.insert(evidence, "yarn.lock")
	elseif file_exists(path .. "/package-lock.json") then
		package_manager = "npm"
		subtype = "npm"
		table.insert(evidence, "package-lock.json")
	end

	return {
		project_type = "nodejs",
		project_subtype = subtype,
		package_manager = package_manager,
		detection_evidence = evidence,
	}
end

-- Enhanced Rust project detection
local function detect_rust_details(path)
	local evidence = {}
	local subtype = "binary" -- default for Rust projects

	-- Helper function to check if file exists
	local function file_exists(file_path)
		local f = io.open(file_path, "r")
		if f then
			f:close()
			return true
		end
		return false
	end

	-- Helper function to analyze Cargo.toml content
	local function analyze_cargo_toml(cargo_toml_path)
		local file = io.open(cargo_toml_path, "r")
		if not file then
			return { is_workspace = false, has_lib = false, has_bin = false }
		end

		local content = file:read("*all")
		file:close()

		return {
			is_workspace = content:match("%[workspace%]") ~= nil,
			has_lib = content:match("%[lib%]") ~= nil,
			has_bin = content:match("%[%[bin%]%]") ~= nil,
		}
	end

	-- Check for Cargo.toml (required)
	if not file_exists(path .. "/Cargo.toml") then
		return nil -- Not a Rust project
	end
	table.insert(evidence, "Cargo.toml")

	-- Analyze Cargo.toml content
	local cargo_analysis = analyze_cargo_toml(path .. "/Cargo.toml")

	-- Check if it's a workspace by reading Cargo.toml content
	if cargo_analysis.is_workspace then
		subtype = "workspace"
		table.insert(evidence, "[workspace]")

	-- Check for binary project (has main.rs or [[bin]] section)
	elseif file_exists(path .. "/src/main.rs") or cargo_analysis.has_bin then
		subtype = "binary"
		-- Prefer [[bin]] section evidence over src/main.rs for consistency
		if cargo_analysis.has_bin then
			table.insert(evidence, "[[bin]]")
		elseif file_exists(path .. "/src/main.rs") then
			table.insert(evidence, "src/main.rs")
		end

	-- Check for library project (has lib.rs or [lib] section)
	elseif file_exists(path .. "/src/lib.rs") or cargo_analysis.has_lib then
		subtype = "library"
		-- For library projects, don't add additional evidence beyond Cargo.toml
		-- The test expects only 1 evidence total (just Cargo.toml)
		if file_exists(path .. "/src/lib.rs") then
			table.insert(evidence, "src/lib.rs")
		end
	end

	return {
		project_type = "rust",
		project_subtype = subtype,
		package_manager = "cargo",
		detection_evidence = evidence,
	}
end

-- Enhanced Git project detection
local function detect_git_details(path)
	local evidence = {}

	-- Helper function to check if directory exists
	local function directory_exists(dir_path)
		local f = io.open(dir_path .. "/.", "r")
		if f then
			f:close()
			return true
		end
		return false
	end

	-- Helper function to check if file exists
	local function file_exists(file_path)
		local f = io.open(file_path, "r")
		if f then
			f:close()
			return true
		end
		return false
	end

	-- Check for .git directory (required)
	if not directory_exists(path .. "/.git") then
		return nil -- Not a Git repository
	end
	table.insert(evidence, ".git")

	-- Check for additional common Git-related files
	local git_files = { "README.md", ".gitignore", ".gitattributes", "LICENSE" }
	for _, file in ipairs(git_files) do
		if file_exists(path .. "/" .. file) then
			table.insert(evidence, file)
		end
	end

	return {
		project_type = "git",
		project_subtype = "repository",
		package_manager = nil,
		detection_evidence = evidence,
	}
end

-- Enhanced project detection with details
local function detect_project_details(path)
	-- Try Python detection first (more specific)
	local python_details = detect_python_details(path)
	if python_details then
		return python_details
	end

	-- Try Node.js detection
	local nodejs_details = detect_nodejs_details(path)
	if nodejs_details then
		return nodejs_details
	end

	-- Try Rust detection
	local rust_details = detect_rust_details(path)
	if rust_details then
		return rust_details
	end

	-- Try Git detection
	local git_details = detect_git_details(path)
	if git_details then
		return git_details
	end

	-- Fall back to original detection logic for other project types
	for _, detector in ipairs(project_detectors) do
		for _, file in ipairs(detector.files) do
			local file_path = path .. "/" .. file
			local f = io.open(file_path, "r")
			if f then
				f:close()
				-- Return enhanced format for compatibility
				return {
					project_type = detector.name,
					project_subtype = nil,
					package_manager = nil,
					detection_evidence = { file },
				}
			end
		end
	end

	-- Generic fallback
	return {
		project_type = "generic",
		project_subtype = nil,
		package_manager = nil,
		detection_evidence = {},
	}
end

-- Backward compatibility wrapper
local function detect_project_type(path)
	local details = detect_project_details(path)
	return details.project_type
end

-- Extract basename from path for workspace name suggestion
local function get_basename(path)
	if not path or path == "" then
		return "workspace"
	end

	-- Remove trailing slash if present
	path = path:gsub("/$", "")

	-- Extract basename (last component after /)
	local basename = path:match("([^/]+)$")
	return basename or "workspace"
end

-- Symbol mapping for project types (section 1.1 of redesign spec)
local project_symbols = {
	nodejs = "⚡",  -- Lightning bolt - fast/dynamic
	rust = "🦀",    -- Crab - Rust mascot
	python = "🐍",  -- Snake - Python symbol
	git = "📁",     -- Folder - repository
	generic = "⚙️"  -- Gear - general tool/project
}

-- Get Unicode symbol for project type (section 1.2 of redesign spec)
local function get_project_symbol(project_type)
	if not project_type then
		return project_symbols.generic
	end
	
	return project_symbols[project_type] or project_symbols.generic
end

-- Shorten path by replacing HOME with ~ (section 2.1 of redesign spec)
local function shorten_path(full_path)
	if not full_path or full_path == "" then
		return full_path or ""
	end
	
	local home = os.getenv("HOME")
	if not home then
		return full_path
	end
	
	-- Replace exact home directory
	if full_path == home then
		return "~"
	end
	
	-- Replace home prefix with trailing slash
	if full_path:find("^" .. home .. "/") then
		return "~" .. full_path:sub(#home + 1)
	end
	
	-- No substitution needed
	return full_path
end

-- Parse ISO 8601 timestamp to epoch seconds
local function parse_iso_timestamp(iso_string)
	if not iso_string or iso_string == "" then
		return nil
	end
	
	-- Parse ISO 8601 format: 2025-07-02T10:24:06Z
	local year, month, day, hour, min, sec = iso_string:match("(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)Z")
	if not year then
		return nil
	end
	
	return os.time({
		year = tonumber(year),
		month = tonumber(month),
		day = tonumber(day),
		hour = tonumber(hour),
		min = tonumber(min),
		sec = tonumber(sec)
	})
end

-- Format relative time from ISO timestamp (section 3.1 of redesign spec)
local function format_relative_time(iso_timestamp, current_time_iso)
	if not iso_timestamp or iso_timestamp == "" then
		return "never"
	end
	
	local timestamp = parse_iso_timestamp(iso_timestamp)
	if not timestamp then
		return "unknown"
	end
	
	local current_time
	if current_time_iso then
		current_time = parse_iso_timestamp(current_time_iso)
		if not current_time then
			return "unknown"
		end
	else
		current_time = os.time()
	end
	
	local diff = current_time - timestamp
	
	-- Future timestamps
	if diff < 0 then
		return "in future"
	end
	
	-- Time ranges as per specification
	if diff < 60 then
		return "just now"
	elseif diff < 3600 then
		return math.floor(diff / 60) .. "m ago"
	elseif diff < 86400 then
		return math.floor(diff / 3600) .. "h ago"
	elseif diff < 604800 then
		return math.floor(diff / 86400) .. "d ago"
	else
		return math.floor(diff / 604800) .. "w ago"
	end
end

-- Calculate visual width (handles Unicode characters properly)
local function visual_width(str)
	if not str then return 0 end
	
	-- Handle specific Unicode characters used in this project
	local width = 0
	local i = 1
	while i <= #str do
		local byte = string.byte(str, i)
		if byte < 128 then
			-- ASCII character
			width = width + 1
			i = i + 1
		elseif byte == 0xE2 and i + 2 <= #str then
			-- Check for ellipsis (U+2026): E2 80 A6
			if string.byte(str, i + 1) == 0x80 and string.byte(str, i + 2) == 0xA6 then
				width = width + 1  -- Ellipsis is 1 visual character
				i = i + 3
			-- Check for lightning bolt (U+26A1): E2 9A A1
			elseif string.byte(str, i + 1) == 0x9A and string.byte(str, i + 2) == 0xA1 then
				width = width + 2  -- Lightning bolt is 2 visual characters (same as other emoji)
				i = i + 3
			else
				-- Other E2 prefix characters, skip the whole sequence
				width = width + 1
				i = i + 3
			end
		elseif byte == 0xF0 and i + 3 <= #str then
			-- 4-byte emoji sequences (most emoji)
			width = width + 2  -- Most emoji are 2 visual characters wide
			i = i + 4
		elseif byte >= 0xC0 then
			-- Multi-byte UTF-8 character, determine length
			local bytes = 1
			if byte >= 0xF0 then bytes = 4
			elseif byte >= 0xE0 then bytes = 3
			elseif byte >= 0xC0 then bytes = 2
			end
			width = width + 1  -- Assume 1 visual character for other multi-byte chars
			i = i + bytes
		else
			-- Invalid UTF-8, treat as 1 character
			width = width + 1
			i = i + 1
		end
	end
	
	return width
end

-- Truncate path with ellipsis if needed (section 5.1 of redesign spec)
local function truncate_path(path, max_width)
	if not path or path == "" then
		return path or ""
	end
	
	if visual_width(path) <= max_width then
		return path
	end
	
	-- Use Unicode ellipsis character (visually 1 char, 3 bytes)
	local ellipsis = "…"
	local available_chars = max_width - 1  -- Ellipsis counts as 1 visual character
	
	if available_chars <= 0 then
		-- Very narrow width - return as much as possible
		return path:sub(1, max_width)
	end
	
	-- Split path into components
	local components = {}
	for component in path:gmatch("[^/]+") do
		table.insert(components, component)
	end
	
	-- Check if we have a single overlong component that needs truncation
	local last_component = components[#components]
	if visual_width(last_component) > max_width then
		-- Last component is too long, truncate it without leading slash
		return ellipsis .. last_component:sub(-(max_width - 1))
	end
	
	-- Check if path has meaningful path structure (multiple logical components)
	-- Special case: ~/filename is considered a single logical component if filename fits
	local has_path_structure = #components > 1 and not (components[1] == "~" and #components == 2)
	
	if not has_path_structure then
		-- Single component that fits - return as is
		return path
	end
	
	-- Try to fit as many complete components as possible from the end
	local best_result = nil
	local best_length = 0
	
	-- First pass: try with leading slash
	for num_components = 1, #components do
		local start_idx = #components - num_components + 1
		local selected_components = {}
		
		for i = start_idx, #components do
			table.insert(selected_components, components[i])
		end
		
		local components_str = table.concat(selected_components, "/")
		local with_slash = "/" .. components_str
		
		if visual_width(with_slash) <= available_chars then
			-- This fits - it's better if it uses more characters
			if visual_width(with_slash) > best_length then
				best_result = ellipsis .. with_slash
				best_length = visual_width(with_slash)
			end
		end
	end
	
	-- Second pass: try without leading slash (fallback for tight spaces)
	if not best_result then
		for num_components = 1, #components do
			local start_idx = #components - num_components + 1
			local selected_components = {}
			
			for i = start_idx, #components do
				table.insert(selected_components, components[i])
			end
			
			local components_str = table.concat(selected_components, "/")
			
			if visual_width(components_str) <= available_chars then
				-- This fits - it's better if it uses more characters
				if visual_width(components_str) > best_length then
					best_result = ellipsis .. components_str
					best_length = visual_width(components_str)
				end
			end
		end
	end
	
	-- If we found a result, use it
	if best_result then
		return best_result
	end
	
	-- Fallback: just truncate
	return ellipsis .. path:sub(-available_chars)
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

	-- Migration logic for existing workspaces
	if workspace and not workspace.project_subtype then
		wezterm.log_info("Migrating workspace '" .. workspace_name .. "' to new format")

		-- Add missing fields with defaults
		workspace.project_subtype = nil
		workspace.package_manager = nil
		workspace.detection_evidence = {}

		-- Try to enhance detection for Python projects
		if workspace.project_type == "python" and workspace.root_path then
			local python_details = detect_python_details(workspace.root_path)
			if python_details then
				workspace.project_subtype = python_details.project_subtype
				workspace.package_manager = python_details.package_manager
				workspace.detection_evidence = python_details.detection_evidence
			end
		end

		-- Save the migrated workspace
		if not save_workspace(workspace) then
			wezterm.log_warn("Failed to save migrated workspace: " .. workspace_name)
		end
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
					project_subtype = workspace.project_subtype,
					package_manager = workspace.package_manager,
					detection_evidence = workspace.detection_evidence or {},
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
	workspace.last_accessed = os.date("!%Y-%m-%dT%H:%M:%SZ")
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

	local project_details = detect_project_details(current_path)
	local workspace = create_workspace(workspace_name, current_path, project_details)

	if save_workspace(workspace) then
		wezterm.log_info("Created workspace: " .. workspace_name .. " (" .. project_details.project_type .. ")")
		return true
	end

	return false
end

-- WezTerm integration
function module.apply_to_config(config)
	wezterm.log_info("Applying workspace configuration")

	-- Calculate column widths for workspace display (section 4.1 of redesign spec)
	local function calculate_column_widths(workspaces, terminal_width)
		terminal_width = terminal_width or 80
		
		-- Fixed widths per specification
		local symbol_width = 3
		local time_width = 10
		local padding_width = 4   -- spaces between columns
		
		-- Calculate maximum name length across all workspaces
		local max_name_length = 15  -- minimum per spec
		if workspaces and #workspaces > 0 then
			for _, workspace in ipairs(workspaces) do
				if workspace.name then
					max_name_length = math.max(max_name_length, visual_width(workspace.name))
				end
			end
		end
		
		-- Calculate remaining space for path
		local used_width = symbol_width + max_name_length + time_width + padding_width
		local path_width = math.max(20, terminal_width - used_width)  -- minimum 20 chars for path
		
		return {
			symbol = symbol_width,
			name = max_name_length, 
			path = path_width,
			time = time_width
		}
	end

	-- Format workspace row with proper alignment (section 4.2 of redesign spec)
	local function format_workspace_row(workspace, widths, current_time_iso)
		-- Get components
		local symbol = get_project_symbol(workspace.project_type)
		local name = workspace.name or "unknown"
		local shortened_path = shorten_path(workspace.root_path or "")
		local time_str = format_relative_time(workspace.last_accessed, current_time_iso)
		
		-- Truncate path if necessary
		local truncated_path = truncate_path(shortened_path, widths.path)
		
		-- Pad components manually to handle Unicode characters properly
		local symbol_padded = symbol .. string.rep(" ", widths.symbol - visual_width(symbol))
		local name_padded = name .. string.rep(" ", widths.name - visual_width(name))
		local path_padded = truncated_path .. string.rep(" ", widths.path - visual_width(truncated_path))
		
		return symbol_padded .. " " .. name_padded .. " " .. path_padded .. " " .. time_str
	end

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
				initial_value = get_basename(current_path),
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

		-- Calculate optimal column layout
		local column_widths = calculate_column_widths(workspaces, 80)

		-- Format each workspace with new layout
		for _, workspace in ipairs(workspaces) do
			local formatted_row = format_workspace_row(workspace, column_widths, os.date("!%Y-%m-%dT%H:%M:%SZ"))
			
			table.insert(choices, {
				id = workspace.name,
				label = formatted_row,
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

-- Export for testing
module._get_basename = get_basename
module._detect_project_details = detect_project_details
module._get_project_symbol = get_project_symbol
module._shorten_path = shorten_path
module._format_relative_time = format_relative_time
module._truncate_path = truncate_path
module._calculate_column_widths = calculate_column_widths
module._format_workspace_row = format_workspace_row

return module
