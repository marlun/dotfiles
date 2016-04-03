PROMPT_COMMAND='__git_ps1 "\w" "\\\$ " "(%s)"'
GIT_PS1_SHOWUPSTREAM="auto"

export EDITOR=vim
export CLICOLOR=1
export LESS="-R -x2"
export MANWIDTH=78

# XDG configuration
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Disable START/STOP signals
stty -ixon -ixoff

# Bash completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
	. /usr/local/share/bash-completion/bash_completion
fi

# Local customized path and environment settings, etc.
if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi
