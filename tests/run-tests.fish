#!/usr/bin/env fish

# Run all Lua test files in the current directory
for test in *.lua
    echo "Running $test..."
    lua $test
    echo
end
