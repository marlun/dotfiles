" More usable leader (easier to reach)
let mapleader=' '

" Make Y behave like C and D
nnoremap Y y$

" In NORMAL mode Ctrl-l removes search highlights
nnoremap <silent> <C-[> :nohlsearch<CR>

" In INSERT mode Ctrl-l goes into NORMAL mode
" imap <C-l> <ESC>

" Makes it easier to close a buffer or exit vim
nnoremap <silent> <leader>q :close<CR>

" Save buffer (easier on the fingers)
nnoremap <silent> <leader>w :w<CR>

" Toggle list mode
nnoremap <silent> <leader>- :set nolist!<CR>

" Show syntax highlighting groups for word under cursor
nnoremap <C-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
	let s:ts = map(synstack(line('.'), col('.')), 'synIDtrans(v:val)')
	echo map(s:ts, 'synIDattr(v:val, "name")')
endfunc

" The second lines in the following mappings is for iTerm2 but for them to work
" you need to create a mapping in iterm too so it sends the correct escape
" sequences. Read more here:
" https://groups.google.com/d/msg/iterm2-discuss/VEiCSc5LCIs/U5fqrwNFm88J

" Go to the end and add a semicolon
inoremap <C-ENTER> <ESC>A;
inoremap 02P <ESC>A;

" Add a semicolon without moving the cursor and leaving insert mode
inoremap <C-S-ENTER> <ESC>maA;<ESC>`aa
inoremap O2R <ESC>maA;<ESC>`aa

" Add a new line below current line and go to it
inoremap <S-ENTER> <ESC>o
inoremap O2Q <ESC>o
