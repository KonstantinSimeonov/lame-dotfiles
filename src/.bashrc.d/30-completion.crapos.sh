for compl in /opt/homebrew/etc/bash_completion.d/*; do
  if [[ "$compl" != "/opt/homebrew/etc/bash_completion.d/000_bash_completion_compat.bash" ]]; then
    # shellcheck source=/dev/null
    . "$compl"
  fi
done

complete -C /Users/kon/.config/tfenv/versions/1.9.2/terraform terraform
