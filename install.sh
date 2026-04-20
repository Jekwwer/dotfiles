#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -d "$DOTFILES_DIR" ]]; then
    echo "Error: DOTFILES_DIR not found: $DOTFILES_DIR" >&2
    exit 1
fi

FILES_TO_SYMLINK=(".curlrc" ".editorconfig" ".gitattributes" ".gitconfig" ".gitignore_global" ".gitmessage" ".shell_common" ".wgetrc")

echo "Installation started at $(date)"
echo "Linking dotfiles..."
for file in "${FILES_TO_SYMLINK[@]}"; do
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
    echo "Linked $DOTFILES_DIR/$file -> $HOME/$file"
done

if [[ "$(uname)" == "Darwin" ]]; then
    ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    echo "Linked $DOTFILES_DIR/.zshrc -> $HOME/.zshrc"
    RC_FILE=".zshrc"
else
    ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
    echo "Linked $DOTFILES_DIR/.bashrc -> $HOME/.bashrc"
    RC_FILE=".bashrc"
fi

mkdir -p "$HOME/bin"
ln -sf "$DOTFILES_DIR/scripts/prune-cspell-words" "$HOME/bin/prune-cspell-words"
echo "Linked $DOTFILES_DIR/scripts/prune-cspell-words -> $HOME/bin/prune-cspell-words"

echo "Dotfiles installation complete!"
echo "Run 'source ~/$RC_FILE' to apply shell changes in the current session."
echo "Installation completed at $(date)"
