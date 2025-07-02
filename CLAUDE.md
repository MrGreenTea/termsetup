# CLAUDE.md

## Repository Overview

This is a personal dotfiles/configuration management repository that automates the setup of a developer-friendly terminal environment Fedora Silverblue (42).

## Project Structure

- `install.sh` - Main entry point that runs all scripts in `install_scripts/` sequentially
- `install_scripts/` - Numbered bash scripts that set up different components
- `fish_config/` - Fish shell configuration (abbreviations, functions, completions)
- `configs/` - Various application configurations (.wezterm.lua, etc.)
- `surfing_keys.js` - SurfingKeys browser extension configuration
- `claude/` - Shared configuration for claude code

## Common Commands

### Installation

```bash
# Run full installation
bash install.sh

# Run individual install scripts
bash install_scripts/01_something.sh
```

- When testing WezTerm configuration, use `flatpak run org.wezfurlong.wezterm` since WezTerm is installed via flatpak
- Never specify `--config-file` when testing WezTerm - always use the default config path at `~/.config/wezterm/`
- Always test WezTerm with a command that exits to prevent it staying open: `flatpak run org.wezfurlong.wezterm start --always-new-process -- sleep 1 && echo "test"`

## Claude Personal Preferences

- Always call me "Mr. Brontosaurus"
