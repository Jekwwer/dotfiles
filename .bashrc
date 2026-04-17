# .bashrc: Bash shell configuration. Sources .shell_common for shared settings.

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

# === History ===
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:cd:cd -:pwd:exit:clear"
shopt -s histappend
PROMPT_COMMAND="history -a"

# === Shared Configuration ===
source ~/.shell_common

# === Shell Options ===
shopt -s globstar  # enable ** recursive glob
shopt -s dirspell  # correct typos in tab-completion paths
shopt -s cdspell   # correct typos in cd arguments

# === Prompt ===
PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w \[\e[1;33m\]\$(git_branch)\[\e[0m\]\$ "
