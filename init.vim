let mapleader="\<SPACE>"

syntax enable
filetype plugin indent on
set encoding=UTF-8          " Set encoding to utf-8
set showmatch 		        " Show matching brackets
set number 		            " Show line numbers
set formatoptions+=o 	    " Continue comment on new line
set expandtab		        " Tabs convert to spaces
set smarttab                " Be smart when using tabs ;)
set tabstop=4		        " Set tab length
set shiftwidth=4	        " Indentation amount for < and > commands
set nojoinspaces	        " Prevent 2 spaces after punctuation
set autoindent              " copy indent from current line when starting a new line
set smartindent             " even better autoindent (e.g. add indent after '{')
set incsearch               " Search as characters are entered
set hlsearch                " Highlight matches
set mouse=a                 " Enable mouse support
set wildmenu                " visual autocomplete for command menu
set autoread                " autoreload the file in Vim if changed outside of Vim
set listchars=eol:↵,trail:~,tab:>-,nbsp:␣
set ignorecase              " Make searching case insensitive
set smartcase               " ... unless the query has capital letters
set clipboard=unnamedplus   " Work with the system clipboarDCommenterToggle
" set backspace=eol,start,indent
set noerrorbells            " No bells to hear
set novisualbell            " No bells to see
set noswapfile              " Dont make swap files, most stuff is in git anyway
set wrap                    " Wrap lines

" Map Esc
imap jj <ESC>

" Map redo
noremap r <C-R>

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

call plug#end()

" Theme
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme PaperColor "onedark dracula PaperColor
let g:lightline = { 'colorscheme': 'PaperColor' } " onedark

"Comment Stuff
let g:NERDSpaceDelims = 1

" Whitespace stuff
let g:strip_whitespace_confirm = 0
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 0

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
" let NERDTreeDirArrows = 1

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

nnoremap <C-g> :Rg<Cr>
" Must disable <C-f> binding from vim-smoothie
nnoremap <C-f> :BLines<Cr>
nnoremap <C-p> :Files<Cr>
nmap <A-/> <plug>NERDCommenterToggle

autocmd BufEnter * silent! call SetProjectDirectory()

" Navigation
let g:smoothie_use_default_mappings = v:false
nmap <S-d> <Plug>(SmoothieDownwards)
nmap <S-u> <Plug>(SmoothieUpwards)i
nmap <C-d> <Plug>(SmoothieDownwards)
nmap <C-u> <Plug>(SmoothieUpwards)

" Simpler navigation between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Configuration for vim-scala
" au BufRead,BufNewFile *.sbt set filetype=scala

" coc.vim settings
" some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd cursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

