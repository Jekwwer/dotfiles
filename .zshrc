autoload -U compinit && compinit

# === History ===
export HISTSIZE=5000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export HISTORY_IGNORE="(ls|cd|cd -|pwd|exit|clear)"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY      # share history across terminals (implies INC_APPEND_HISTORY)
setopt EXTENDED_HISTORY   # record timestamp and duration
setopt HIST_VERIFY        # show ! expansion before executing
setopt HIST_REDUCE_BLANKS # normalize whitespace in saved commands

# === Shared Configuration ===
source ~/.shell_common

# === Shell Options ===
setopt GLOB_STAR_SHORT  # enable ** recursive glob
setopt CORRECT          # suggest corrections for mistyped commands

# === Prompt ===
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m %F{blue}%~ %F{yellow}$(git_branch)%f$ '
