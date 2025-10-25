# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for file in "$HOME/.bashrc.d/"*.sh; do
  if [ -f "$file" ]; then
    source "$file"
  fi
done

if [ -f ~/.env ]; then
  . ~/.env
fi
