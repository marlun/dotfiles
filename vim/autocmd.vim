if has("autocmd") && !exists("autocommands_loaded")
	
	let autocommands_loaded = 1

	" Auto-source .vimrc when changed
	autocmd BufWritePost .vimrc source ~/.vimrc
	autocmd BufWritePost mappings.vim source ~/.vim/mappings.vim
	autocmd BufWritePost autocmd.vim source ~/.vim/autocmd.vim
	autocmd BufWritePost plugins.vim source ~/.vim/plugins.vim

endif
