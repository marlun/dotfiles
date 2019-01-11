PROMPT_COMMAND='__git_ps1 "\w" "\\\$ " "(%s)"'
GIT_PS1_SHOWUPSTREAM="auto"

# Disable START/STOP signals
stty -ixon -ixoff

export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export LESS="-R -x2"
export MANWIDTH=78
export HISTCONTROL=ignoreboth:erasedups
# Unlimited bash history
export HISTSIZE=-1
export HISTFILESIZE=-1

# Tell homebrew to automaticallt run cleanup periodically
export HOMEBREW_INSTALL_CLEANUP=1

# XDG configuration
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Bash completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
	. /usr/local/share/bash-completion/bash_completion
fi

# Local customized path and environment settings, etc.
if [ -f ~/.config/bashrc ]; then
  . ~/.config/bashrc
fi
