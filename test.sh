#!/usr/bin/env bash
set -euo pipefail

zellij -c ./config.kdl setup --check

find src \( -name "*.sh" -o -name ".bashrc" -o -name ".bash_profile" \) -print0 \
  | xargs -0 shellcheck --severity=style --shell bash
