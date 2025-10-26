export EDITOR=nvim

mkdir -p "$HOME/.local/bin"
export PATH="/opt/homebrew/bin:$PATH:$HOME/.local/bin/:$HOME/scripts:$HOME/.cargo/bin"
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

# shellcheck source=src/.bashrc
source ~/.bashrc
