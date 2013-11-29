" Vim configuration file by Martin Lundberg <martin.lundberg@gmail.com>

" Vundle ------------------------------------------------------------------- {{{

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle has to manage itself (REQUIRED)
Bundle 'gmarik/vundle'

" Plugins
Bundle 'git@github.com:marlun/vim-marlun.git'
Bundle 'git@github.com:marlun/vim-starwars.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'jesseschalken/list-text-object'
Bundle 'jiangmiao/auto-pairs'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'neochrome/todo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-scriptease'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/ZoomWin'
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/vimproc'
Bundle 'SirVer/ultisnips'
Bundle 'sukima/xmledit'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'shawncplus/phpcomplete.vim'
"Bundle 'majutsushi/tagbar'
"Bundle 'lepture/vim-jinja'

" Enable filetype detection with plugin and indent support
filetype plugin indent on

" }}}
" General ------------------------------------------------------------------ {{{

" Enable syntax highlighting and choose colorscheme
syntax on
colorscheme leya

" Make sure vim uses UTF-8
set encoding=utf-8

" Make the unnamed register the "* register
set clipboard=unnamed

" Move vim backup files
set directory=~/tmp,/var/tmp,/tmp

" To make it easier to search for things I make vim ignore case except when
" the search pattern contains upper case characters
set ignorecase
set smartcase

" Improve command-line completion by expanding on first TAB and showing
" 'wildmenu'
" set wildmenu
set wildmode=list:longest,full

" Do upward search for tags file
set tags=./tags;,tags;

" Try safe (:h secure) source of project specific .vimrc file
set exrc
set secure

" Add swedish as a recognized language when spellchecking
set spelllang=en,sv


" }}}
" Interface ---------------------------------------------------------------- {{{

" Makes vim change the title of the window so it's possible to see if the file
" has been modified, is readonly, etc.
set title

" Allow putting buffers in the background
set hidden

" Allways show the mode that vim is in
set showmode

" Show partial commands as you type them.
set showcmd

" Always show a statusline
set laststatus=2

"" Make the statusline a lot more useful
set statusline=%f\ %m%r%w%=%{fugitive#statusline()}[%Y,\ %{&ff},\ %{(&fenc==\"\"?&enc:&fenc)}][%l,%v]

" Don't highlight very long lines
set synmaxcol=512

" Don't redraw while executing macros, registers, etc.
set lazyredraw

" Change the way vim splits windows. I like the new windows to the right
set splitright
set splitbelow

" Highlight search matches and use incremental search
set hlsearch
set incsearch

" Makes it possible to have different cursor types for different modes.
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
elseif !has("gui_running")
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" }}}
" Editor ------------------------------------------------------------------- {{{

" In vi the backspace key could normally only delete the text inserted in the
" current edit session. I want the backspace key to be able to remove
" everything so I add everything (see :h 'backspace')
set backspace+=indent,eol,start

" Disable line-wrapping
set nowrap

" Make a tab be 4 spaces both for read and when editing. Read about
" 'softtabstop' to know what I mean. Set indentation to the same.
let s:tabwidth = 4
let &tabstop = s:tabwidth
let &softtabstop = s:tabwidth
let &shiftwidth = s:tabwidth

" Tab in front of a line inserts blanks according to 'shiftwidth'
set smarttab

" Copy the indent from the current line when starting a new
set autoindent

" Characters to use in 'list' mode
set listchars=tab:▸\ ,trail:·,eol:¬

" Treat all numbers as decimal numbers
set nrformats=

" Where it makes sense, remove comment leader when joining lines
if v:version >= 704
	set formatoptions+=j
endif

" Use ag to grep if available
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif

" }}}
" Functions --------------------------------------------------------------- {{{

fun! GoogleSearch()
	exec "silent !open http://www.google.com/search?q=" . expand("<cword>")
	redraw!
endfun

fun! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
	let s:ts = map(synstack(line('.'), col('.')), 'synIDtrans(v:val)')
	echo map(s:ts, 'synIDattr(v:val, "name")')
endfun

" }}}
" Mappings ---------------------------------------------------------------- {{{

let mapleader=' '

inoremap <C-l> <ESC>
nnoremap <silent> <c-l> :nohlsearch<CR>
nnoremap <silent> <leader>q :quit<CR>
nnoremap <silent> <leader>w :write<CR>
nnoremap <silent> <leader>- :set nolist!<CR>

" Tab navigation
nnoremap <C-j> :tabnext<CR>
nnoremap <C-k> :tabprevious<CR>

" Make Y behave like C and D
nnoremap Y y$

" The second lines in the following mappings is for iTerm2 but for them to work
" you need to create a mapping in iterm too because it sends the correct escape
" sequences. Read more here:
" https://groups.google.com/d/msg/iterm2-discuss/VEiCSc5LCIs/U5fqrwNFm88J

" Go to the end and add a semicolon
inoremap <C-ENTER> <ESC>A;
inoremap O2P <ESC>A;

" Add a semicolon without moving the cursor and leaving insert mode
inoremap <C-S-ENTER> <ESC>maA;<ESC>`aa
inoremap O2R <ESC>maA;<ESC>`aa

" Add a new line below current line and go to it
inoremap <S-ENTER> <ESC>o
inoremap O2Q <ESC>o

" TODO Add a mapping for command-enter which adds a semicolon to the end and a
" line below and go to it.

" Open the word under the cursor in OSX dictionary
if has('mac')
	nmap <silent> K :silent !open dict://<C-R><C-W><CR><Bar>:redraw!<CR>
endif

" Show syntax highlighting groups for word under cursor
nnoremap <C-P> :call <SID>SynStack()<CR>

" Google search for the keyword under the cursor
nmap <leader>g :call GoogleSearch()<CR>

" }}}
" Automatic commands ------------------------------------------------------- {{{

if has("autocmd") && !exists("autocommands_loaded")

	let autocommands_loaded = 1

	" Auto-source config files when changed
	autocmd BufWritePost .vimrc source %

	" Add default content when creating PHP files
	autocmd BufNewFile *.php call setline(1, ['<?php', '', '']) | call setpos('.', [0, 3, 0, 0]) | startinsert

	" Add dashes as part of keyword in CSS files
	autocmd BufRead,BufNewFile CSS setlocal iskeyword+=-

	" Make vim see Vagrantfile as a ruby file
	autocmd BufRead,BufNewFile Vagrantfile setlocal filetype=ruby

	" Make vim see javascript template files as html
	autocmd BufNewFile,BufRead *.jst setlocal filetype=jst

	" Set textwidth for README file to 80 chars
	autocmd BufNewFile,BufRead README setlocal textwidth=80

	" Enable spellchecking in git commit messages
	autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

	" Set textwidth to 80 when editing branch descriptions
	autocmd BufNewFile,BufRead BRANCH_DESCRIPTION setlocal textwidth=80

	" Make sure editing crontab works in OS X
	autocmd FileType crontab set nobackup nowritebackup

	" Use omnifunc feature if it exists for this filetype
	if has("autocmd") && exists("+omnifunc")
		autocmd Filetype *
		\	if &omnifunc == "" |
		\		setlocal omnifunc=syntaxcomplete#Complete |
		\	endif
	endif

	" PLUGINS
	autocmd BufRead,BufNewFile */bjudovinn/* let g:syntastic_php_checkers=['php']
	autocmd BufNewFile,BufRead *.js let g:fuf_buffertag_ctagsPath = '/usr/local/bin/jsctags'
	autocmd BufLeave *.js let g:fuf_buffertag_ctagsPath = 'ctags'
	autocmd FileType todo noremap <cr> :TodoToggle<cr>

endif

" }}}
" Plugin configurations ------------------------------------------------------- {{{

"  Vim default
runtime macros/matchit.vim

" tComment
map <silent> <leader>c :TComment<cr>
let g:tcomment_types = {'javascript':'//%s','asm':'#%s'}

" Auto-pairs
let g:AutoPairsShortcutFastWrap = '<C-S-F>'
let g:AutoPairsShortcutBackInsert = '<C-S-B>'
let g:AutoPairsFlyMode = 1
let g:AutoPairsCenterLine = 0

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ["snippets"]
let g:UltiSnipsNoPythonWarning = 1

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeHijackNetrw=1
map <silent> <leader>s :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_php_phpmd_post_args="text  ~/.vim/bundle/0/phpmdrs.xml"

" FuzzyFinder
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_coveragefile_globPatterns = ['**/*']
let g:fuf_buffertag__css='--language-force=css'
set wildignore+=node_modules/**
" call l9#defineVariableDefault('g:fuf_buffertag__css' , '--language-force=css --css-types=f')

map <leader>f :FufBuffer<cr>
map <leader>t :FufBufferTag<cr>
map <leader>o :FufCoverageFile<cr>
map <leader>r :FufMruFile<cr>

" TagBar
let g:tagbar_left = 1
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
let g:tagbar_type_css = {
\	'ctagstype' : 'Css',
\	'kinds'     : [
	\	'c:classes',
	\	's:selectors',
	\	'i:identities'
	\]
\}

map <leader>l :TagbarToggle<cr>

" Gundo
nnoremap <leader>u :GundoToggle<cr>

" Neocomplete
if has('lua')
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#use_vimproc = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#enable_auto_select = 1
	let g:neocomplete#max_list = 10
	let g:neocomplete#auto_completion_start_length = 3
endif

" }}}
" vim: tw=80 foldmethod=marker
