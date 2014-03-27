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
Bundle 'godlygeek/tabular'

" JavaScript
Bundle 'wookiehangover/jshint.vim'

" Haskell
Bundle 'bitc/vim-hdevtools'
Bundle 'pbrisbin/html-template-syntax'

" Python
Bundle 'klen/python-mode'
let g:syntastic_ignore_files = ['\.py$']

" Docker
Bundle 'ekalinin/Dockerfile.vim'

syntax on
filetype plugin indent on

colorscheme summerfruit256
set t_Co=256

if has('gui_running')
	if system('fc-list | grep -q "Anonymous Pro" && echo 1 || echo 0')
		set guifont=Anonymous\ Pro\ 11
	endif
	set guioptions-=m
	set guioptions-=T
endif

if exists('+colorcolumn')
	set colorcolumn=80
endif

" Follow tabstop
set softtabstop=-1 shiftwidth=0

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
au FileType haskell setlocal tabstop=4 expandtab

au FileType cabal setlocal tabstop=2 expandtab

au FileType hamlet setlocal tabstop=2 expandtab

set wildignore+=cabal-dev

au FileType python setlocal tabstop=4 expandtab
let g:pymode_folding = 0
let g:pymode_lint_checker = "pep8,pylint"
let g:pymode_lint_cwindow = 1

au FileType htmldjango setlocal tabstop=2 expandtab colorcolumn=

au FileType yaml setlocal tabstop=2 expandtab

au FileType ruby setlocal tabstop=2 expandtab

au FileType perl setlocal tabstop=4 noexpandtab
let perl_include_pod = 1
au FileType mason setlocal tabstop=2 noexpandtab

au FileType html setlocal tabstop=2 expandtab colorcolumn=

au FileType javascript setlocal tabstop=2 expandtab

au FileType cucumber setlocal tabstop=2 expandtab colorcolumn=

set wildignore+=dist,node_modules,*.pyc

set history=1000
if exists('+undofile')
	set undofile
endif
if exists('+undodir')
	set undodir=$HOME/.vim/undo
endif
if exists('+undolevels')
	set undolevels=1000
endif
if exists('+undoreload')
	set undoreload=10000
endif

set ignorecase smartcase

set number

set completeopt-=preview

imap <C-BS> <C-W>
imap <C-Del> <C-O>de

nnoremap <silent> <C-W>t :tabnew<CR>

command! W w !sudo sponge %

set exrc
