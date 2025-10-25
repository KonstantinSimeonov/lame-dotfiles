#!/usr/bin/env bash
set -euo pipefail

# cross-os copy for zellij

if command -v pbcopy >/dev/null 2>&1; then
  exec pbcopy
elif command -v wl-copy >/dev/null 2>&1; then
  exec wl-copy
else
  exec xclip -selection clipboard
fi
