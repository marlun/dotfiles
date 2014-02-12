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
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-scriptease'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/vimproc'
Bundle 'sukima/xmledit'
Bundle 'neochrome/todo.vim'
Bundle 'vim-scripts/diffchanges.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'wellle/targets.vim'
Bundle 'regedarek/ZoomWin'
Bundle 'AndrewRadev/splitjoin.vim'

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
set ignorecase smartcase

" Improve command-line completion by expanding on first TAB and showing
" 'wildmenu'
" set wildmenu
set wildmode=list:longest,full

" Ignore some things by default
set wildignore+=*/node_modules/*

" Do upward search for tags file
set tags=./tags;,tags;

" Try safe (:h secure) source of project specific .vimrc file
set exrc
set secure

" Add swedish as a recognized language when spellchecking
set spelllang=en,sv

" TODO Read more about this
" set ttimeoutlen=100

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

" Make the statusline a lot more useful
set statusline=%f " Filename
set statusline+=\ %m%r%w " Modified, Readonly and Preview flags
set statusline+=%= " Switch to right side
set statusline+=[
set statusline+=%Y " File type
set statusline+=/%{&ff} " File format
set statusline+=/%{(&fenc==\"\"?&enc:&fenc)} " File encoding
set statusline+=]
set statusline+=[%v,%l/%L] " Cursor position

" Tell vim to use all abbrevations when showing messages
set shortmess+=a

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

function! ToggleWrap()
	if &wrap
		if exists("g:toggle_wrap_tw")
			let &textwidth = g:toggle_wrap_tw
		endif
		setlocal nowrap
		nunmap <buffer> k
		nunmap <buffer> j
		nunmap <buffer> 0
		nunmap <buffer> $
	else
		let g:toggle_wrap_tw = &textwidth
		set textwidth=0
		setlocal wrap linebreak nolist
		noremap <buffer> <silent> k gk
		noremap <buffer> <silent> j gj
		noremap <buffer> <silent> 0 g0
		noremap <buffer> <silent> $ g$
	endif
endfunction

" }}}
" Mappings ---------------------------------------------------------------- {{{

" Best damn mapleader in the world: SPACE!
let mapleader=' '

nnoremap <silent> <c-l> :nohlsearch<CR>
nnoremap <silent> <leader>q :quit<CR>
nnoremap <silent> <leader>w :write<CR>
nnoremap <silent> <leader>W :write !sudo tee %<CR>
nnoremap <silent> <leader>- :set nolist!<CR>

" Make Y behave like C and D
nnoremap Y y$

" Uppercase the current word in insert mode
inoremap <c-^> <ESC>vbUgi

" On Swedish keyboards the [ and ] keys are not as easy to press as on
" american layouts and if you want to prsss the Ctrl-], Ctrl-[ and Ctrl-\
" you'll have to press the following combinations:
"
" Ctrl-] = Ctrl-å
" Ctrl-[ = Ctrl-ä
" Ctrl-\ = Ctrl-ö
"
" To make it more saner (I think) I also map the swedish keys to their
" corresponding keys without the ctrl key.
map å ]
map ä [
map ö \

" Make it easier to work with wrapped text
noremap <silent> \w :call ToggleWrap()<CR>

" Open the word under the cursor in OSX dictionary
if has('mac')
	nmap <silent> K :silent !open dict://<C-R><C-W><CR><Bar>:redraw!<CR>
endif

" The second lines in the following mappings is for iTerm2 but for them to work
" you need to create a mapping in iterm too so that it sends the correct escape
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

" Add a semicolon to the end and a new line below and go to it
inoremap <D-ENTER> <ESC>A;<CR>
inoremap O2S <ESC>A;<CR>

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

	" autocmd BufRead,BufNewFile */bjudovinn/* let g:syntastic_php_checkers=['php']
	" autocmd FileType todo noremap <cr> :TodoToggle<cr>

	" No need to completion in my TODO files
	autocmd FileType TODO NeoCompleteLock

endif

" }}}
" Plugin configurations ------------------------------------------------------- {{{

" Matchit plugin comes with vim (see :e $VIMRUNTIME/macros/matchit.txt)
runtime macros/matchit.vim

" Matchparen comes with vim but I don't like it so the following line disables it
let loaded_matchparen = 1

" Netrw
map <silent> <leader>s :e .<CR>
let g:netrw_hide = 1

" Auto-pairs
let g:AutoPairsShortcutFastWrap = '<C-S-F>'
let g:AutoPairsShortcutBackInsert = '<C-S-B>'
let g:AutoPairsFlyMode = 1
let g:AutoPairsCenterLine = 0

" Syntastic
let g:syntastic_auto_jump=2
let g:syntastic_auto_loc_list=1
let g:syntastic_php_phpmd_post_args="text  ~/.vim/bundle/0/phpmdrs.xml"
let g:syntastic_html_tidy_blocklevel_tags = ['a']

" Neocomplete
if has('lua')
	" let g:neocomplete#enable_cursor_hold_i = 1
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#use_vimproc = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#enable_auto_select = 1
	let g:neocomplete#max_list = 10
	let g:neocomplete#auto_completion_start_length = 3
endif

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 100
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|smarty\|tiny_mce'

" \ 'php' : '-f --erlang-types=drmf',
let g:ctrlp_buftag_types = {
\ 'php' : '--php-types=f',
\ 'javascript' : {
  \ 'bin': 'jsctags',
  \ 'args': '-f -',
  \ },
\ }

" let g:ctrlp_buffer_func = {
" \ 'enter': 'Function_Name_1',
" \ 'exit':  'Function_Name_2',
" \}

" if executable('ag')
" 	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif

map <leader>l :CtrlPBuffer<cr>
map <leader>t :CtrlPBufTag<cr>
map <leader>r :CtrlPMRU<cr>
map <leader>o :CtrlP<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ["snippets"]
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-marlun/snippets"

" }}}

" vim: foldmethod=marker
