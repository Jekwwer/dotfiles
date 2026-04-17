#!/bin/bash
# install.sh: Sets up dotfiles, installs dependencies, and configures the environment.

# Exit script on any error
set -e

# Define the base directory for dotfiles
DOTFILES_DIR="/workspaces/.codespaces/.persistedshare/dotfiles"

# Files to link
FILES_TO_SYMLINK=(".bashrc" ".curlrc" ".editorconfig" ".gitattributes" ".gitconfig" ".gitignore_global" ".gitmessage" ".wgetrc")

# Logging setup
LOG_FILE="$DOTFILES_DIR/install.log"
exec > >(tee -a "$LOG_FILE") 2>&1
echo "Installation started at $(date)"

# Link dotfiles to home directory
echo "Linking dotfiles..."
for file in "${FILES_TO_SYMLINK[@]}"; do
    target="$HOME/$file"
    if [[ -f "$target" || -L "$target" ]]; then
        echo "Removing existing $target..."
        rm -f "$target"
    fi
    ln -sf "$DOTFILES_DIR/$file" "$target"
    echo "Linked $DOTFILES_DIR/$file to $target"
done

# Set global gitignore path
git config --global core.excludesfile "$HOME/.gitignore_global"

# Source .bashrc if it exists
if [[ -f "$HOME/.bashrc" ]]; then
    echo "Sourcing .bashrc..."
    (source "$HOME/.bashrc")
fi

echo "Dotfiles and dependencies installation complete!"
echo "Installation completed at $(date)"
