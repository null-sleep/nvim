
let mapleader="\<SPACE>"

syntax on
set encoding=utf-8      " Set encoding to utf-8
set showmatch 		    " Show matching brackets
set number 		        " Show line numbers
set formatoptions+=o 	" Continue comment on new line
set expandtab		    " Tabs convert to spaces
set tabstop=4		    " Set tab length
set shiftwidth=4	    " Indentation amount for < and > commands
set nojoinspaces	    " Prevent 2 spaces after punctuation

set listchars=eol:↵,trail:~,tab:>-,nbsp:␣
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters


" All plugins go here
call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Whitespace stuff
let g:strip_whitespace_confirm = 0
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1

" Airline Stuff
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'
let g:airline_highlighting_cache = 1
