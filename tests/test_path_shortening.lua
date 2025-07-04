-- Test the shorten_path function from workspaces.lua
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

-- Mock HOME environment variable for consistent testing
local original_home = os.getenv("HOME")
os.getenv = function(var)
	if var == "HOME" then
		return "/var/home/jonas"
	end
	return original_home
end

local workspaces = require("workspaces")
local shorten_path = workspaces._shorten_path

-- Test cases based on specification section 8.2
local test_cases = {
	-- Home directory substitution
	{input = "/var/home/jonas/Development/project", expected = "~/Development/project"},
	{input = "/var/home/jonas/Development/my-project/", expected = "~/Development/my-project/"},
	{input = "/var/home/jonas/Code/systems/rust-project", expected = "~/Code/systems/rust-project"},
	{input = "/var/home/jonas", expected = "~"},
	{input = "/var/home/jonas/", expected = "~/"},
	
	-- Non-home paths (should remain unchanged)
	{input = "/opt/homebrew/bin", expected = "/opt/homebrew/bin"},
	{input = "/usr/local/bin", expected = "/usr/local/bin"},
	{input = "/tmp/workspace", expected = "/tmp/workspace"},
	
	-- Edge cases
	{input = "", expected = ""},
	{input = nil, expected = ""},
	{input = "/", expected = "/"},
	{input = "relative/path", expected = "relative/path"},
	
	-- Different user (should not be shortened)
	{input = "/var/home/other/Development/project", expected = "/var/home/other/Development/project"},
}

print("Testing shorten_path function:")
for i, test in ipairs(test_cases) do
	local result = shorten_path(test.input)
	local expected = test.expected
	local status = result == expected and "✓" or "✗"
	print(string.format("%s Test %d: '%s' -> '%s' (expected: '%s')", 
		status, i, tostring(test.input), result, expected))
end