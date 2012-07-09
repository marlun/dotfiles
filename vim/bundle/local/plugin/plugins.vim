" ================ General ==================

runtime macros/matchit.vim

" ================ snipMate ==================

let g:snipMate = {'no_match_completion_feedkeys_chars': "\<tab>" }
let g:snipMate.scope_aliases = { 'php': 'php,html' }

" ================ Auto-pairs ==================

let g:AutoPairsShortcutFastWrap = '<C-S-J>'

" ================ tComment ==================

map <leader>c :TComment<cr>

" ================ NERDTree ==================

let NERDTreeQuitOnOpen=1

map <silent> <leader>e :NERDTreeToggle<CR>
map <silent> <leader>s :NERDTreeFind<CR>

" ================ Syntastic ==================

let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = {
\	'mode': 'active',
\	'active_filetypes': [],
\	'passive_filetypes': ['javascript']
\}

" ================ FuzzyFinder ==================

" FuzzyFinder's path to ctags
if has("gui_running")
	let g:fuf_buffertag_ctagsPath = '/usr/local/bin/ctags'
endif

if !exists('g:fuf_file_exclude')
	let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po]|pyc|png|jpg|jpeg|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|.*/tiny_mce.?/.*|.*template_c.*|node_modules'
endif
if !exists('g:fuf_dir_exclude')
	let g:fuf_dir_exclude = '\v(^|[/\\])\.(hg|git|bzr)($|[/\\])|tiny_mce.?|template_c|node_modules'
endif
if !exists('g:fuf_coveragefile_exclude')
	let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po]|pyc|png|jpg|jpeg|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|.*/tiny_mce.?/.*|.*template_c.*|node_modules'
endif

map <leader>f :FufBuffer<cr>
map <leader>t :FufBufferTag<cr>
map <leader>o :FufCoverageFile<cr>

" ================ TagBar ==================

let g:tagbar_autoclose = 1
let g:tagbar_usearrows = 0
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_type_php = {
\	'ctagstype' : 'PHP',
\	'kinds'     : [
	\	'd:constant definitions',
	\	'c:classes',
	\	'i:interfaces',
	\	'f:functions'
	\]
\}

map <leader>l :TagbarToggle<cr>
