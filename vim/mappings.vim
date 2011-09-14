" More usable leader (easier to reach)
let mapleader=' '

" In NORMAL mode Ctrl-l removes search highlights
nmap <silent> <C-l> :nohlsearch<CR>

" In INSERT mode Ctrl-l goes into NORMAL mode
imap <C-l> <ESC>

" Save buffer (easier on the fingers)
nmap <silent> <leader>w :w<CR>

" Toggle list mode
nmap <silent> <leader>sw :set nolist!<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
	let s:ts = map(synstack(line('.'), col('.')), 'synIDtrans(v:val)')
	echo map(s:ts, 'synIDattr(v:val, "name")')
endfunc
