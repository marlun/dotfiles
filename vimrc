" Vim configuration file by Martin Lundberg <martin.lundberg@gmail.com>

" Plugins ------------------------------------------------------------------- {{{

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle has to manage itself (REQUIRED)
Plugin 'gmarik/vundle'

" Plugins
Plugin 'marlun/vim-marlun.git'
Plugin 'marlun/vim-starwars.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'sukima/xmledit'
Plugin 'neochrome/todo.vim'
Plugin 'vim-scripts/diffchanges.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'regedarek/ZoomWin'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'sjl/gundo.vim'
Plugin 'tommcdo/vim-exchange'

if has('lua') && has('patch-7.3.885')
	Plugin 'Shougo/neocomplete'
	Plugin 'Shougo/vimproc'
else
	Plugin 'Shougo/neocomplcache.vim'
endif

" Enable filetype detection with plugin and indent support
filetype plugin indent on

" }}}
" General ------------------------------------------------------------------ {{{

" Enable syntax highlighting and choose colorscheme
syntax on

" Load my own colorscheme if available but fallback
" to one that comes with vim
if has('mac') && findfile('colors/leya.vim', &rtp) != ''
	colorscheme leya
elseif findfile('colors/darth.vim', &rtp) != ''
	colorscheme darth
else
	colorscheme delek
endif

" Make sure vim uses UTF-8
set encoding=utf-8

" Make the unnamed register the "* register
set clipboard=unnamed

" Don't save swap-files for recovery
" TODO evaulate if I should remove this
set noswapfile

" Move vim backup files
set directory=~/tmp,/var/tmp,/tmp

" To make it easier to search for things I make vim ignore case except when
" the search pattern contains upper case characters
set ignorecase smartcase

" Improve command-line tab-completion by listing all matches and complete
" till longest common string
" TODO: Read more about 'wildmenu'
set wildmode=list:longest,full

" Ignore some things by default
set wildignore+=DS_Store,*/node_modules/*,*/smarty/*,*/tiny_mce/*,*/bower_components/*

" Do upward search for tags file
set tags=./tags;,tags;

" Try safe (:h secure) source of project specific .vimrc file
set exrc
set secure

" Add swedish as a recognized language when spellchecking
set spelllang=en,sv

" When encrypting any file, use the much stronger blowfish algorithm
set cryptmethod=blowfish

" }}}
" Interface ---------------------------------------------------------------- {{{

" Allow putting buffers in the background
set hidden

" Allways show the mode that vim is in
set showmode

" Show partial commands as you type them.
set showcmd

" Always show a statusline
set laststatus=2

" Tell vim to use all abbrevations when showing messages
set shortmess+=a

" Don't highlight very long lines
set synmaxcol=256

" Don't redraw while executing macros, registers, etc.
set lazyredraw

" Change the way vim splits windows. I like the new windows to the right
set splitright
set splitbelow

" Highlight search matches and use incremental search
set hlsearch
set incsearch

" Make the statusline a lot more useful
set statusline=%f " Filename
set statusline+=\ %m%r%w " Modified, Readonly and Preview flags
set statusline+=%= " Switch to right side
silent set statusline+=%{fugitive#head()}
set statusline+=\ [
set statusline+=%Y " File type
set statusline+=/%{&ff} " File format
set statusline+=/%{(&fenc==\"\"?&enc:&fenc)} " File encoding
set statusline+=]
set statusline+=[%v,%l/%L] " Cursor position

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
let s:tabwidth = 2
let &tabstop = s:tabwidth
let &softtabstop = s:tabwidth
let &shiftwidth = s:tabwidth

" Tab in front of a line inserts blanks according to 'shiftwidth'
set smarttab

" Copy the indent from the current line when starting a new
set autoindent

" We're fast and don't need to wait a whole second for a mapping
" or a key code
set timeoutlen=500

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
	set grepprg=ag\ --nogroup\ --nocolor\ --column
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
" Mappings & Abbrevations ------------------------------------------------ {{{

" Stupid fingers
iabbrev paied paid

" Best damn mapleader in the world: SPACE!
let mapleader=' '

nnoremap <silent> <c-l> :nohlsearch<CR>
nnoremap <silent> <leader>- :set nolist!<CR>
nnoremap <silent> <leader>W :echo ":w !sudo tee %"<CR>

" Uppercase the current word in insert mode
inoremap <c-^> <ESC>vbUgi

" Make it easier to work with wrapped text
noremap <silent> \w :call ToggleWrap()<CR>

" Open the word under the cursor in OSX dictionary
if has('mac')
	nmap <silent> K :silent !open dict://<C-R><C-W><CR><Bar>:redraw!<CR>
endif

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
	autocmd BufNewFile,BufRead README setlocal textwidth=78

	" Enable spellchecking in git commit messages
	autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

	" Set textwidth to 80 when editing branch descriptions
	autocmd BufNewFile,BufRead BRANCH_DESCRIPTION setlocal textwidth=78

	" Up security for encrypted files
	autocmd BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif

	" Don't want to fly around when writing e-mails
	autocmd FileType MAIL let g:AutoPairsFlyMode = 0
	autocmd FileType VIMWIKI setlocal tw=78

	" Make sure editing crontab works in OS X
	if has('mac')
		autocmd FileType crontab set nobackup nowritebackup
	endif

endif

" }}}
" Plugin configurations ------------------------------------------------------- {{{

" Matchit plugin comes with vim (see :e $VIMRUNTIME/macros/matchit.txt)
runtime macros/matchit.vim

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
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#use_vimproc = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#max_list = 10
let g:neocomplete#auto_completion_start_length = 3

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ["snips"]
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-marlun/snips"

" FuzzyFinder
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_coveragefile_globPatterns = ['**/*']
let g:fuf_buffertag__css='--language-force=css'
let g:fuf_buffertag__php='--php-kinds=f'

map <leader>l :FufBuffer<cr>
map <leader>t :FufBufferTag<cr>
map <leader>o :FufCoverageFile<cr>
map <leader>r :FufMruFile<cr>

" VimWiki
let g:vimwiki_list = [{'path': '~/Sync/vimwiki/'}]
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_table_mappings = 0

" }}}

" vim: foldmethod=marker
