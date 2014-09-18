" Reload .gvimrc when saving it
autocmd BufWritePost ~/.gvimrc source ~/.gvimrc

" Set default size
set columns=80 lines=27

" Remove Toolbar, scrollbars
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions+=rlb
set guioptions-=rlb

" Use the default tab UI
set guioptions-=e

" Don't use GUI dialogs
set guioptions+=c

" Fullscreen should fill the screen horizontally
set fuopt+=maxhorz

" Set the font to a big readable font
" set guifont=Source\ Code\ Pro:h18
set guifont=Inconsolata-g:h16

" User a light colorscheme for macvim
colorscheme leya

" Some tab shortcuts
map <d-1> :1tabnext<cr>
map <d-2> :2tabnext<cr>
map <d-3> :3tabnext<cr>
imap <d-1> <c-o>:1tabnext<cr>
imap <d-2> <c-o>:2tabnext<cr>
imap <d-3> <c-o>:3tabnext<cr>
nmap <c-tab> :tabnext<cr>
nmap <c-s-tab> :tabprevious<cr>
