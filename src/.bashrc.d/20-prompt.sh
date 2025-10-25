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

  if [ -n "$branch" ]; then
    local files added removed diffstat
    read -r files added removed < <(git diff --shortstat 2>/dev/null | grep -Eo '\d+' | tr '\n' ' ')
    if [ -n "$files" ]; then
      diffstat="$restore$files $green+$added $red-$removed$restore"
    fi
  fi

  local node_version
  node_version=$(node -v 2> /dev/null)

  local prompt="[$cyan\w$restore]"
  declare -a items=(
    "${branch:+$yellow$branch$restore}" # git branch
    "${diffstat:+($diffstat)}"
    "$light_purple${node_version/v/node}$restore" # node version
    "${AWS_PROFILE:+aws:$AWS_PROFILE}"
    # line 2
    "\n$emoji" # spazz out a bit
    "$color\u@\h>" # user host
    "$restore"
  )

  for item in "${items[@]}"; do
    if [ -n "$item" ]; then
      prompt="$prompt $item"
    fi
  done
  export PS1="$prompt"
}

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND;}__prompt"
