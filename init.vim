let mapleader="\<SPACE>"

syntax on
set encoding=utf-8          " Set encoding to utf-8
set showmatch 		        " Show matching brackets
set number 		            " Show line numbers
set formatoptions+=o 	    " Continue comment on new line
set expandtab		        " Tabs convert to spaces
set tabstop=4		        " Set tab length
set shiftwidth=4	        " Indentation amount for < and > commands
set nojoinspaces	        " Prevent 2 spaces after punctuation
set autoindent              " Enable autoindent
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set hidden                  " if hidden is not set, TextEdit might fail.

set listchars=eol:↵,trail:~,tab:>-,nbsp:␣
set ignorecase              " Make searching case insensitive
set smartcase               " ... unless the query has capital letters
set clipboard=unnamedplus   " Work with the system clipboarDCommenterToggle

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Map Esc
imap jj <ESC>

" All plugins go here
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf'}
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'NLKNguyen/papercolor-theme'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'psliwka/vim-smoothie'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

call plug#end()

" Theme
set background=dark
colorscheme PaperColor "onedark dracula PaperColor
let g:lightline = { 'colorscheme': 'PaperColor' } " onedark

" Whitespace stuff
let g:strip_whitespace_confirm = 0
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1

" Lightline Stuff
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

"Nerd Tree Stuff
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Tries to use .git as root folder,
" defaults to file directory
" why was this not easier?
function! SetProjectDirectory()
    try
        Gcd
    catch
        silent! lcd %:p:h
    endtry
    "NERDTreeVCS
    "NERDTreeClose
    "NERDTreeToggle
endfunction

nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>
nmap <A-/> <plug>NERDCommenterToggle

autocmd BufEnter * silent! call SetProjectDirectory()

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" coc.vim settings
set nobackup
set nowritebackup
