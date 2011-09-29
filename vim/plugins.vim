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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FuzzyFinder

" FuzzyFinder's path to ctags
if has("gui_running")
	let g:fuf_buffertag_ctagsPath = '/usr/local/bin/ctags'
endif

" FuzzyFinder bufferlist
map <leader>f :FufBuffer<cr>

" FuzzyFinder buffter tag list
map <leader>t :FufBufferTag<cr>

" FuzzyFinder open file in project
map <leader>o :FufCoverageFile<cr>

" FuzzyFinder options
if !exists('g:fuf_file_exclude')
	let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po]|pyc)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|.*/tiny_mce.?/.*|.*template_c.*|node_modules'
endif
if !exists('g:fuf_dir_exclude')
	let g:fuf_dir_exclude = '\v(^|[/\\])\.(hg|git|bzr)($|[/\\])|tiny_mce.?|template_c|node_modules'
endif
if !exists('g:fuf_coveragefile_exclude')
	let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po]|pyc)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|.*/tiny_mce.?/.*|.*template_c.*|node_modules'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar

" Toggle Tagbar
map <leader>g :TagbarToggle<cr>

" Only have the Tagbar open when you need it
let g:tagbar_autoclose = 1

" Remove the use of unicode arrows in tagbar
let g:tagbar_usearrows = 0

" Tagbar ctags command
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

