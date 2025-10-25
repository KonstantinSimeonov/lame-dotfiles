echo "Konfig"

alias vim=nvim
alias ls='ls --color=auto -a'
export EDITOR=nvim

export PATH="$PATH:~/.local/bin/:~/scripts:~/.corepack-bin:~/.cargo/bin"
export PGHOST=/tmp

export GPG_TTY=$(tty)

# running a lot of watchers for builds/compilation
ulimit -n 65536

source /usr/share/nvm/init-nvm.sh

[[ $- == *i* ]] && source ~/.bashrc
