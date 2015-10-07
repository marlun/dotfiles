export PS1='\w$ '
export EDITOR=vim
export CLICOLOR=1
export LESS="-R -x2"
export MANWIDTH=78

# Add system specific configuration files in ~/.bashrc.d/
for f in ~/.bashrc.d/*; do
	source $f;
done

# set PATH so it includes users private bin if it exists
if [ -d "$HOME/bin"  ] ; then
	PATH="$HOME/bin:$PATH"
fi

# Disable START/STOP signals
stty -ixon -ixoff
