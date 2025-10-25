export EDITOR=nvim

export PATH="$PATH:$HOME/.local/bin/:$HOME/scripts:$HOME/.cargo/bin"
export PGHOST=/tmp

GPG_TTY=$(tty)
export GPG_TTY

# running a lot of watchers for builds/compilation
ulimit -n 65536

case "$(uname -s)" in
  Linux*)   export _OS_TYPE=linux;;
  Darwin*)  export _OS_TYPE=crapos;;
  *)        export _OS_TYPE=unknown;;
esac

export NVM_DIR="$HOME/.nvm"

# linux
# shellcheck source=/dev/null
[ -s /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

# crapos
# shellcheck source=/dev/null
[ -s /opt/homebrew/opt/nvm/nvm.sh ] && source /opt/homebrew/opt/nvm/nvm.sh

# shellcheck source=src/.bashrc
[[ $- == *i* ]] && source ~/.bashrc
