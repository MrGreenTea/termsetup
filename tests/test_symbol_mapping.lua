-- Test the get_project_symbol function from workspaces.lua
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
	on = function() end
}
package.loaded.wezterm = wezterm

local workspaces = require("workspaces")
local get_project_symbol = workspaces._get_project_symbol

-- Test cases based on specification section 8.1
local test_cases = {
	-- Known project types
	{project_type = "nodejs", expected = "⚡"},
	{project_type = "rust", expected = "🦀"},
	{project_type = "python", expected = "🐍"},
	{project_type = "git", expected = "📁"},
	{project_type = "generic", expected = "⚙️"},
	
	-- Unknown types should default to generic
	{project_type = "unknown", expected = "⚙️"},
	{project_type = "java", expected = "⚙️"},
	{project_type = "go", expected = "⚙️"},
	
	-- Edge cases
	{project_type = "", expected = "⚙️"},
	{project_type = nil, expected = "⚙️"},
	{project_type = "NODEJS", expected = "⚙️"}, -- Case sensitive
}

print("Testing get_project_symbol function:")
for i, test in ipairs(test_cases) do
	local result = get_project_symbol(test.project_type)
	local expected = test.expected
	local status = result == expected and "✓" or "✗"
	print(string.format("%s Test %d: '%s' -> '%s' (expected: '%s')", 
		status, i, tostring(test.project_type), result, expected))
end