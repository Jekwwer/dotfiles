# .bashrc: Configures the behavior of the Bash shell.

# === Core Configuration ===
# This section includes essential default settings from the system `.bashrc`.

# Interactive Shell Check
case $- in
    *i*) ;;
      *) return;;
esac

# Dynamic Terminal Size Updates
shopt -s checkwinsize

# Lesspipe Integration
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Chroot Identification
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Xterm Window Title Customization
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Programmatic Completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# === User Configuration ===
# This section includes custom settings and configurations from the user.

# === Safety Settings ===
# Make shell safer and scripts more robust
set -o pipefail   # Return the exit status of the last command in the pipeline
set -o noclobber  # Avoid overwriting files accidentally

# === Environment Variables ===
# User-specific environment
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Locale settings
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# === History Settings ===
# Enhanced history management
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth # Don't record duplicate or space-prefixed commands
export HISTIGNORE="ls:cd:cd -:pwd:exit:clear" # Ignore trivial commands
shopt -s histappend           # Append to history instead of overwriting
PROMPT_COMMAND="history -a"   # Save commands to history after execution

# === Aliases ===
# Basic aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

# Safer commands
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Quick navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git aliases
alias gst="git status"
alias gca="git amend"
alias gci="git commit"
alias gsc="git smart-commit"
alias gf="git fetch"
alias gfi="git fixup"
alias gpl="git pull"
alias gps="git push"
alias gpf="git push --force"
alias gco="git checkout"
alias gl="git log --oneline --graph --decorate"

# Productivity
alias update="sudo apt update && sudo apt upgrade -y"
alias clr="clear"

# === Prompt Customization ===
# Colorful and informative prompt
PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\]\$ "

# === Shell Enhancements ===
# Enable better completion and navigation
shopt -s checkwinsize  # Update terminal size after each command
shopt -s globstar      # Enable recursive globbing (**)

# Auto-correction for minor typos in directory names
shopt -s dirspell

# Add color to the terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Enable bash completion if available
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# === Functions ===
# Add a timestamp to log files
log() {
    local logfile=${1:-"logfile.txt"}
    shift
    echo "$(date +'%Y-%m-%d %H:%M:%S') $*" >> "$logfile"
}

# Search history with a keyword
hgrep() {
    history | grep "$1"
}

# Reload the shell configuration
reload() {
    source ~/.bashrc
    echo "Bash configuration reloaded!"
}

# === Git Enhancements ===
# Show the current Git branch in the prompt
git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}
PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w \[\e[1;33m\]\$(git_branch)\[\e[0m\]\$ "

# === Miscellaneous ===
# Automatically correct typos in commands
alias enable_correct="shopt -s cdspell"
alias disable_correct="shopt -u cdspell"

# Display a reminder message
echo "Hey—you're using dotfiles by Jekwwer! 👉 https://github.com/Jekwwer/dotfiles"
