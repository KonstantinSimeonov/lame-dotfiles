if [ -f /usr/share/bash-completion/bash_completion ]; then
  source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

cached_completion() {
  local cmd="$1"
  local cache_cmd="$2"

  if command -v "$cmd" >/dev/null 2>&1; then
    local cache="$HOME/.bash_completion_cache"
    mkdir -p "$cache"

    local cache_file="$cache/$cmd-completion.bash"

    echo "$cache_file"

    if [ ! -f "$cache_file" ]; then
      $cache_cmd > "$cache_file"
    fi

    source "$cache_file"
  fi
}

cached_completion pnpm "pnpm completion bash"
