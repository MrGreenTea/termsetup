local wezterm = require("wezterm")

local module = {}

-- Get pane dimensions safely with error handling
local function get_pane_dimensions(pane)
	local success, dimensions = pcall(function()
		return pane:get_dimensions()
	end)

	if success and dimensions then
		return dimensions
	else
		wezterm.log_warn("Failed to get pane dimensions, using fallback")
		return { cols = 80, viewport_rows = 24 } -- Safe fallback
	end
end

-- Smart split function that chooses direction based on terminal size
function module.smart_split(window, pane)
	local dimensions = get_pane_dimensions(pane)
	local split_direction = (dimensions.cols > 120) and "Right" or "Bottom"

	wezterm.log_info("Smart split: terminal width=" .. dimensions.cols .. ", direction=" .. split_direction)

	local success, new_pane = pcall(function()
		return pane:split({
			direction = split_direction,
			domain = "CurrentPaneDomain",
		})
	end)

	if success then
		return new_pane
	else
		wezterm.log_warn("Smart split failed, falling back to default vertical split")
		return pane:split({ direction = "Bottom", domain = "CurrentPaneDomain" })
	end
end

-- Improved pane navigation using arrow keys (standard in IDEs, no conflicts)
function module.create_pane_navigation()
	wezterm.log_info("Creating pane navigation bindings")
	local mods = "CTRL|SHIFT"
	return {
		{ key = "LeftArrow", mods = mods, action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "RightArrow", mods = mods, action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "UpArrow", mods = mods, action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "DownArrow", mods = mods, action = wezterm.action.ActivatePaneDirection("Down") },
	}
end

-- Pane resizing with Ctrl+Alt+Arrow keys (avoiding system conflicts for vertical)
function module.create_pane_resize_bindings()
	wezterm.log_info("Creating pane resize bindings")
	local mods = "CTRL|ALT"
	return {
		{ key = "LeftArrow", mods = mods, action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
		{ key = "RightArrow", mods = mods, action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
		{ key = "UpArrow", mods = mods, action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
		{ key = "DownArrow", mods = mods, action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	}
end

-- Improved split key bindings with intuitive visual symbols
function module.create_smart_split_bindings()
	wezterm.log_info("Creating smart split bindings")
	return {
		-- Smart split - automatically chooses best direction
		{
			key = "s",
			mods = "CTRL|SHIFT",
			action = wezterm.action_callback(function(window, pane)
				module.smart_split(window, pane)
			end),
		},
		-- Manual vertical split (creates vertical line like |)
		{
			key = "|",
			mods = "CTRL|SHIFT",
			action = wezterm.action_callback(function(window, pane)
				pane:split({ direction = "Right", domain = "CurrentPaneDomain" })
			end),
		},
		-- Manual horizontal split (creates horizontal line like _)
		{
			key = "_",
			mods = "CTRL|SHIFT",
			action = wezterm.action_callback(function(window, pane)
				pane:split({ direction = "Bottom", domain = "CurrentPaneDomain" })
			end),
		},
	}
end

-- Improved zoom toggle with intuitive "Z" for zoom
function module.create_zoom_bindings()
	wezterm.log_info("Creating zoom toggle bindings")
	return {
		{ key = "z", mods = "CTRL|SHIFT", action = wezterm.action.TogglePaneZoomState },
	}
end

-- Combine all pane-related key bindings
function module.get_all_pane_bindings()
	local bindings = {}

	-- Add navigation bindings
	local nav_bindings = module.create_pane_navigation()
	for _, binding in ipairs(nav_bindings) do
		table.insert(bindings, binding)
	end

	-- Add resize bindings
	local resize_bindings = module.create_pane_resize_bindings()
	for _, binding in ipairs(resize_bindings) do
		table.insert(bindings, binding)
	end

	-- Add split bindings
	local split_bindings = module.create_smart_split_bindings()
	for _, binding in ipairs(split_bindings) do
		table.insert(bindings, binding)
	end

	-- Add zoom bindings
	local zoom_bindings = module.create_zoom_bindings()
	for _, binding in ipairs(zoom_bindings) do
		table.insert(bindings, binding)
	end

	wezterm.log_info("Total pane bindings created: " .. #bindings)
	return bindings
end

function module.apply_to_config(config)
	wezterm.log_info("Panes module loaded with smart split and navigation functionality")
end

return module
