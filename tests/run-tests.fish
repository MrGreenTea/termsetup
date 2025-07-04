#!/usr/bin/env fish

# Run all Lua test files in the current directory
echo "=== Running Lua Tests ==="
for test in *.lua
    echo "Running $test..."
    lua $test
    echo
end

# Run Python tests
echo "=== Running Python Tests ==="
./test_conventional_commit_hook.py
