set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle itself
Bundle 'gmarik/vundle'

" Generic
Bundle 'kien/ctrlp.vim'
Bundle 'summerfruit256.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'bronson/vim-trailing-whitespace'

" JavaScript
Bundle 'wookiehangover/jshint.vim'

" Haskell
Bundle 'bitc/vim-hdevtools'
Bundle 'pbrisbin/html-template-syntax'

" Python
Bundle 'klen/python-mode'

syntax on
filetype plugin indent on

colorscheme summerfruit256
set t_Co=256

if exists('+colorcolumn')
	set colorcolumn=80
endif

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
au FileType haskell setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

au FileType cabal setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

au FileType hamlet setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
let g:pymode_folding = 0
let g:pymode_lint_checker = "pep8,pylint"
let g:pymode_lint_cwindow = 1

au FileType htmldjango setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	\ colorcolumn=

au FileType perl setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
let perl_include_pod = 1

au FileType html setlocal colorcolumn=

au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

au FileType cucumber setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	\ colorcolumn=

set wildignore+=dist,node_modules,*.pyc

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set ignorecase smartcase

set number

set guioptions-=m
set guioptions-=T

imap <C-BS> <C-W>
imap <C-Del> <C-O>de

nnoremap <silent> <C-W>t :tabnew<CR>

command! W w !sudo sponge %

set exrc
