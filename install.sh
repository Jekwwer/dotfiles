#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -d "$DOTFILES_DIR" ]]; then
    echo "Error: DOTFILES_DIR not found: $DOTFILES_DIR" >&2
    exit 1
fi

FILES_TO_SYMLINK=(".bashrc" ".curlrc" ".editorconfig" ".gitattributes" ".gitconfig" ".gitignore_global" ".gitmessage" ".wgetrc")

echo "Installation started at $(date)"
echo "Linking dotfiles..."
for file in "${FILES_TO_SYMLINK[@]}"; do
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
    echo "Linked $DOTFILES_DIR/$file -> $HOME/$file"
done

echo "Dotfiles installation complete!"
echo "Run 'source ~/.bashrc' to apply shell changes in the current session."
echo "Installation completed at $(date)"
