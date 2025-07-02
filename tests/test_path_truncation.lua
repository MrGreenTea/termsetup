-- Test the truncate_path function from workspaces.lua
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
local truncate_path = workspaces._truncate_path

-- Test cases based on specification section 5.1
local test_cases = {
	-- No truncation needed
	{
		path = "~/Development/project",
		max_width = 30,
		expected = "~/Development/project",
	},
	{ path = "~/Code/app", max_width = 20, expected = "~/Code/app" },
	{ path = "~/short", max_width = 15, expected = "~/short" },

	-- Truncation needed - preserve end of path
	{ path = "~/Development/very-long-project-name/src", max_width = 20, expected = "…/src" },
	{
		path = "~/Development/extremely-long-project-name-here/src/components",
		max_width = 25,
		expected = "…/src/components",
	},
	{ path = "~/Development/my-super-long-project-name-that-goes-on/dist", max_width = 30, expected = "…/dist" },

	-- Edge cases - minimum readability
	{ path = "~/Development/very-long-path/here", max_width = 10, expected = "…/here" },
	{ path = "~/Development/project", max_width = 9, expected = "…/project" },
	{ path = "~/a/b/c/d/e/f/g", max_width = 8, expected = "…/e/f/g" },

	-- Boundary conditions
	{ path = "~/Development/project", max_width = 19, expected = "…/project" }, -- Just over
	{ path = "~/Development/project", max_width = 21, expected = "~/Development/project" }, -- Just exact
	{ path = "~/Development/project", max_width = 22, expected = "~/Development/project" }, -- Just one more
	{ path = "short", max_width = 5, expected = "short" }, -- Already short
	{ path = "~/Development/project", max_width = 8, expected = "…project" }, -- Just over single component
	{ path = "~/Development/project", max_width = 7, expected = "…roject" }, -- Bit over single component

	-- Special cases
	{ path = "", max_width = 10, expected = "" },
	{ path = nil, max_width = 10, expected = "" },
	{
		path = "~/single-file",
		max_width = 50,
		expected = "~/single-file",
	},

	-- Very long single component
	{
		path = "~/very-very-very-long-single-filename",
		max_width = 20,
		expected = "…ong-single-filename",
	},
}

print("Testing truncate_path function:")
for i, test in ipairs(test_cases) do
	local result = truncate_path(test.path, test.max_width)
	local expected = test.expected
	local status = result == expected and "✓" or "✗"
	print(
		string.format(
			"%s Test %d: '%s' (max:%d) -> '%s' (expected: '%s')",
			status,
			i,
			tostring(test.path),
			test.max_width,
			result,
			expected
		)
	)
end
