PROMPT_COMMAND='__git_ps1 "\w" "\\\$ " "(%s)"'
GIT_PS1_SHOWUPSTREAM="auto"

# Disable START/STOP signals
stty -ixon -ixoff

export PATH="$HOME/Bin:$PATH"
export EDITOR=nvim
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export LESS="-R -x2"
export MANWIDTH=78
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=-1
export HISTFILESIZE=-1

# XDG configuration
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Bash completion for homebrew v1
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
# Bash completion for homebrew v2
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
# Bash completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
       . /usr/local/share/bash-completion/bash_completion
fi

# Local customized path and environment settings, etc.
if [ -f ~/.config/bashrc ]; then
  . ~/.config/bashrc
fi

export PATH="/usr/local/sbin:$PATH"
