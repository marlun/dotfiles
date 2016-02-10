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

# Z - fast directory switching
. `brew --prefix`/etc/profile.d/z.sh

# NVM - Node Version Manager
export NVM_DIR="/Users/marlun/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion  ]] && . $NVM_DIR/bash_completion

# Intelligent messages from THE cow
# cowsay $(fortune -s)
cowsay $(gshuf -n 1 ~/Documents/messages.txt)
