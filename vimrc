" VIM configuration file by Martin Lundberg
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General

" I use a tool called pathogen to manage my plugins. It's created by Tim Pope
" and can be downloaded from https://github.com/tpope/vim-pathogen
"
" For the loading of plugins to work pathogen needs to run first
call pathogen#infect()

" Enable syntax highlighting and overrule with defaults
syntax on

" Enable filetype detection with plugin and indent support
filetype plugin indent on

" Lets add some nice colors. Vader is a color scheme created by me.
colorscheme leya

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INTERFACE

" Don't redraw while executing macros, registers, etc.
set lazyredraw

" Makes vim change the title of the window so it's possible to see if the file
" has been modified, is readonly, etc.
set title

" Always show a statusline
set laststatus=2

" Make the statusline a lot more useful
" 
" %f = Relative path to the current file
" %m = Modified flag
" %r = Readonly flag 
" %w = Preview window flag
" %Y = Type of file (vim, php, python)
" &ff = File format (MS-DOS, unix, mac)
" &fenc = File encoding
" %l, %v = Line, column number
" %p = Percentage through the file
" %L = Number of files in the buffer
" SyntasticStatuslineFlag is method made available by a plugin
" fugitive#statusline is also a method made available by a plugin
set statusline=%f\ %m%r%w\ [%Y,\ %{&ff},\ %{(&fenc==\"\"?&enc:&fenc)}]\%=[%l,%v][%p%%\ of\ %L]

" set statusline=%f\ %m%r%w\ [%Y,\ %{&ff},\ %{(&fenc==\"\"?&enc:&fenc)}]\%=%1*%{SyntasticStatuslineFlag()}%*%{fugitive#statusline()}[%l,%v][%p%%\ of\ %L]

" Allways show the mode that vim is in
set showmode

" Show partial commands as you type them.
set showcmd

" Complete to the longest common string and list matches
set wildmode=list:longest

" Change the way vim splits windows. I like the new windows to the right and
" below instead of the other way around.
set splitright
set splitbelow

" Highlight search matches
set hlsearch

" Allow putting buffers in the background
set hidden

" Maintain more context around the cursor
set scrolloff=3

if !has("gui_running")
	" Makes it possible to have different cursor types for different modes.
	" Works for iTerm2 not sure if it works anywhere else.
	let &t_SI = "\e]50;CursorShape=1\x7"
	let &t_EI = "\e]50;CursorShape=0\x7"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EDITOR

" In vi the backspace key could normally only delete the text inserted in the
" current edit session. I want the backspace key to be able to remove
" everything so I add everything (see :h 'backspace')
set backspace+=indent,eol,start

" Disable line-wrapping
set nowrap 

" Make a tab be 4 spaces both for read and when editing. Read about
" 'softtabstop' to know what I mean.
set tabstop=4
set softtabstop=4

" Make an indentation the same length as a tab
set shiftwidth=4

" Tab in front of a line inserts blanks according to 'shiftwidth'
set smarttab

" Copy the indent from the current line when starting a new
set autoindent

" Characters to use in 'list' mode
set listchars=tab:▸\ ,trail:·,eol:¬

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC

" To make it easier to search for things I make vim ignore case except when
" the search pattern contains upper case characters
set ignorecase
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTERNAL FILES

" All my mappings
runtime mappings.vim 
runtime autocmd.vim 

" Make % match more then just brackets
runtime macros/matchit.vim 
