# make history useable
shopt -s histappend
# multiline commands are one entry
shopt -s cmdhist
export HISTCONTROL="erasedups:ignoreboth"

alias vim=nvim
alias ls='ls --color=auto -a'
export EDITOR=nvim

export PATH="$PATH:~/.local/bin/:~/scripts:~/.corepack-bin:~/.cargo/bin"
export PGHOST=/tmp

# gpg signing
export GPG_TTY=$(tty)

# running a lot of watchers for builds/compilation
ulimit -n 65536

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

dbus-update-activation-environment --all

GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
YELLOW="\[\033[1;33m\]"
RESTORE="\[\033[0m\]"
function __prompt() {
  code=$?
  if [[ $code != "0" ]]
  then
      emoji=💩💩💩
      color=$RED
  else
      emoji=👌
      color=$GREEN
  fi
  branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  node_version=$(node -v 2> /dev/null)
  export PS1="[$CYAN\w$RESTORE] $YELLOW$branch $LIGHT_PURPLE${node_version/v/node}$RESTORE\n$emoji $color\u@\h>$RESTORE "
}

PROMPT_COMMAND=__prompt

source /usr/share/nvm/init-nvm.sh
export AWS_PROFILE=admin
