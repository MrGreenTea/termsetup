-- Test the Python project detection from workspaces.lua
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

-- Helper function to extract Python detection results
local function detect_python_details(path)
    local result = detect_project_details(path)
    -- Only return result if it's a Python project
    if result and result.project_type == "python" then
        return result
    end
    return nil
end

-- Test cases: {path, expected_subtype, expected_package_manager, expected_evidence_count, should_detect}
local test_cases = {
    {"test-python-projects/poetry-project", "poetry", "poetry", 2, true}, -- pyproject.toml + poetry.lock
    {"test-python-projects/uv-project", "uv", "uv", 2, true}, -- uv.lock + pyproject.toml  
    {"test-python-projects/pip-project", "pip", "pip", 2, true}, -- requirements.txt + requirements-dev.txt
    {"test-python-projects/poetry-basic-project", "poetry", "poetry", 1, true}, -- pyproject.toml only
    {"test-python-projects/mixed-project", "poetry", "poetry", 2, true}, -- Should prioritize poetry
    {"test-python-projects", nil, nil, 0, false}, -- Should not detect
}

print("Testing Python project detection:")
local total_tests = 0
local passed_tests = 0

for i, test in ipairs(test_cases) do
    local path, expected_subtype, expected_pkg_mgr, expected_evidence_count, should_detect = 
        test[1], test[2], test[3], test[4], test[5]
    
    local result = detect_python_details(path)
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