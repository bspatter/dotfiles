#!/usr/bin/env bash

#================================================================================
# Functions

# Create symlinks of dotfiles using stow
install_dotfiles() {
    stow bash
    stow bin
    stow emacs
    stow git
    stow python
    stow screen
    stow woof
    stow zsh
    stow fzf
    stow mutt
}

# Remove symlinks of dotfiles using stow
uninstall_dotfiles() {
    stow -D bash
    stow -D bin
    stow -D emacs
    stow -D git
    stow -D python
    stow -D screen
    stow -D woof
    stow -D zsh
    stow -D fzf
    stow -D mutt
}

#================================================================================
# Main

# Make sure GNU stow is installed
if ! command -v stow >/dev/null 2>&1; then
    echo "Please install GNU stow"
    exit 1
fi    

# install (or uninstall)
install_dotfiles
