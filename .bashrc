# .bashrc: Configures the behavior of the Bash shell.

# === Core Configuration ===

case $- in
    *i*) ;;
      *) return;;
esac

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# === Environment Variables ===

export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# === History Settings ===

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:cd:cd -:pwd:exit:clear"
shopt -s histappend
PROMPT_COMMAND="history -a"

# === Aliases ===

alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias gst="git status"
alias gca="git amend"
alias gci="git commit"
alias gf="git fetch"
alias gfi="git fixup"
alias gpl="git pull"
alias gps="git push"
alias gpf="git push --force-with-lease"
alias gco="git checkout"
alias gl="git log --oneline --graph --decorate"

alias update="sudo apt update && sudo apt upgrade -y"
alias clr="clear"

# === Shell Enhancements ===

shopt -s globstar  # enable ** recursive glob
shopt -s dirspell  # correct typos in tab-completion paths
shopt -s cdspell   # correct typos in cd arguments

# macOS uses CLICOLOR/LSCOLORS; Linux uses --color=auto
if [[ "$(uname)" == "Darwin" ]]; then
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
else
    alias ls='ls --color=auto'
fi

# === Functions ===

hgrep() {
    history | grep "$1"
}

reload() {
    source ~/.bashrc
    echo "Bash configuration reloaded!"
}

# === Prompt Customization ===

git_branch() {
    git branch --show-current 2>/dev/null
}

PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w \[\e[1;33m\]\$(git_branch)\[\e[0m\]\$ "
