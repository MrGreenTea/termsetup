# Terminal Setup Improvement Plan

## Current State Analysis

Your terminal setup is already quite sophisticated with:

- Fish shell with good abbreviations and functions
- Modern CLI tools (bat, eza, zoxide, starship, fzf, atuin, etc.)
- WezTerm config with Catppuccin theme
- Claude Code integration with notification hooks
- Comprehensive completions and integrations

## Improvements by Priority

### High Priority

#### 1. Create WezTerm Flatpak Install Script ✅

- **Issue**: WezTerm is installed as flatpak but missing install script
- **Solution**: Add `install_scripts/05.wezterm.sh` with flatpak installation
- **Implementation**: `flatpak install flathub org.wezfurlong.wezterm`

#### 2. Add bottom Installation ✅

- **Issue**: bottom not currently installed (better system monitor than htop)
- **Solution**: Add to `51.cargo_tools.sh`
- **Implementation**: Add to list in `51.cargo_tools.sh`

#### 3. Update Cargo Tools Script ✅

- **Issue**: Script at `51.cargo_tools.sh` doesn't reflect actually installed tools
- **Current Script**: `bat exa zoxide bandwhich ytop fd-find du-dust starship procs sd git-delta rtx-cli ripgrep atuin bottom`
- **Actually Installed**: All above plus `hyperfine`, `nu`, `broot`, `tokei`
- **Remove**: `just`, `zellij` (uninstall with `cargo uninstall`)
- **Solution**: Add missing tools, remove unwanted ones

### Medium Priority

#### 4. Enhanced FZF Git Operations ✅

Add keybindings to fish config:

- **Ctrl+G B**: Fuzzy search and switch git branches
- **Ctrl+G F**: Fuzzy search modified files with actions (add/restore/diff)
- **Ctrl+G L**: Search git log with preview, copy hash or checkout
- **Ctrl+G S**: Interactive git status with staging options

#### 5. FZF Project Navigation ✅

- **fuzzy-kill**: command to fuzzy search and kill processes

### Low Priority

#### 6. WezTerm Config Enhancements ⏳

- **Smart Splits**: Intelligent pane splitting based on context
- **Project Workspaces**: Automatic workspace creation for projects with switcher (`Ctrl+P`)
- **Status Bar**: Show git branch, project name, system stats
- **Command Palette**: Custom commands for terminal operations
- **Theme Switching**: Quick toggle between light/dark themes

## Implementation Notes

### File Structure

```
install_scripts/
├── 05.wezterm.sh          # New: WezTerm flatpak installation
├── 51.cargo_tools.sh      # Update: Sync with installed tools

fish_config/
├── functions/
│   ├── proj.fish         # New: Project switching
│   ├── gwork.fish        # New: Git workflow
│   ├── dev_env.fish      # New: Development environment
│   └── quick_serve.fish  # New: Quick server
└── conf.d/
    ├── fzf_git.fish      # New: FZF git keybindings
    └── abbreviations.fish # Update: Add new tool shortcuts

configs/
└── .wezterm.lua          # Update: Enhanced configuration
```

### Testing Strategy

1. Test each install script individually
2. Verify all keybindings work in fish shell
3. Test WezTerm config changes don't break existing setup
4. Ensure all functions handle edge cases gracefully

### Rollback Plan

- Keep backup of original files
- Test in non-production environment first
- Implement changes incrementally
- Document all changes for easy reversal

## Non-Goals (This Round)

- System-wide error handling improvements
- Idempotent script redesign
- Backup/restore functionality
- Platform migration cleanup

These improvements focus on practical productivity gains while maintaining your existing excellent foundation.
