if has("autocmd") && !exists("autocommands_loaded")

	let autocommands_loaded = 1

	" Auto-source .vimrc when changed
	autocmd BufWritePost .vimrc source ~/.vimrc
	autocmd BufWritePost mappings.vim source ~/.vim/mappings.vim
	autocmd BufWritePost autocmd.vim source ~/.vim/autocmd.vim
	autocmd BufWritePost plugins.vim source ~/.vim/plugins.vim

	" Add default content when creating PHP files
	autocmd BufNewFile *.php call setline(1, ['<?php', '', '']) | call setpos('.', [0, 3, 0, 0]) | startinsert

	" Make vim see Vagrantfile as a ruby file
	autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

endif
