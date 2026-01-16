# Dotfiles

Personal dotfiles for Linux and macOS development environments.

## Quick Start

### Linux (Ubuntu/Debian)

```bash
# Clone the repository
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# Install packages
./scripts/linux/packages.sh

# Set up dotfiles
./scripts/install.sh

# Set default shell (optional)
chsh -s $(which zsh)  # or $(which bash)
```

### macOS

```bash
# Clone the repository
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# Install packages
./scripts/macos/packages.sh

# Set up dotfiles
./scripts/install.sh

# Set default shell (optional)
chsh -s $(which zsh)  # or $(which bash)
```

## What's Included

### Shell Configuration
- **Bash** and **Zsh** with shared configuration
- Shared environment variables and aliases
- Per-host colored prompts
- History management across sessions

### Development Tools
- **Python**: pyenv, pipx, black, flake8, isort, mypy, poetry, pre-commit, tox
- **Editors**: Vim with Vundle plugin manager
- **Terminal**: tmux with custom configuration
- **Version Control**: Git with custom config
- **Cloud**: AWS CLI

### System Utilities
- icdiff (improved diff)
- ack (better grep)
- btop (system monitor)

## Shell Selection

Both bash and zsh configurations are installed. Choose your default:

```bash
# Use zsh (recommended on macOS)
chsh -s $(which zsh)

# Use bash
chsh -s $(which bash)
```

You can switch between them anytime by running `zsh` or `bash` in your terminal.

## Structure

```
dotfiles/
├── config/              # All configuration files
├── scripts/             # Installation scripts
│   ├── install.sh      # Symlink dotfiles
│   ├── linux/          # Linux package installer
│   └── macos/          # macOS package installer
├── README.md           # This file
└── CLAUDE.md           # Documentation for AI assistants
```

## Customization

Configuration files are symlinked from `config/` to your home directory. Edit files in the repo and changes take effect immediately.

## Documentation

For detailed information about the repository structure and components, see [CLAUDE.md](CLAUDE.md).
