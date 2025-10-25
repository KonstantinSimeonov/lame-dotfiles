shopt -s histappend      # make history useable
shopt -s cmdhist         # multiline commands are one entry
shopt -s lithist         # store multi-line commands with newlines

HISTSIZE=100000
HISTFILESIZE=200000
HISTCONTROL="erasedups:ignoreboth"
HISTIGNORE="ls:cd:pwd:clear:history:exit:bg:fg"

__share_history_between_sessions() {
  history -a # save new lines
  history -n # read from other sessions
}

PROMPT_COMMAND="__share_history_between_sessions${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
