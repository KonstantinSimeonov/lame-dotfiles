# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for file in "$HOME/.bashrc.d/"*.sh; do
  # shellcheck source=/dev/null
  source "$file"
done

if [ -f ~/.env ]; then
  # shellcheck source=/dev/null
  . ~/.env
fi
