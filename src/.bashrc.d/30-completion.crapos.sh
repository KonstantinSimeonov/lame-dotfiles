export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
  # shellcheck source=/dev/null
  . /opt/homebrew/etc/profile.d/bash_completion.sh
elif [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
  # shellcheck source=/dev/null
  . /usr/local/etc/profile.d/bash_completion.sh
fi

for compl in /opt/homebrew/etc/bash_completion.d/*; do
  if [[ "$compl" != "/opt/homebrew/etc/bash_completion.d/000_bash_completion_compat.bash" ]]; then
    # shellcheck source=/dev/null
    . "$compl"
  fi
done

complete -C /Users/kon/.config/tfenv/versions/1.9.2/terraform terraform
