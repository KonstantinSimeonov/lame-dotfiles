#!/usr/bin/env bash
set -euo pipefail

read -r -p "replace existing dotfiles with symlinks? [y/N] " answer

case $answer in
  [yY])
    echo "proceeding...";;
  *)
    echo "aborted, doing nothing"
    exit;;
esac


declare dir
dir="$(readlink -e "$(dirname "$0")")"

for f in src/.*; do
  f="$(basename "$f")"
  rm -f "$HOME/$f"
  from="$dir/src/$f"
  to="$HOME/$f"
  echo "symlinking $from to $to"
  ln -s "$from" "$to"
done

mkdir -p ~/.config/zellij
ln -s "$dir/config.kdl" ~/.config/zellij/config.kdl

echo "done"
