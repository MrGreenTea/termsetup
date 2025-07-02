-- Test the basename function from workspaces.lua
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
local get_basename = workspaces._get_basename

-- Test cases
local test_cases = {
	{"/var/home/jonas/Development/my-project", "my-project"},
	{"/var/home/jonas/Development/my-project/", "my-project"},
	{"/home/user/test", "test"},
	{"/", "workspace"},
	{"", "workspace"},
	{nil, "workspace"},
	{"single-dir", "single-dir"},
	{"/var/home/jonas/Development/node_modules", "node_modules"},
	{"/var/home/jonas/Development/rust-app", "rust-app"},
	{"/var/home/jonas/Development/python-ml-project", "python-ml-project"}
}

print("Testing basename function:")
for i, test in ipairs(test_cases) do
	local result = get_basename(test[1])
	local expected = test[2]
	local status = result == expected and "✓" or "✗"
	print(string.format("%s Test %d: '%s' -> '%s' (expected: '%s')", 
		status, i, tostring(test[1]), result, expected))
end