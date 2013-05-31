execute pathogen#infect()
syntax on
filetype plugin indent on

set colorcolumn=80

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

au FileType cabal setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

au FileType htmldjango setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
	\ colorcolumn=

au FileType html setlocal colorcolumn=

au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

au FileType cucumber setlocal tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=

set wildignore+=dist,*_env,node_modules,*.pyc

set ignorecase smartcase

set number

set guioptions-=m
set guioptions-=T

imap <C-BS> <C-W>
imap <C-Del> <C-O>de

nnoremap <silent> <C-W>t :tabnew<CR>

cmap <silent> suw w !sudo sponge %
