# CLAUDE.md

## Repository Overview

This is a personal dotfiles repository designed to set up a Linux or macOS host from scratch with specific tooling and configuration preferences.

## Purpose

This repository automates the configuration of a new system by:
- Installing essential packages and development tools
- Setting up dotfiles (configuration files) for various applications
- Configuring a Python development environment
- Establishing consistent shell, editor, and terminal multiplexer settings

## Repository Structure

```
dotfiles/
├── config/              # All dotfiles and configuration files
├── scripts/             # Installation and setup scripts
│   ├── install.sh      # Main installation script
│   ├── linux/          # Linux-specific scripts
│   └── macos/          # macOS-specific scripts
├── CLAUDE.md           # Documentation for AI assistants
└── README.md           # User-facing documentation
```

## Key Components

### Scripts

- **`scripts/install.sh`**: Creates symbolic links from config files to their expected locations in `~`
- **`scripts/linux/packages.sh`**: Installs packages and tools for Linux (apt, snap, pipx)
- **`scripts/macos/`**: macOS-specific installation scripts (to be added)

### Configuration Files (in `config/`)

- **`commonrc`**: Shared shell configuration for bash and zsh
- **`bashrc`**: Bash shell configuration and aliases
- **`zshrc`**: Zsh shell configuration and aliases
- **`vimrc`**: Vim editor configuration (includes Vundle plugin manager setup)
- **`tmux`**: Tmux terminal multiplexer configuration
- **`gitconfig`**, **`gitignore`**, **`gitattributes`**: Git configuration files
- **`xbindkeysrc`**: X Window System keyboard shortcuts

## Installation Process

1. Run `scripts/linux/packages.sh` (Linux) or `scripts/macos/packages.sh` (macOS) to install system packages
2. Run `scripts/install.sh` to symlink configuration files to home directory
3. The Vim setup will automatically clone Vundle and install plugins

## Included Tools

### System Utilities
- vim, git, tmux, curl, ack, icdiff, btop

### Python Development Stack
- pyenv (Python version management)
- Python 3 (set as default)
- pipx (isolated Python app installation)
- Development tools: black, flake8, isort, mypy, poetry, pre-commit, tox

### Cloud Tools
- AWS CLI (via snap)

## Target Platforms

This setup supports:
- **Linux**: Debian/Ubuntu-based distributions (apt-get, snap package management)
- **macOS**: Apple Silicon and Intel Macs (homebrew package management)

Both platforms share common shell, editor, and terminal configurations.

## Notes for AI Assistants

- This is a personal configuration repository - modifications should respect existing preferences
- The setup assumes a fresh Linux installation
- Configuration files are symlinked, not copied, so changes to the repository files affect the active configuration
- Package versions are not pinned, installations use latest available versions
