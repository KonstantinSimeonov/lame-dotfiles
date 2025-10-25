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
dir="$(readlink -f "$(dirname "$0")")"

install_dotfiles() {
  for f in src/.*; do
    f="$(basename "$f")"
    rm -f "$HOME/$f"
    from="$dir/src/$f"
    to="$HOME/$f"
    echo "symlinking $from to $to"
    ln -s "$from" "$to"
  done
}

install_zellij_config() {
  zellij_config="config.kdl"
  zellij_config_dir="$HOME/.config/zellij"
  mkdir -p "$zellij_config_dir"
  rm -f "$zellij_config_dir/$zellij_config"
  ln -s "$dir/$zellij_config" "$zellij_config_dir/$zellij_config"
}

install_dotfiles
install_zellij_config

echo "done"
