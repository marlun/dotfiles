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

" The second lines in the following mappings is for iTerm2 but for them to work
" you need to create a mapping in iterm too so it sends the correct escape
" sequences. Read more here:
" https://groups.google.com/d/msg/iterm2-discuss/VEiCSc5LCIs/U5fqrwNFm88J

" Go to the end and add a semicolon
imap <C-ENTER> <ESC>A;
imap 02P <ESC>A;

" Add a semicolon without moving the cursor and leaving insert mode
imap <S-ENTER> <ESC>maA;<ESC>`aa
imap O2Q <ESC>maA;<ESC>`aa

" Add a new line below current line and go to it
imap <C-S-ENTER> <ESC>o
imap O2R <ESC>o
