#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -d "$DOTFILES_DIR" ]]; then
    echo "Error: DOTFILES_DIR not found: $DOTFILES_DIR" >&2
    exit 1
fi

FILES_TO_SYMLINK=(".curlrc" ".editorconfig" ".gitattributes_global" ".gitconfig" ".gitignore_global" ".gitmessage" ".shell_common" ".wgetrc")

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

SIGNING_PUBKEY_SRC="$DOTFILES_DIR/keys/signing.pub"
SIGNING_PUBKEY_DST="$HOME/.ssh/id_ed25519_signing.pub"
ALLOWED_SIGNERS="$HOME/.config/git/allowed_signers"

if [[ -f "$SIGNING_PUBKEY_SRC" ]]; then
    mkdir -p "$HOME/.ssh" "$(dirname "$ALLOWED_SIGNERS")"
    ln -sf "$SIGNING_PUBKEY_SRC" "$SIGNING_PUBKEY_DST"
    echo "Linked $SIGNING_PUBKEY_SRC -> $SIGNING_PUBKEY_DST"
    EMAIL="$(git config --file "$DOTFILES_DIR/.gitconfig" user.email)"
    echo "$EMAIL $(cat "$SIGNING_PUBKEY_SRC")" > "$ALLOWED_SIGNERS"
    echo "Wrote $ALLOWED_SIGNERS"
else
    echo "WARNING: $SIGNING_PUBKEY_SRC missing — SSH commit signing will fail."
    echo "  Generate on host:  ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_signing -N ''"
    echo "  Copy pubkey into:  $SIGNING_PUBKEY_SRC  (commit to dotfiles)"
    echo "  Upload to GitHub:  gh ssh-key add ~/.ssh/id_ed25519_signing.pub --type signing"
fi

echo "Dotfiles installation complete!"
echo "Run 'source ~/$RC_FILE' to apply shell changes in the current session."
echo "Installation completed at $(date)"
