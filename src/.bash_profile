export EDITOR=nvim

export PATH="$PATH:$HOME/.local/bin/:$HOME/scripts:$HOME/.cargo/bin"
export PGHOST=/tmp

GPG_TTY=$(tty)
export GPG_TTY

# running a lot of watchers for builds/compilation
ulimit -n 65536

# shellcheck source=/dev/null
source /usr/share/nvm/init-nvm.sh

# shellcheck source=src/.bashrc
[[ $- == *i* ]] && source ~/.bashrc
