" ================ General ==================

runtime macros/matchit.vim

" ================ UltiSnips ==================
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ["snips"]
let g:UltiSnipsNoPythonWarning = 1

" ================ snipMate ==================
let g:snipMate = {'no_match_completion_feedkeys_chars': "\<tab>" }
let g:snipMate.scope_aliases = { 'php': 'php' }

" ================ Auto-pairs ==================
let g:AutoPairsShortcutFastWrap = '<C-S-J>'
let g:AutoPairsFlyMode = 1

" ================ tComment ==================
map <silent> <leader>e :TComment<cr>
let g:tcomment_types = {'javascript':'//%s'}

" ================ NERDTree ==================
let NERDTreeQuitOnOpen=1

map <silent> <leader>s :NERDTreeToggle<CR>

" ================ Syntastic ==================
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1

" ================ AutoComplPop ==================
let g:acp_behaviorXmlOmniLength = -1
let g:acp_behaviorHtmlOmniLength = -1

" ================ FuzzyFinder ==================
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po]|pyc|png|jpg|jpeg|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|.*/tiny_mce.?/.*|.*template_c.*|node_modules'
let g:fuf_dir_exclude = '\v(^|[/\\])\.(hg|git|bzr)($|[/\\])|tiny_mce.?|template_c|node_modules'
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po]|pyc|png|jpg|jpeg|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|.*/tiny_mce.?/.*|.*template_c.*|node_modules'

autocmd BufNewFile,BufRead *.js let g:fuf_buffertag_ctagsPath = '/usr/local/bin/jsctags'

map <leader>f :FufBuffer<cr>
map <leader>t :FufBufferTag<cr>
map <leader>o :FufCoverageFile<cr>
map <leader>r :FufMruFile<cr>

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
