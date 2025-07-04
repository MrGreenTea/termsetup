#!/usr/bin/env lua

-- URL Detection Test Suite for WezTerm Quick Select Patterns
-- Tests the patterns defined in configs/wezterm/quick_select.lua

local function load_patterns()
    -- Load patterns from quick_select.lua
    local quick_select_path = "configs/wezterm/quick_select.lua"
    local patterns = dofile(quick_select_path)
    return patterns
end

local function test_url_detection(patterns, input, expected, description)
    local matched = false
    local actual_match = nil
    
    -- Try each pattern until one matches
    for i, pattern in ipairs(patterns) do
        local match = string.match(input, pattern)
        if match then
            matched = true
            actual_match = match
            break
        end
    end
    
    local passed = actual_match == expected
    
    print(string.format("Test: %s", description))
    print(string.format("Input:    '%s'", input))
    print(string.format("Expected: '%s'", expected or "nil"))
    print(string.format("Got:      '%s'", actual_match or "nil"))
    print(string.format("Result:   %s", passed and "PASS" or "FAIL"))
    print(string.rep("-", 50))
    
    return passed
end

local function run_tests()
    local patterns = load_patterns()
    
    -- Test cases: {input, expected_output, description}
    local test_cases = {
        -- Case 1: URL in parentheses
        {"Go to the PR (https://github.com/YoungVision-eV/website/pulls/10)", 
         "https://github.com/YoungVision-eV/website/pulls/10", 
         "URL in parentheses"},
        
        -- Case 2: URL in JSON quotes
        {'{\"url\": \"https://example.org\"}', 
         "https://example.org", 
         "URL in JSON quotes"},
        
        -- Case 3: URL with sentence-ending period
        {"INFO: will go to https://example.org/logs/123.", 
         "https://example.org/logs/123", 
         "URL with sentence-ending period"},
        
        -- Case 4: Valid URL with file extension (should preserve period)
        {"Download from https://example.com/file.pdf for details", 
         "https://example.com/file.pdf", 
         "URL with valid file extension"},
        
        -- Case 5: URL with balanced parentheses (should preserve)
        {"See https://en.wikipedia.org/wiki/URL_(computing) for info", 
         "https://en.wikipedia.org/wiki/URL_(computing)", 
         "URL with balanced parentheses"},
        
        -- Case 6: URL with query parameters
        {"Access https://example.com?foo=bar&baz=qux to continue", 
         "https://example.com?foo=bar&baz=qux", 
         "URL with query parameters"},
        
        -- Case 7: URL with quotes in query parameters
        {"Visit \"https://example.com?search=test&q=hello\" for results", 
         "https://example.com?search=test&q=hello", 
         "URL with quotes in query parameters"}
    }
    
    print("WezTerm URL Detection Test Suite")
    print("=================================")
    print()
    
    local total_tests = 0
    local passed_tests = 0
    
    -- Test each case against all patterns (succeed if any pattern matches)
    for j, test_case in ipairs(test_cases) do
        local input, expected, description = test_case[1], test_case[2], test_case[3]
        
        print(string.format("Test Case %d:", j))
        
        local passed = test_url_detection(patterns, input, expected, description)
        
        total_tests = total_tests + 1
        if passed then
            passed_tests = passed_tests + 1
        end
        
        print()
    end
    
    -- Summary
    print(string.rep("=", 60))
    print(string.format("Test Summary: %d/%d tests passed", passed_tests, total_tests))
    print(string.format("Success Rate: %.1f%%", (passed_tests / total_tests) * 100))
    
    if passed_tests == total_tests then
        print("🎉 All tests passed!")
    else
        print("❌ Some tests failed - patterns need improvement")
    end
end

-- Run the tests
run_tests()