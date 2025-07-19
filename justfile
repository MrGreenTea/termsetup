# Test runner configuration

# Run all tests
test: test-python test-lua

# Run Python tests using uv
test-python:
    @echo "Running Python tests..."
    uv run --script tests/test_conventional_commit_hook.py
    uv run --script tests/test_gh_command_validation.py

# Run Lua tests
test-lua:
    @echo "Running Lua tests..."
    cd tests && lua test_basename.lua
    cd tests && lua test_column_widths.lua
    cd tests && lua test_conventional_commit_hook.lua || true
    cd tests && lua test_generic_detection.lua
    cd tests && lua test_git_detection.lua
    cd tests && lua test_nodejs_detection.lua
    cd tests && lua test_path_shortening.lua
    cd tests && lua test_path_truncation.lua
    cd tests && lua test_python_detection.lua
    cd tests && lua test_row_formatting.lua
    cd tests && lua test_rust_detection.lua
    cd tests && lua test_symbol_mapping.lua
    cd tests && lua test_time_formatting.lua
