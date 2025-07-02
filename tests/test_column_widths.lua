-- Test the calculate_column_widths function from workspaces.lua
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

local workspaces = require("workspaces")
local calculate_column_widths = workspaces._calculate_column_widths

-- Test cases based on specification section 4.1
local test_cases = {
	-- Standard terminal width (80)
	{
		desc = "Standard 80-width terminal with typical workspaces",
		workspaces = {
			{name = "project", project_type = "nodejs", root_path = "~/Development/project"},
			{name = "web-app", project_type = "python", root_path = "~/Code/web-app"},
			{name = "api", project_type = "rust", root_path = "~/Work/api"}
		},
		terminal_width = 80,
		expected = {symbol = 3, name = 15, path = 48, time = 10} -- 80 - 3 - 15 - 10 - 4 = 48
	},
	
	-- Default terminal width (no argument)
	{
		desc = "Default terminal width with no argument",
		workspaces = {
			{name = "short", project_type = "git", root_path = "~/short"}
		},
		terminal_width = nil, -- Should default to 80
		expected = {symbol = 3, name = 15, path = 48, time = 10}
	},
	
	-- Wide terminal
	{
		desc = "Wide terminal (120 chars) with longer workspace names",
		workspaces = {
			{name = "my-very-long-project-name", project_type = "nodejs", root_path = "~/Development/my-very-long-project-name"},
			{name = "short", project_type = "python", root_path = "~/Code/short"}
		},
		terminal_width = 120,
		expected = {symbol = 3, name = 25, path = 78, time = 10} -- 120 - 3 - 25 - 10 - 4 = 78
	},
	
	-- Narrow terminal
	{
		desc = "Narrow terminal (60 chars) - path gets minimum width",
		workspaces = {
			{name = "project", project_type = "rust", root_path = "~/project"}
		},
		terminal_width = 60,
		expected = {symbol = 3, name = 15, path = 28, time = 10} -- 60 - 3 - 15 - 10 - 4 = 28
	},
	
	-- Very narrow terminal  
	{
		desc = "Very narrow terminal (40 chars) - path still gets minimum",
		workspaces = {
			{name = "app", project_type = "git", root_path = "~/app"}
		},
		terminal_width = 40,
		expected = {symbol = 3, name = 15, path = 20, time = 10} -- Minimum path width enforced
	},
	
	-- Empty workspaces list
	{
		desc = "Empty workspaces list - uses minimum name width",
		workspaces = {},
		terminal_width = 80,
		expected = {symbol = 3, name = 15, path = 48, time = 10}
	},
	
	-- Nil workspaces
	{
		desc = "Nil workspaces - uses minimum name width",
		workspaces = nil,
		terminal_width = 80,
		expected = {symbol = 3, name = 15, path = 48, time = 10}
	},
	
	-- Mixed workspace name lengths
	{
		desc = "Mixed workspace name lengths - uses longest",
		workspaces = {
			{name = "a", project_type = "git", root_path = "~/a"},
			{name = "medium-name", project_type = "nodejs", root_path = "~/medium-name"},
			{name = "very-very-very-long-workspace-name", project_type = "python", root_path = "~/long"}
		},
		terminal_width = 100,
		expected = {symbol = 3, name = 34, path = 49, time = 10} -- 100 - 3 - 34 - 10 - 4 = 49
	},
	
	-- Workspaces with nil names (edge case)
	{
		desc = "Workspaces with nil names - handles gracefully",
		workspaces = {
			{name = nil, project_type = "git", root_path = "~/test"},
			{name = "valid-name", project_type = "nodejs", root_path = "~/valid"}
		},
		terminal_width = 80,
		expected = {symbol = 3, name = 15, path = 48, time = 10} -- Uses minimum for nil names
	}
}

print("Testing calculate_column_widths function:")
for i, test in ipairs(test_cases) do
	local result = calculate_column_widths(test.workspaces, test.terminal_width)
	local expected = test.expected
	
	local match = (result.symbol == expected.symbol and 
				   result.name == expected.name and 
				   result.path == expected.path and 
				   result.time == expected.time)
	
	local status = match and "✓" or "✗"
	print(string.format("%s Test %d: %s", status, i, test.desc))
	if not match then
		print(string.format("  Expected: symbol=%d, name=%d, path=%d, time=%d", 
			expected.symbol, expected.name, expected.path, expected.time))
		print(string.format("  Got:      symbol=%d, name=%d, path=%d, time=%d", 
			result.symbol, result.name, result.path, result.time))
	end
end