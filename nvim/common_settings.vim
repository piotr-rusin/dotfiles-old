" Settings common to all configurations of vim

" General settings:
set nocompatible

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

" for formatting bulleted lists and numbered lists
set autoindent
set formatoptions+=n
set formatlistpat=^\\s*\\(\\d\\+[\\]:.)}\\t\ ]\\|-\\|\\*\\)\\s*

set mouse=a

" Plugin-related settings:
set background=dark
" Using a theme set with base16_* command
" (provided https://github.com/chriskempson/base16-shell is installed)
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" manually setting airline theme
" TODO: test alternatives:
" * base16_oceanicnext
" * tomorrow
" * ubaryd
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '

