# WezTerm Configuration Enhancements Plan

## Overview

Transform the current basic WezTerm configuration into a powerful, productivity-focused terminal multiplexer with advanced features, smart workflows, and excellent user experience.

## Current State Analysis

**Existing Configuration**: `configs/.wezterm.lua`

- ✅ Catppuccin Mocha theme
- ✅ JetBrains Mono font
- ✅ SSH domain configuration
- ✅ Email quick select patterns
- ❌ No custom key bindings
- ❌ No workspace management
- ❌ No status bar customization
- ❌ No command palette

## Proposed Architecture

### Modular Configuration Structure

```
configs/
├── .wezterm.lua              # Main entry point
└── wezterm/
    ├── keybindings.lua       # All key bindings
    ├── appearance.lua        # Themes, fonts, visual config
    ├── workspaces.lua        # Project workspace management
    ├── status.lua            # Status bar configuration
    ├── commands.lua          # Custom commands and palette
    ├── splits.lua            # Smart pane management
    └── utils.lua             # Helper functions
```

## Feature Implementation Plan

### 1. Smart Pane Management (`splits.lua`)

**Intelligent Splitting Logic:**

- **Horizontal Split**: When terminal width > 120 columns
- **Vertical Split**: When terminal height > 30 rows and width <= 120
- **Auto-resize**: Maintain golden ratio (1.618) for optimal readability

**Key Bindings:**

- `Ctrl+Shift+|` - Smart vertical split
- `Ctrl+Shift+-` - Smart horizontal split
- `Ctrl+Shift+W` - Close current pane
- `Ctrl+Shift+Z` - Toggle pane zoom
- `Alt+H/J/K/L` - Navigate panes (vim-style)
- `Ctrl+Alt+H/J/K/L` - Resize panes

**Implementation Details:**

```lua
-- Smart split based on current pane dimensions
local function smart_split(window, pane)
  local tab = pane:tab()
  local dims = pane:get_dimensions()

  if dims.cols > 120 then
    pane:split { direction = "Right" }
  else
    pane:split { direction = "Bottom" }
  end
end
```

### 2. Project Workspace Management (`workspaces.lua`)

**Workspace Features:**

- **Auto-detection**: Scan common development directories
- **Git Integration**: Show branch status in workspace name
- **Session Persistence**: Remember last workspace on startup
- **Quick Switching**: Fuzzy search interface

**Key Bindings:**

- `Ctrl+Shift+P` - Project workspace switcher
- `Ctrl+Shift+N` - New workspace
- `Ctrl+Shift+R` - Rename current workspace
- `Ctrl+1-9` - Switch to workspace by number

**Project Detection Logic:**

```lua
local project_roots = {
  "~/Development",
}

local project_markers = {
  ".git", "package.json", "Cargo.toml",
  "go.mod", "requirements.txt", "composer.json", "pyproject.toml"
}
```

### 3. Enhanced Status Bar (`status.lua`)

**Status Bar Components:**

- **Left**: Workspace name + active tab count
- **Center**: Current working directory (shortened)
- **Right**: Git branch + system stats (CPU/Memory)

**Visual Design:**

- Catppuccin colors for consistency
- Icons using Nerd Font symbols
- Dynamic content based on context
- Smooth animations for state changes

**Information Display:**

```lua
-- Status bar format:
-- [workspace_name (3 tabs)] ~/Dev/project │ main +2 -1 │ CPU: 45% MEM: 2.1GB
```

### 4. Command Palette (`commands.lua`)

**Custom Commands:**

- **Project Operations**: Create, clone, switch projects
- **Git Workflows**: Quick commit, push, pull, status
- **Development Tools**: Start servers, run tests, build
- **System Operations**: Process management, file operations

**Key Binding:** `Ctrl+Shift+K` - Open command palette

**Command Categories:**

```lua
local commands = {
  project = {
    { label = "Clone Repository", action = "git_clone" },
    { label = "Create New Project", action = "project_create" },
    { label = "Open in VS Code", action = "code_open" }
  },
  git = {
    { label = "Quick Commit", action = "git_quick_commit" },
    { label = "Push to Remote", action = "git_push" },
    { label = "Pull Latest", action = "git_pull" }
  },
  dev = {
    { label = "Start Dev Server", action = "dev_server_start" },
    { label = "Run Tests", action = "run_tests" },
    { label = "Build Project", action = "build_project" }
  }
}
```

### 5. Theme Management (`appearance.lua`)

**Theme Switching System:**

- **Available Themes**: Light and dark variants
- **Automatic Switching**: Based on system theme or time
- **Persistent Storage**: Remember user preference
- **Smooth Transitions**: Animated theme changes

**Themes:**

- **Dark**: Catppuccin Mocha (current)
- **Light**: Catppuccin Latte
- **Auto**: System preference following

**Key Bindings:**

- `Ctrl+Shift+T` - Toggle theme
- `Ctrl+Shift+Alt+T` - Theme selector menu

### 6. Advanced Key Bindings (`keybindings.lua`)

**Organized Key Binding Structure:**

```lua
local keys = {
  -- Pane Management
  pane = {
    split_smart = { key = "|", mods = "CTRL|SHIFT" },
    close = { key = "w", mods = "CTRL|SHIFT" },
    zoom = { key = "z", mods = "CTRL|SHIFT" }
  },

  -- Workspace Management
  workspace = {
    switcher = { key = "p", mods = "CTRL|SHIFT" },
    new = { key = "n", mods = "CTRL|SHIFT" },
    rename = { key = "r", mods = "CTRL|SHIFT" }
  },

  -- Application Control
  app = {
    command_palette = { key = "k", mods = "CTRL|SHIFT" },
    theme_toggle = { key = "t", mods = "CTRL|SHIFT" },
    settings = { key = ",", mods = "CTRL|SHIFT" }
  }
}
```

### 7. Utility Functions (`utils.lua`)

**Helper Functions:**

- Git repository detection and status
- Project root identification
- System resource monitoring
- Path manipulation and formatting
- Color scheme utilities

```lua
-- Key utility functions
local M = {}

function M.get_git_branch(cwd)
  -- Return current git branch or nil
end

function M.find_project_root(path)
  -- Walk up directory tree to find project markers
end

function M.format_path(path, max_length)
  -- Intelligently shorten paths for display
end

function M.get_system_stats()
  -- Return CPU and memory usage
end

return M
```

## Implementation Timeline

### Phase 1: Foundation (Week 1)

- [ ] Set up modular configuration structure
- [ ] Implement basic key bindings system
- [ ] Create utility functions module
- [ ] Test configuration loading and error handling

### Phase 2: Core Features (Week 2)

- [ ] Implement smart pane management
- [ ] Create workspace detection and switching
- [ ] Build enhanced status bar
- [ ] Add theme switching capability

### Phase 3: Advanced Features (Week 3)

- [ ] Develop command palette system
- [ ] Add git integration features
- [ ] Implement project management commands
- [ ] Create system monitoring displays

### Phase 4: Polish & Testing (Week 4)

- [ ] Performance optimization
- [ ] Error handling and edge cases
- [ ] Documentation and comments
- [ ] User testing and feedback integration

## Testing Strategy

### Functional Testing

- [ ] All key bindings work correctly
- [ ] Workspace switching preserves state
- [ ] Status bar updates in real-time
- [ ] Command palette executes actions properly
- [ ] Theme switching works without restart

### Performance Testing

- [ ] Configuration loads quickly (< 100ms)
- [ ] Status bar updates don't cause lag
- [ ] Memory usage remains reasonable
- [ ] No performance regression with many panes/tabs

### Integration Testing

- [ ] Works with existing fish shell config
- [ ] SSH domains continue to function
- [ ] Quick select patterns still work
- [ ] Compatible with system theme changes

## Rollback Plan

### Backup Strategy

- Keep original `.wezterm.lua` as `.wezterm.lua.backup`
- Version control all configuration changes
- Document all modifications for easy reversal

### Incremental Deployment

- Deploy one module at a time
- Test each feature independently
- Maintain fallback to previous working state

### Recovery Procedures

- Simple file replacement for quick rollback
- Module-level disabling for partial rollback
- Complete reset to basic configuration if needed

## Best Practices Applied

### Lua Coding Standards

- Consistent indentation (2 spaces)
- Clear variable naming
- Proper error handling with pcall
- Modular design with clear interfaces
- Comprehensive commenting

### WezTerm Specific

- Use `config_builder()` for proper initialization
- Leverage WezTerm's event system efficiently
- Optimize key binding performance
- Follow WezTerm's configuration patterns
- Utilize built-in utilities when available

### Performance Considerations

- Lazy loading of heavy modules
- Efficient status bar update mechanisms
- Minimal resource usage for background tasks
- Optimized key binding lookup tables

## Success Metrics

### Productivity Improvements

- Faster project switching (< 2 seconds)
- Reduced cognitive load with visual indicators
- Streamlined common workflows
- Enhanced multitasking capabilities

### User Experience Goals

- Intuitive key bindings that feel natural
- Responsive interface with no noticeable lag
- Consistent visual design language
- Helpful feedback and error messages

### Technical Achievements

- Maintainable, well-documented code
- Robust error handling and recovery
- Efficient resource utilization
- Seamless integration with existing setup

This plan transforms WezTerm from a basic terminal into a comprehensive development environment while maintaining stability and performance.
