-- Test the format_relative_time function from workspaces.lua
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
local format_relative_time = workspaces._format_relative_time

-- Helper function to create mock current time for testing
local function test_with_current_time(iso_timestamp, current_time_iso)
	return format_relative_time(iso_timestamp, current_time_iso)
end

-- Test cases based on specification section 8.3
-- Using "2025-01-01T12:00:00Z" as reference time for easy readability
local test_cases = {
	-- Just now (0-59 seconds)
	{input = "2025-01-01T12:00:00Z", current = "2025-01-01T12:00:01Z", desc = "12:00:00 -> 12:00:01 (1s)", expected = "just now"},
	{input = "2025-01-01T12:00:00Z", current = "2025-01-01T12:00:59Z", desc = "12:00:00 -> 12:00:59 (59s)", expected = "just now"},
	
	-- Minutes (1-59 minutes)
	{input = "2025-01-01T11:55:00Z", current = "2025-01-01T12:00:00Z", desc = "11:55 -> 12:00 (5m)", expected = "5m ago"},
	{input = "2025-01-01T11:40:00Z", current = "2025-01-01T12:00:00Z", desc = "11:40 -> 12:00 (20m)", expected = "20m ago"},
	{input = "2025-01-01T11:01:00Z", current = "2025-01-01T12:00:00Z", desc = "11:01 -> 12:00 (59m)", expected = "59m ago"},
	
	-- Hours (1-23 hours)
	{input = "2025-01-01T10:00:00Z", current = "2025-01-01T12:00:00Z", desc = "10:00 -> 12:00 (2h)", expected = "2h ago"},
	{input = "2025-01-01T03:00:00Z", current = "2025-01-01T12:00:00Z", desc = "03:00 -> 12:00 (9h)", expected = "9h ago"},
	{input = "2024-12-31T13:00:00Z", current = "2025-01-01T12:00:00Z", desc = "Dec 31 13:00 -> Jan 1 12:00 (23h)", expected = "23h ago"},
	
	-- Days (1-6 days)
	{input = "2024-12-31T12:00:00Z", current = "2025-01-01T12:00:00Z", desc = "Dec 31 -> Jan 1 (1d)", expected = "1d ago"},
	{input = "2024-12-30T12:00:00Z", current = "2025-01-01T12:00:00Z", desc = "Dec 30 -> Jan 1 (2d)", expected = "2d ago"},
	{input = "2024-12-26T12:00:00Z", current = "2025-01-01T12:00:00Z", desc = "Dec 26 -> Jan 1 (6d)", expected = "6d ago"},
	
	-- Weeks (1+ weeks)
	{input = "2024-12-25T12:00:00Z", current = "2025-01-01T12:00:00Z", desc = "Dec 25 -> Jan 1 (1w)", expected = "1w ago"},
	{input = "2024-12-18T12:00:00Z", current = "2025-01-01T12:00:00Z", desc = "Dec 18 -> Jan 1 (2w)", expected = "2w ago"},
	{input = "2024-11-01T12:00:00Z", current = "2025-01-01T12:00:00Z", desc = "Nov 1 -> Jan 1 (8w)", expected = "8w ago"},
	
	-- Edge cases
	{input = "2025-01-01T12:01:00Z", current = "2025-01-01T12:00:00Z", desc = "Future: 12:01 -> 12:00", expected = "in future"},
	{input = "invalid-timestamp", current = "2025-01-01T12:00:00Z", desc = "Invalid timestamp", expected = "unknown"},
	{input = "", current = "2025-01-01T12:00:00Z", desc = "Empty timestamp", expected = "never"},
	{input = nil, current = "2025-01-01T12:00:00Z", desc = "Nil timestamp", expected = "never"},
	
	-- Boundary conditions
	{input = "2025-01-01T11:59:00Z", current = "2025-01-01T12:00:00Z", desc = "11:59 -> 12:00 (1m exact)", expected = "1m ago"},
	{input = "2025-01-01T11:00:00Z", current = "2025-01-01T12:00:00Z", desc = "11:00 -> 12:00 (1h exact)", expected = "1h ago"},
}

print("Testing format_relative_time function:")
for i, test in ipairs(test_cases) do
	local result = test_with_current_time(test.input, test.current)
	local expected = test.expected
	local status = result == expected and "✓" or "✗"
	print(string.format("%s Test %d: %s -> '%s' (expected: '%s')", 
		status, i, test.desc, result, expected))
end