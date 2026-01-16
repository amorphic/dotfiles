#!/bin/sh

# Update package list
sudo apt-get update

# Install apt packages
sudo apt-get install -y \
	vim \
	git \
	tmux \
	curl \
	python3 \
	virtualenv \
	icdiff \
	ack \
    btop\
    pipx

# Install snaps
sudo snap install aws-cli --classic

# Install pyenv
curl https://pyenv.run | bash

# Install python apps 
pipx ensurepath
pipx install black
pipx install flake8
pipx install isort
pipx install mypy
pipx install poetry
pipx install pre-commit
pipx install tox

# Python 3 as default
sudo ln -s /usr/bin/python3 /usr/bin/python
