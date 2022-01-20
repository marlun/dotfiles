export LC_ALL=en_US.UTF-8
export LC_LANG=en_US.UTF-8
export PATH="$HOME/bin:$PATH"
export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export LESS="-R -x2"
export MANWIDTH=78
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=-1
export HISTFILESIZE=-1
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Git prompt
# PROMPT_COMMAND='__git_ps1 "\w" "\\\$ " "(%s)"'
PROMPT_COMMAND='__git_ps1 "\\033[;38;5;150m\w" "\\\$ \\033[0m" "(%s)"'
GIT_PS1_SHOWUPSTREAM="auto"

# Disable START/STOP signals
stty -ixon -ixoff

# Local customized path and environment settings, etc.
if [ -f ~/.config/bashrc ]; then
  . ~/.config/bashrc
fi
