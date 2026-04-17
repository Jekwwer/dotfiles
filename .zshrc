# .zshrc: Zsh shell configuration. Sources .shell_common for shared settings.

autoload -U compinit && compinit

# === History ===
export HISTSIZE=5000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export HISTORY_IGNORE="(ls|cd|cd -|pwd|exit|clear)"
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY  # write to history file after every command

# === Shared Configuration ===
source ~/.shell_common

# === Shell Options ===
setopt GLOB_STAR_SHORT  # enable ** recursive glob
setopt CORRECT          # suggest corrections for mistyped commands
setopt CORRECT_ALL      # suggest corrections for all arguments

# === Prompt ===
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m %F{blue}%~ %F{yellow}$(git_branch)%f$ '
