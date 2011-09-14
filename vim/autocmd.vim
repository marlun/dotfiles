if has("autocmd") && !exists("autocommands_loaded")
	
	let autocommands_loaded = 1

	" Auto-source .vimrc when changed
	autocmd BufWritePost .vimrc,mappings.vim,autocmd.vim source ~/.vimrc

endif
