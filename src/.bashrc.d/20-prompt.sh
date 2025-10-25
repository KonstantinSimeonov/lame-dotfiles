function __prompt() {
  local green="\[\033[0;32m\]"
  local cyan="\[\033[0;36m\]"
  local red="\[\033[0;31m\]"
  local light_purple="\[\033[1;35m\]"
  local yellow="\[\033[1;33m\]"
  local restore="\[\033[0m\]"

  local code=$?
  if [[ $code != "0" ]]; then
    emoji=💩💩💩
    color=$red
  else
    emoji=👌
    color=$green
  fi

  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

  local node_version
  node_version=$(node -v 2> /dev/null)

  declare -a items=(
    # line 1
    "[$cyan\w$restore]" # pwd
    "$yellow$branch" # git branch
    "$light_purple${node_version/v/node}" # node version
    "$restore"
    # line 2
    "\n"
    "$emoji" # spazz out a bit
    "$color\u@\h>" # user host
    "$restore"
  )

  export PS1="${items[*]}"
}

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND;}__prompt"
