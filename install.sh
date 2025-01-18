#!/bin/bash
# install.sh: Sets up dotfiles, installs dependencies, and configures the environment.

# Exit script on any error
set -e

# Define the base directory for dotfiles
DOTFILES_DIR="/workspaces/.codespaces/.persistedshare/dotfiles"
SCRIPT_DIR="$DOTFILES_DIR/scripts"
BIN_DIR="$HOME/bin"
VENV_DIR="$DOTFILES_DIR/.venv"

# Files to link
FILES_TO_SYMLINK=(".bashrc" ".curlrc" ".gitattributes" ".gitconfig" ".gitignore_global" ".gitmessage" ".wgetrc")

# Logging setup
LOG_FILE="$DOTFILES_DIR/install.log"
exec > >(tee -a "$LOG_FILE") 2>&1
echo "Installation started at $(date)"

# Ensure ~/bin exists
mkdir -p "$BIN_DIR"

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

# Ensure Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Exiting."
    exit 1
fi

# Ensure python3-venv is installed
if ! python3 -m ensurepip &> /dev/null; then
    echo "python3-venv is not installed. Installing it..."
    sudo apt-get update && sudo apt-get install -y python3-venv
fi

# Create a virtual environment if it doesn't exist
if [[ ! -d "$VENV_DIR" ]]; then
    echo "Creating a virtual environment at $VENV_DIR..."
    python3 -m venv "$VENV_DIR"
fi

# Activate the virtual environment and install dependencies
source "$VENV_DIR/bin/activate"
if [[ -f "$SCRIPT_DIR/requirements.txt" ]]; then
    echo "Installing dependencies from requirements.txt..."
    pip install --upgrade -r "$SCRIPT_DIR/requirements.txt"
else
    echo "No requirements.txt found. No dependencies to install."
fi
deactivate

# Link the commit-gen script
SCRIPT_NAME="commit-gen"
SCRIPT_PATH="$SCRIPT_DIR/$SCRIPT_NAME.py"
if [[ -f "$SCRIPT_PATH" ]]; then
    ln -sf "$SCRIPT_PATH" "$BIN_DIR/$SCRIPT_NAME"
    chmod +x "$SCRIPT_PATH"
    echo "Linked $SCRIPT_PATH to $BIN_DIR/$SCRIPT_NAME."
else
    echo "Warning: $SCRIPT_PATH not found. Skipping linking commit-gen."
fi

# Ensure ~/bin is in PATH
if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
    echo "Added ~/bin to PATH in .bashrc."
fi

# Source .bashrc if it exists
if [[ -f "$HOME/.bashrc" ]]; then
    echo "Sourcing .bashrc..."
    (source "$HOME/.bashrc")
fi

echo "Dotfiles and dependencies installation complete!"
echo "Installation completed at $(date)"
