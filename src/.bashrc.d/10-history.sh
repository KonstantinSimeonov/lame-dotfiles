# make history useable
shopt -s histappend
# multiline commands are one entry
shopt -s cmdhist
export HISTCONTROL="erasedups:ignoreboth"
