-- Test the format_workspace_row function from workspaces.lua
package.path = package.path .. ";../configs/wezterm/?.lua"

-- Mock wezterm module for testing
local wezterm = {
	log_info = function() end,
	log_warn = function() end,
	log_error = function() end,
	action = {},
	action_callback = function() end,
	json_encode = function() end,
	json_parse = function() end,
	on = function() end,
}
package.loaded.wezterm = wezterm

-- Mock HOME environment variable for consistent testing
local original_home = os.getenv("HOME")
os.getenv = function(var)
	if var == "HOME" then
		return "/var/home/jonas"
	end
	return original_home
end

local workspaces = require("workspaces")
local format_workspace_row = workspaces._format_workspace_row

-- Test cases based on specification section 4.2
local test_cases = {
	-- Standard workspace formatting
	{
		desc = "Standard Node.js workspace",
		workspace = {
			name = "web-app",
			project_type = "nodejs",
			root_path = "/var/home/jonas/Development/web-app",
			last_accessed = "2025-01-01T11:55:00Z"
		},
		widths = {symbol = 3, name = 15, path = 30, time = 10},
		current_time = "2025-01-01T12:00:00Z",
		expected = "⚡   web-app         ~/Development/web-app          5m ago"
	},
	
	-- Python workspace with longer name
	{
		desc = "Python workspace with long name",
		workspace = {
			name = "machine-learning-project",
			project_type = "python", 
			root_path = "/var/home/jonas/Code/machine-learning-project",
			last_accessed = "2024-12-31T12:00:00Z"
		},
		widths = {symbol = 3, name = 25, path = 35, time = 10},
		current_time = "2025-01-01T12:00:00Z",
		expected = "🐍  machine-learning-project  ~/Code/machine-learning-project     1d ago"
	},
	
	-- Rust workspace with path truncation
	{
		desc = "Rust workspace with path truncation needed",
		workspace = {
			name = "cli-tool",
			project_type = "rust",
			root_path = "/var/home/jonas/Development/extremely-long-project-name-here/cli-tool",
			last_accessed = "2024-12-18T12:00:00Z"
		},
		widths = {symbol = 3, name = 15, path = 25, time = 10},
		current_time = "2025-01-01T12:00:00Z",
		expected = "🦀  cli-tool        …/cli-tool                2w ago"
	},
	
	-- Git repository
	{
		desc = "Git repository workspace",
		workspace = {
			name = "dotfiles",
			project_type = "git",
			root_path = "/var/home/jonas/dotfiles",
			last_accessed = "2025-01-01T10:00:00Z"
		},
		widths = {symbol = 3, name = 15, path = 20, time = 10},
		current_time = "2025-01-01T12:00:00Z",
		expected = "📁  dotfiles        ~/dotfiles           2h ago"
	},
	
	-- Generic project
	{
		desc = "Generic project workspace",
		workspace = {
			name = "config",
			project_type = "generic",
			root_path = "/var/home/jonas/config",
			last_accessed = "2024-11-01T12:00:00Z"
		},
		widths = {symbol = 3, name = 15, path = 20, time = 10},
		current_time = "2025-01-01T12:00:00Z",
		expected = "⚙️  config          ~/config             8w ago"
	},
	
	-- Edge cases
	{
		desc = "Workspace with no last_accessed",
		workspace = {
			name = "test",
			project_type = "nodejs",
			root_path = "/var/home/jonas/test",
			last_accessed = nil
		},
		widths = {symbol = 3, name = 15, path = 20, time = 10},
		current_time = "2025-01-01T12:00:00Z",
		expected = "⚡   test            ~/test               never"
	},
	
	{
		desc = "Workspace with empty path",
		workspace = {
			name = "empty-path",
			project_type = "python",
			root_path = "",
			last_accessed = "2025-01-01T12:00:00Z"
		},
		widths = {symbol = 3, name = 15, path = 20, time = 10},
		current_time = "2025-01-01T12:00:00Z",
		expected = "🐍  empty-path                           just now"
	},
	
	{
		desc = "Workspace with nil name",
		workspace = {
			name = nil,
			project_type = "rust",
			root_path = "/var/home/jonas/test",
			last_accessed = "2025-01-01T11:59:00Z"
		},
		widths = {symbol = 3, name = 15, path = 20, time = 10},
		current_time = "2025-01-01T12:00:00Z",
		expected = "🦀                  ~/test               1m ago"
	},
	
	{
		desc = "Nil workspace - returns empty string",
		workspace = nil,
		widths = {symbol = 3, name = 15, path = 20, time = 10},
		current_time = "2025-01-01T12:00:00Z",
		expected = ""
	},
	
	-- Very narrow path width
	{
		desc = "Very narrow path width forces truncation",
		workspace = {
			name = "app",
			project_type = "nodejs",
			root_path = "/var/home/jonas/Development/my-application",
			last_accessed = "2025-01-01T11:40:00Z"
		},
		widths = {symbol = 3, name = 15, path = 12, time = 10},
		current_time = "2025-01-01T12:00:00Z",
		expected = "⚡   app             …application 20m ago"
	}
}

-- Helper function to test with mock current time
local function test_format_with_time(workspace, widths, current_time_iso)
	-- Handle nil workspace case
	if workspace == nil then
		return format_workspace_row(nil, widths, current_time_iso)
	end
	
	-- Create a copy of the workspace to avoid modifying the original
	local test_workspace = {}
	for k, v in pairs(workspace) do
		test_workspace[k] = v
	end
	
	return format_workspace_row(test_workspace, widths, current_time_iso)
end

print("Testing format_workspace_row function:")
for i, test in ipairs(test_cases) do
	local result = test_format_with_time(test.workspace, test.widths, test.current_time)
	local expected = test.expected
	local status = result == expected and "✓" or "✗"
	print(string.format("%s Test %d: %s", status, i, test.desc))
	if result ~= expected then
		print(string.format("  Expected: '%s'", expected))
		print(string.format("  Got:      '%s'", result))
		print(string.format("  Length:   Expected %d, Got %d", #expected, #result))
	end
end