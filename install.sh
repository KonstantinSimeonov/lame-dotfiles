#!/usr/bin/env bash
set -euo pipefail

read -r -p "replace existing dotfiles (.bashrc, .psqlrc, .gitconfig) with symlinks? [y/N] " answer

case $answer in
  [yY])
    echo "proceeding...";;
  *)
    echo "aborted, doing nothing"
    exit;;
esac

rm ~/{.bashrc,.psqlrc,.gitconfig}

declare dir
dir="$(readlink -e "$(dirname "$0")")"

declare -a files=(.bashrc .psqlrc .gitconfig)

for f in "${files[@]}"; do
  from="$dir/$f"
  to="$HOME/$f"
  echo "symlinking $from to $to"
  ln -s  "$from" "$to"
done

echo "done"
