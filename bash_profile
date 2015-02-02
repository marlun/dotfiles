if [ -r ~/.bashrc ]; then
	source ~/.bashrc
fi

export EDITOR=vim			# Set the default editor to vim
export CLICOLOR=1			# Show colors on 'ls'
export LESS="-R -x2"			# Show TAB as 2 spaces
export MANWIDTH=78		# Set max widht to 78 characters in man
export HISTCONTROL=ignoredups
export PATH=~/bin:/usr/local/bin:$PATH

# Load files for bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion
fi

export PROMPT_COMMAND='__git_ps1 "\w" "\\\$ "'
