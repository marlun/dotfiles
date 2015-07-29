export PS1="\w$ "
export EDITOR=vim
export CLICOLOR=1
export LESS="-R -x2"
export MANWIDTH=78

if [ -f $(brew --prefix)/etc/bash_completion  ]; then
	. $(brew --prefix)/etc/bash_completion
fi
