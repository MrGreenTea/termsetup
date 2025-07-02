# WezTerm Workspaces Redesign Specification

## Overview

This specification defines the implementation of pretty symbols and column-based display for WezTerm workspace project types, transforming the workspace listing from basic text indicators to a visually enhanced, scannable interface.

## Current State vs Target State

### Current Display Format
```
[nodejs/pnpm] my-project - /var/home/jonas/Development/my-project (last: 2025-07-02T10:24:06Z)
[rust] rust-project - /var/home/jonas/Code/systems/rust-project (last: 2025-07-01T15:30:12Z)
```

### Target Display Format
```
⚡  my-nodejs-app       ~/Development/web       2h ago
🦀  rust-project        ~/Code/systems          1d ago  
🐍  data-analysis       ~/Projects/ml           3d ago
📁  documentation       ~/Documents/wiki        1w ago
⚙️  generic-tool        ~/Tools/utils           just now
```

## Architecture

### Component Structure
```
Foundation Layer:
├── Symbol Mapping (project_type → Unicode symbol)
├── Path Shortening ($HOME → ~)
└── Time Formatting (ISO timestamp → relative time)

Layout Engine:
├── Column Width Calculation (adaptive sizing)
└── Row Formatting (aligned output)

Integration Layer:
└── Display Logic Replacement (InputSelector integration)
```

## Technical Specifications

### 1. Symbol Mapping System

#### 1.1 Symbol Dictionary
```lua
local project_symbols = {
    nodejs = "⚡",  -- Lightning bolt - fast/dynamic
    rust = "🦀",    -- Crab - Rust mascot
    python = "🐍",  -- Snake - Python symbol
    git = "📁",     -- Folder - repository
    generic = "⚙️"  -- Gear - general tool/project
}
```

#### 1.2 Function Specification
```lua
function get_project_symbol(project_type)
```

**Parameters:**
- `project_type` (string): Primary project type ("nodejs", "rust", "python", "git", "generic")

**Returns:**
- (string): Unicode symbol

**Behavior:**
- Return Unicode symbol for project type
- Unknown types: Default to generic symbol

### 2. Path Shortening System

#### 2.1 Function Specification
```lua
function shorten_path(full_path)
```

**Parameters:**
- `full_path` (string): Absolute filesystem path

**Returns:**
- (string): Shortened path with ~ substitution

**Behavior:**
- Replace `$HOME` prefix with `~`
- Preserve full path structure beyond home directory
- Handle edge cases (empty paths, non-home paths)
- Maintain accuracy for path navigation

#### 2.2 Examples
```lua
-- Input:  "/var/home/jonas/Development/my-project"
-- Output: "~/Development/my-project"

-- Input:  "/opt/homebrew/bin"
-- Output: "/opt/homebrew/bin"  -- No change

-- Input:  "/var/home/jonas"
-- Output: "~"
```

### 3. Relative Time Formatting

#### 3.1 Function Specification
```lua
function format_relative_time(iso_timestamp)
```

**Parameters:**
- `iso_timestamp` (string): ISO 8601 timestamp ("2025-07-02T10:24:06Z")

**Returns:**
- (string): Human-readable relative time

**Time Ranges:**
| Duration | Format | Example |
|----------|--------|---------|
| 0-59 seconds | "just now" | "just now" |
| 1-59 minutes | "Xm ago" | "5m ago" |
| 1-23 hours | "Xh ago" | "2h ago" |
| 1-6 days | "Xd ago" | "3d ago" |
| 1+ weeks | "Xw ago" | "2w ago" |

**Edge Cases:**
- Future timestamps: "in future"
- Invalid timestamps: "unknown"
- Missing timestamps: "never"

### 4. Layout Engine

#### 4.1 Column Width Calculation
```lua
function calculate_column_widths(workspaces, terminal_width)
```

**Parameters:**
- `workspaces` (array): List of workspace objects
- `terminal_width` (number, optional): Available terminal width (default: 80)

**Returns:**
- (table): Column width specifications
```lua
{
    symbol = 3,      -- Fixed: symbol + space
    name = 25,       -- Dynamic: based on content
    path = 35,       -- Remaining: after other allocations
    time = 10        -- Fixed: "Xd ago" format
}
```

**Algorithm:**
1. Reserve fixed widths: symbol (3) + time (10) + padding (4)
2. Measure maximum name length across all workspaces
3. Ensure minimum name width (15 characters)
4. Allocate remaining space to path (minimum 20 characters)
5. Handle terminal width constraints gracefully

#### 4.2 Row Formatting
```lua
function format_workspace_row(workspace, widths)
```

**Parameters:**
- `workspace` (table): Workspace object with name, project_type, root_path, last_accessed
- `widths` (table): Column width specifications from calculate_column_widths

**Returns:**
- (string): Formatted row with proper alignment

**Format Template:**
```
"%-3s %-[NAME_WIDTH]s %-[PATH_WIDTH]s %s"
```

**Column Alignment:**
- Symbol: Left-aligned, 3 characters
- Name: Left-aligned, padded to calculated width
- Path: Left-aligned, truncated if necessary
- Time: Right-aligned, no padding

### 5. Path Truncation

#### 5.1 Function Specification
```lua
function truncate_path(path, max_width)
```

**Parameters:**
- `path` (string): Path to potentially truncate
- `max_width` (number): Maximum allowed width

**Returns:**
- (string): Truncated path with ellipsis if needed

**Truncation Strategy:**
- Preserve end of path (most specific information)
- Add "..." prefix when truncating
- Ensure minimum readability (never truncate below 10 characters)

**Examples:**
```lua
-- max_width = 20
-- Input:  "~/Development/very-long-project-name/src"
-- Output: "...long-project-name/src"

-- max_width = 30  
-- Input:  "~/Development/my-project"
-- Output: "~/Development/my-project"  -- No truncation needed
```

## Integration Specifications

### 6. Display Logic Replacement

#### 6.1 Target Location
**File:** `configs/wezterm/workspaces.lua`  
**Lines:** 610-627 (current workspace listing logic)

#### 6.2 Current Implementation
```lua
local choices = {}
for _, workspace in ipairs(workspaces) do
    local project_display = workspace.project_type
    if workspace.package_manager then
        project_display = project_display .. "/" .. workspace.package_manager
    elseif workspace.project_subtype then
        project_display = project_display .. "/" .. workspace.project_subtype
    end

    local label = string.format("[%s] %s - %s", project_display, workspace.name, workspace.root_path)
    if workspace.last_accessed then
        label = label .. " (last: " .. workspace.last_accessed .. ")"
    end

    table.insert(choices, {
        id = workspace.name,
        label = label,
    })
end
```

#### 6.3 New Implementation
```lua
local choices = {}

-- Calculate optimal column layout
local column_widths = calculate_column_widths(workspaces, 80)

-- Format each workspace with new layout
for _, workspace in ipairs(workspaces) do
    local formatted_row = format_workspace_row(workspace, column_widths)
    
    table.insert(choices, {
        id = workspace.name,
        label = formatted_row,
    })
end
```

### 7. Function Placement

#### 7.1 Location Strategy
Add new functions near the existing utility functions in `workspaces.lua`:

```lua
-- After line 358 (after get_basename function)
-- Add symbol mapping functions
-- Add path shortening function  
-- Add time formatting function
-- Add layout engine functions
```

#### 7.2 Export Strategy
For testing purposes, export utility functions:
```lua
-- At end of module (around line 650)
module._get_project_symbol = get_project_symbol
module._shorten_path = shorten_path
module._format_relative_time = format_relative_time
module._calculate_column_widths = calculate_column_widths
module._format_workspace_row = format_workspace_row
```

## Testing Specifications

### 8. Unit Test Requirements

#### 8.1 Symbol Mapping Tests
```lua
-- Test cases for get_project_symbol
test_cases = {
    {project_type = "nodejs", expected = "⚡"},
    {project_type = "rust", expected = "🦀"},
    {project_type = "unknown", expected = "⚙️"}
}
```

#### 8.2 Path Shortening Tests
```lua
-- Test cases for shorten_path
test_cases = {
    {input = "/var/home/jonas/Development/project", expected = "~/Development/project"},
    {input = "/opt/homebrew/bin", expected = "/opt/homebrew/bin"},
    {input = "/var/home/jonas", expected = "~"}
}
```

#### 8.3 Time Formatting Tests
```lua
-- Test cases for format_relative_time
test_cases = {
    {input = "2025-07-02T10:24:06Z", current_time = "2025-07-02T10:24:07Z", expected = "just now"},
    {input = "2025-07-02T10:19:06Z", current_time = "2025-07-02T10:24:06Z", expected = "5m ago"},
    {input = "2025-07-02T08:24:06Z", current_time = "2025-07-02T10:24:06Z", expected = "2h ago"}
}
```

#### 8.4 Layout Engine Tests
```lua
-- Test cases for column width calculation
workspaces = {
    {name = "short", project_type = "nodejs", root_path = "~/dev", last_accessed = "2025-07-02T10:24:06Z"},
    {name = "very-long-workspace-name", project_type = "rust", root_path = "~/development/long-path", last_accessed = "2025-07-01T10:24:06Z"}
}

expected_widths = {
    symbol = 3,
    name = 25,  -- Based on longest name
    path = 42,  -- Remaining space
    time = 10
}
```

### 9. Integration Test Requirements

#### 9.1 End-to-End Workflow
1. Create test workspace with known properties
2. Trigger workspace listing display
3. Verify formatted output contains expected elements:
   - Unicode symbols
   - Shortened paths with ~ substitution
   - Relative time formatting
   - Proper column alignment

#### 9.2 Terminal Testing
1. Test symbol rendering across different terminals
2. Verify no functionality regression

## Terminal Requirements

### 11. Terminal Compatibility

#### 11.1 Width Handling
- Support for narrow terminals (minimum 60 characters)
- Responsive layout for wide terminals
- Intelligent content truncation

## Error Handling

### 12. Error Scenarios

#### 12.1 Invalid Data Handling
- **Missing timestamps:** Display "never" instead of crashing
- **Invalid paths:** Display as-is without shortening
- **Malformed workspace data:** Skip formatting, use original display

#### 12.2 Layout Failures
- **Terminal too narrow:** Minimum usable layout with truncation
- **Content too long:** Intelligent truncation with ellipsis
- **Calculation errors:** Log error and use default layout

## Implementation Phases

### 13. Development Sequence

#### 13.1 Phase 1: Foundation (Low Risk)
1. Implement `get_project_symbol` function
2. Implement `shorten_path` function
3. Implement `format_relative_time` function
4. Create unit tests for each function
5. Verify isolated functionality

#### 13.2 Phase 2: Layout Engine (Medium Risk)
1. Implement `calculate_column_widths` function
2. Implement `format_workspace_row` function
3. Create test data for layout validation
4. Test edge cases (long names, paths, narrow terminals)
5. Performance validation

#### 13.3 Phase 3: Integration (Low Risk)
1. Replace workspace listing display logic
2. Test complete workflow end-to-end
3. Validate user experience improvements

### 14. Success Criteria

#### 14.1 Technical Success
- [ ] All utility functions pass comprehensive unit tests
- [ ] Layout engine produces properly aligned output
- [ ] Error handling covers all identified edge cases

#### 14.2 User Experience Success
- [ ] Workspace scanning is visually faster and more pleasant
- [ ] Project types are immediately recognizable via symbols
- [ ] Path information is clear and not overwhelming
- [ ] Time information is intuitive and human-readable
- [ ] Display works consistently across different terminal setups

#### 14.3 Quality Assurance
- [ ] No regressions in existing functionality
- [ ] Comprehensive test coverage (>90% for new functions)
- [ ] Code follows existing project patterns and style

## Future Extensibility

### 15. Extension Points

#### 15.1 New Project Types
- Symbol mapping dictionary easily extensible
- Detection logic can be enhanced without affecting display
- Generic symbol handles unknown types gracefully

#### 15.2 Additional Data Fields
- Column-based layout can accommodate new information
- Width calculation algorithm adapts to content
- Display format is configurable

#### 15.3 User Customization
- Symbol preferences could be user-configurable
- Layout preferences (column widths, ordering)
- Custom symbols for project types

---

**Document Version:** 1.0  
**Target Implementation:** WezTerm Workspaces Phase 2.1  
**Dependencies:** Enhanced project detection (already implemented)  
**Risk Level:** Low-Medium (well-defined scope, clear fallback strategies)