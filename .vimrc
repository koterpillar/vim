execute pathogen#infect()
syntax on
filetype plugin indent on

set colorcolumn=80

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab

au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

au FileType htmldjango setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
	\ colorcolumn=

au FileType html setlocal colorcolumn=

set wildignore+=*_env,node_modules,*.pyc

set nu!

imap <C-BS> <C-W>
