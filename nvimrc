" Vim configuration file by Martin Lundberg <martin.lundberg@gmail.com>

" Plugins ------------------------------------------------------------------- {{{

call plug#begin('~/.nvim/bundle')

Plug 'marlun/vim-marlun'
Plug 'marlun/vim-starwars'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sukima/xmledit', { 'for': ['html', 'smarty'] }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'pgdouyon/vim-accio', { 'for': ['php', 'c'] }
Plug 'pgdouyon/vim-niffler'
Plug 'SirVer/ultisnips'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'for': ['php'] }
Plug 'justinmk/vim-sneak'
Plug 'Shougo/echodoc'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

call plug#end()

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

" Enable an improved (?) command completion menu
set wildmenu

" Improve command-line tab-completion by listing all matches and complete
" till longest common string
set wildmode=full

" Ignore case when completing file names and directories
set wildignorecase

" Ignore some things by default
set wildignore+=DS_Store,*/node_modules/*,*/smarty/*,*/tiny_mce/*,*/bower_components/*,*/lib/*

" Do upward search for tags file
set tags=./tags;,tags;

" Try safe (:h secure) source of project specific .vimrc file
set exrc
set secure

" Add swedish as a recognized language when spellchecking
set spelllang=en,sv

" }}}
" Interface ---------------------------------------------------------------- {{{

" Allow putting buffers in the background
set hidden

" Allways show the mode that vim is in
set noshowmode

" Show partial commands as you type them.
set showcmd

" Always show a statusline
set laststatus=2

" Tell vim to use all abbrevations when showing messages
set shortmess+=a

" Don't show insert completion messages
set shortmess+=c

" Don't highlight very long lines
set synmaxcol=256

" Don't redraw while executing macros, registers, etc.
set lazyredraw

" Highlight search matches and use incremental search
set hlsearch
set incsearch

" Make the statusline a lot more useful
set statusline=%f " Filename
set statusline+=\ %m%r%w " Modified, Readonly and Preview flags
set statusline+=%= " Switch to right side
set statusline+=%{fugitive#head()}
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

" Characters to use in 'list' mode
set listchars=tab:▸\ ,trail:·,eol:¬,space:·

" Ctrl-A over 07 incmrements to 08
set nrformats-=octal

" Select the first item in the completion popup by default
set completeopt+=noinsert

" Remove tags file from word completion because it was slow for me
set complete-=t

" Remove searching included file because the way it's implemented can by very
" slow (vim-sensible)
set complete-=i

" Where it makes sense, remove comment leader when joining lines
if v:version >= 704
	set formatoptions+=j
endif

" Use ag to grep if available
" if executable('ag')
" 	set grepprg=ag\ --nogroup\ --nocolor\ --column
" endif

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

nnoremap <leader>o :find<SPACE>
nnoremap <leader>l :buffers<CR>:buffer<SPACE>

" Open the word under the cursor in OSX dictionary
" if has('mac')
" 	nmap <silent> K :silent !open dict://<C-R><C-W><CR><Bar>:redraw!<CR>
" endif

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
nmap å ]
nmap ä [
nmap ö \
omap å ]
omap ä [
omap ö \
xmap å ]
xmap ä [
xmap ö \

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
	autocmd BufWritePost .nvimrc source %

	" Auto-source colorscheme when changed
	autocmd BufWritePost leya.vim source %

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

	" Set textwidth for wiki files
	autocmd FileType VIMWIKI setlocal tw=78

	" Make sure editing crontab works in OS X
	if has('mac')
		autocmd FileType crontab set nobackup nowritebackup
	endif

	" Add smarty gettext tags to surround
	autocmd FileType smarty let b:surround_103 = "{t}\r{/t}"

	" PHP
	autocmd FileType PHP let b:commentary_format = '// %s'

endif

" }}}
" Plugin configurations ------------------------------------------------------- {{{

" Matchit plugin comes with vim (see :e $VIMRUNTIME/macros/matchit.txt)
runtime macros/matchit.vim

" VimWiki
let g:vimwiki_list = [{
			\ 'path': '~/Documents/VimWiki/',
			\ 'syntax': 'markdown',
			\ 'ext': '.md'}]
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_table_mappings = 0

" Auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsCenterLine = 0
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutBackInsert = ''

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ["snips"]
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetsDir = g:plug_home . "/vim-marlun/snips"

" Niffler
let g:niffler_ignore_extensions = ['gif', 'jpg', 'png']
let g:niffler_ignore_dirs = ['cache', 'node_modules', 'templates_c', 'vendor']
map <leader>l :NifflerBuffer<cr>
map <leader>o :Niffler .<cr>
map <leader>t :NifflerTags %<cr>
map <leader>T :NifflerTags<cr>
map <leader>r :NifflerMRU<cr>

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_smart_case = 1

" Echodoc
let g:echodoc_enable_at_startup = 1

" Gutentags
let g:gutentags_define_advanced_commands = 1

" vim-sneak
nmap \ <Plug>Sneak_s
nmap Ö <Plug>Sneak_S
xmap \ <Plug>Sneak_s
xmap Ö <Plug>Sneak_S
omap \ <Plug>Sneak_s
omap Ö <Plug>Sneak_S

" vim-notes
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'

" }}}

" vim: foldmethod=marker
