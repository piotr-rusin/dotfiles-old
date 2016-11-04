set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" Git-related:
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Providing autocompletion:
Plugin 'Shougo/deoplete.nvim'
" Requires jedi python package
Plugin 'zchee/deoplete-jedi'
" Requires ternjs node.js package
Plugin 'carlitux/deoplete-ternjs'

" Provides linting.
" Uses node.js packages: jshint, jscs, eslint, csslint, stylelint,
" tidy, htmlhint
" Uses python packages: pylama, pydocstyle, pycodestyle, pylint,
" pyflakes, mccabe
Plugin 'neomake/neomake'

" Editing tools:
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'ntpeters/vim-better-whitespace'

" Syntax highliting, language-specific commands and tools:
Plugin 'dag/vim-fish'
Plugin 'lepture/vim-jinja'
Plugin 'irrationalistic/vim-tasks'
Plugin 'jmcantrell/vim-virtualenv'

" Color schemes:
Plugin 'rakr/vim-one'
Plugin 'joshdick/onedark.vim' " with set t_Co=256

call vundle#end()
filetype plugin indent on
syntax on

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

let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1

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

let g:python3_host_prog='~/.virtualenvs/neovim/bin/python'

let g:neomake_python_pylama_maker = {
      \ 'exe': 'pylama',
      \ 'args': ['--format', 'pep8', '--linters',
      \ 'pydocstyle,pycodestyle,pylint,pyflakes,mccabe'],
      \ 'errorformat': neomake#makers#ft#python#pylama()['errorformat'],
      \ }
autocmd! BufWritePost * Neomake

autocmd FileType html,jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType css,javascript,tasks setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType python,fish setlocal expandtab shiftwidth=4 softtabstop=4

autocmd BufWritePre * StripWhitespace
