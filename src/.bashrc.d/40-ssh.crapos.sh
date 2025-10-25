# ssh agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval "$(keychain --agents ssh --eval --inherit any id_ed25519 id_ed25519_loancrate)"
  ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh_auth_sock"
fi
export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"
