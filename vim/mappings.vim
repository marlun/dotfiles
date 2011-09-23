" More usable leader (easier to reach)
let mapleader=' '

" In NORMAL mode Ctrl-l removes search highlights
nmap <silent> <C-l> :nohlsearch<CR>

" In INSERT mode Ctrl-l goes into NORMAL mode
imap <C-l> <ESC>

" Makes it easier to close a buffer or exit vim
nmap <silent> <leader>q :q<CR>

" Save buffer (easier on the fingers)
nmap <silent> <leader>w :w<CR>

" Swap ` and ' because I use ` more often but on a swedish keyboard layouts
" you have to hit <space> after ` for it to become `a instead of à
noremap ' `
noremap ` '

" Toggle list mode
nmap <silent> <leader>- :set nolist!<CR>

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
