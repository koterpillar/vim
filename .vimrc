execute pathogen#infect()
syntax on
filetype plugin indent on

if v:version >= 703
	set colorcolumn=80
endif

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

au FileType cabal setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

au FileType perl setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
let perl_include_pod = 1

au FileType htmldjango setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
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

command! W w !sudo sponge %
