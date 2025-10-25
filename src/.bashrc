# If not running interactively, don't do anything
[[ $- != *i* ]] && return

matches_os() {
  local file=""
  file=$(basename "$1")
  suffix="${file#*.}"

  [[ "$suffix" == "$_OS_TYPE.sh" ]] || [[ "$suffix" == sh ]]
}

for file in "$HOME/.bashrc.d/"*.sh; do
  if matches_os "$file"; then
    # shellcheck source=/dev/null
    source "$file"
  fi
done


if [ -f ~/.env ]; then
  # shellcheck source=/dev/null
  . ~/.env
fi
