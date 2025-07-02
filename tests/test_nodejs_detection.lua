-- Test the Node.js project detection from workspaces.lua
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
local detect_project_details = workspaces._detect_project_details

-- Helper function to extract Node.js detection results
local function detect_nodejs_details(path)
    local result = detect_project_details(path)
    -- Only return result if it's a Node.js project
    if result and result.project_type == "nodejs" then
        return result
    end
    return nil
end

-- Test cases: {path, expected_subtype, expected_package_manager, expected_evidence_count, should_detect}
local test_cases = {
    {"test-nodejs-projects/pnpm-project", "pnpm", "pnpm", 2, true}, -- package.json + pnpm-lock.yaml
    {"test-nodejs-projects/yarn-project", "yarn", "yarn", 2, true}, -- package.json + yarn.lock
    {"test-nodejs-projects/npm-project", "npm", "npm", 2, true}, -- package.json + package-lock.json
    {"test-nodejs-projects/basic-project", "basic", "npm", 1, true}, -- package.json only
    {"test-nodejs-projects/mixed-project", "pnpm", "pnpm", 2, true}, -- Should prioritize pnpm
    {"test-nodejs-projects", nil, nil, 0, false}, -- Should not detect
}

print("Testing Node.js project detection:")
local total_tests = 0
local passed_tests = 0

for i, test in ipairs(test_cases) do
    local path, expected_subtype, expected_pkg_mgr, expected_evidence_count, should_detect = 
        test[1], test[2], test[3], test[4], test[5]
    
    local result = detect_nodejs_details(path)
    local test_passed = true
    local details = {}
    
    total_tests = total_tests + 1
    
    -- Check if detection matches expectation
    if should_detect and not result then
        test_passed = false
        table.insert(details, "Expected detection but got nil")
    elseif not should_detect and result then
        test_passed = false
        table.insert(details, "Expected no detection but got result")
    elseif should_detect and result then
        -- Check subtype
        if result.project_subtype ~= expected_subtype then
            test_passed = false
            table.insert(details, string.format("Subtype: got '%s', expected '%s'", 
                tostring(result.project_subtype), tostring(expected_subtype)))
        end
        
        -- Check package manager
        if result.package_manager ~= expected_pkg_mgr then
            test_passed = false
            table.insert(details, string.format("Package mgr: got '%s', expected '%s'", 
                tostring(result.package_manager), tostring(expected_pkg_mgr)))
        end
        
        -- Check evidence count
        if #result.detection_evidence ~= expected_evidence_count then
            test_passed = false
            table.insert(details, string.format("Evidence count: got %d, expected %d", 
                #result.detection_evidence, expected_evidence_count))
        end
    end
    
    if test_passed then
        passed_tests = passed_tests + 1
        print(string.format("✓ Test %d: %s", i, path))
    else
        print(string.format("✗ Test %d: %s", i, path))
        for _, detail in ipairs(details) do
            print("    " .. detail)
        end
        if result then
            print(string.format("    Got: subtype='%s', pkg_mgr='%s', evidence=%d", 
                tostring(result.project_subtype), tostring(result.package_manager), 
                #result.detection_evidence))
        end
    end
end

print(string.format("\nResults: %d/%d tests passed", passed_tests, total_tests))