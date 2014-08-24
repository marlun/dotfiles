# Change the prompt (adds git branch to the prompt)
export PS1="\w\$(__git_ps1)$ "

# Git bash prompt settings
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

# Configure Bash
export HISTFILESIZE=1000000		# Max number of lines in history file (500)
export HISTSIZE=1000000			# Number of commands to remember (500)
export HISTCONTROL=ignoredups	# Ignore duplicate commands
export HISTIGNORE='ls:bg:fg:history' # Commands which will be ignored
export HISTTIMEFORMAT='%F %T '	# Full date time format in history
export PROMPT_COMMAND='history -a' # Save each line a I execute it
shopt -s histappend				# Append don't overwrite
shopt -s cmdhist				# One command per line
shopt -s expand_aliases			# Make alises available in all shells

# Configure commands
export EDITOR=vim				# Set the default editor to vim
export CLICOLOR='Yes'			# Colors in ls
export LESS="-R"				# Colors in LESS
export MANWIDTH=78

# Fixes problems with TMUX overwriting stuff and colors looking weird
[ -n "$TMUX"  ] && export TERM=screen-256color

# Setup PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
if [ -d "$HOME/Bin" ]; then
	export PATH="$HOME/Bin:$PATH"
fi

# Load .bashrc if available
if [ -f ~/.bashrc_local ]; then
	source ~/.bashrc_local
fi

# Load files for bash-completion
for file in /usr/local/etc/bash_completion.d/* ; do
	source "$file"
done

# Bash-completion for homebrew
source $(brew --repository)/Library/Contributions/brew_bash_completion.sh

# Z - fast browsing in terminal. Works by remembering the folders you
# visit the most and then let you write part of folders to go there
# instantly. `z wp-c` would probably go to the 'wp-content' folder you
# visit the most.
. `brew --prefix`/etc/profile.d/z.sh
