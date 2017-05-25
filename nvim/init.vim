" for formatting bulleted lists and numbered lists
set autoindent
set formatoptions+=n
set formatlistpat=^\\s*\\(\\d\\+[\\]:.)}\\t\ ]\\|-\\|\\*\\)\\s*

set mouse=a

set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Git-related:
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Providing autocompletion:
Plug 'Shougo/deoplete.nvim'
" Requires jedi python package
Plug 'zchee/deoplete-jedi'
" Requires tern node.js package
Plug 'carlitux/deoplete-ternjs'

" Provides linting.
" Uses node.js packages: jshint, jscs, eslint, csslint, stylelint,
" tidy, htmlhint
" Uses python packages: pylama, pydocstyle, pycodestyle, pylint,
" pyflakes, mccabe
Plug 'neomake/neomake'

" Editing tools:
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'ntpeters/vim-better-whitespace'

" Syntax highliting, language-specific commands and tools:
Plug 'dag/vim-fish'
Plug 'lepture/vim-jinja'
Plug 'irrationalistic/vim-tasks'
Plug 'jmcantrell/vim-virtualenv'

" Color schemes:
Plug 'rakr/vim-one'

call plug#end()

" backups and other junky files
set backupdir=~/.vim/backup     " get backups outta here
set directory=~/.vim/swap       " get swapfiles outta here
set writebackup                 " temp backup during write
set undodir=~/.vim/undo         " persistent undo storage
set undofile                    " persistent undo on

set number
set showcmd
set laststatus=2
set lazyredraw
set ruler
set showmatch

set termguicolors
set background=dark
colorscheme one
let g:one_allow_italics = 1

let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

" CTRL-t to toggle tree view
nmap <silent> <C-t> :NERDTreeToggle<CR>
" Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>

call deoplete#enable()
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let deoplete#sources#jedi#show_docstring = 1

" Maximum comment length ruler for Python
let &colorcolumn=72

let g:neomake_python_pylama_maker = {
      \ 'exe': 'pylama',
      \ 'args': ['--format', 'pep8', '--linters',
      \ 'pydocstyle,pycodestyle,pylint,pyflakes,mccabe', '--ignore',
      \ 'D203,D213'],
      \ 'errorformat': neomake#makers#ft#python#pylama()['errorformat'],
      \ }
autocmd! BufWritePost * Neomake

autocmd FileType html,jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType css,javascript,tasks setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType python,fish setlocal expandtab shiftwidth=4 softtabstop=4

autocmd BufWritePre * StripWhitespace
