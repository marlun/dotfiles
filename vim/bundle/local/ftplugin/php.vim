setlocal iskeyword+=$
nmap <silent> K :silent !open http://php.net/<C-R><C-W><CR>

" Compile current files
nmap O2S :!php %<CR>
nmap <D-Enter> :!php %<CR>
map <F5> :!php %<CR>
