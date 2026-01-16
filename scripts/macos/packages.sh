#!/bin/bash

echo "Setting up macOS development environment..."

# Install Xcode Command Line Tools if not already installed
if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Please complete the Xcode Command Line Tools installation and run this script again."
    exit 1
fi

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install packages via Homebrew
echo "Installing packages..."
brew install \
    vim \
    git \
    tmux \
    curl \
    python@3 \
    icdiff \
    ack \
    btop \
    pipx \
    pyenv \
    awscli

# Ensure pipx is in PATH
pipx ensurepath

# Install Python development tools via pipx
echo "Installing Python development tools..."
pipx install black
pipx install flake8
pipx install isort
pipx install mypy
pipx install poetry
pipx install pre-commit
pipx install tox

echo ""
echo "Installation complete!"
echo ""
echo "Next steps:"
echo "1. Close and reopen your terminal to ensure PATH changes take effect"
echo "2. Run 'scripts/install.sh' to set up dotfiles"
echo "3. Configure your default shell if needed: chsh -s \$(which zsh)"
