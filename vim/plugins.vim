""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree

" I only use the toggle feature of NERDCommenter
map <silent> <leader>s :NERDTreeToggle<CR>

" Tell NERDTree to close after opening a file
let NERDTreeQuitOnOpen=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter

" I only use the toggle feature of NERDCommenter
map <silent> <Leader>e <plug>NERDCommenterToggle


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic

" Jump to the first error
let g:syntastic_auto_jump=1

" Automatically open and close location list on error
let g:syntastic_auto_loc_list=1
