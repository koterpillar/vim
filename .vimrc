filetype off
filetype indent plugin on
syn on

fun! SetupVAM()
	let c = get(g:, 'vim_addon_manager', {})
	let g:vim_addon_manager = c
	let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

	let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
	if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
		execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
			\ shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
	endif

	call vam#ActivateAddons([], {})
endfun
call SetupVAM()

call vam#ActivateAddons([
	\ 'ingo-library',
	\ 'ctrlp',
	\ 'summerfruit256',
	\ 'Supertab',
	\ 'Syntastic',
	\ 'commentary',
	\ 'fugitive',
	\ 'trailing-whitespace',
	\ 'Tabular',
	\ 'sleuth',
	\ 'surround',
	\ 'ConflictDetection',
	\ ])


" JavaScript, CSS et al.
call vam#ActivateAddons([
	\ 'jshint%3576',
	\ 'github:groenewege/vim-less',
	\ 'github:mustache/vim-mustache-handlebars',
	\ ])

au FileType html setlocal tabstop=2 expandtab colorcolumn=

au FileType javascript setlocal tabstop=2 expandtab

au FileType css setlocal tabstop=2 expandtab
au FileType less setlocal tabstop=2 expandtab


" Haskell
call vam#ActivateAddons([
	\ 'github:bitc/vim-hdevtools',
	\ 'github:pbrisbin/html-template-syntax',
	\ ])

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
au FileType haskell setlocal tabstop=4 expandtab

au FileType cabal setlocal tabstop=2 expandtab

au FileType hamlet setlocal tabstop=2 expandtab

set wildignore+=cabal-dev


" Python
call vam#ActivateAddons([
	\ 'github:klen/python-mode',
	\ 'github:hynek/vim-python-pep8-indent',
	\ ])
let g:pymode_folding = 0
let g:pymode_indent = 0
let g:syntastic_ignore_files = ['\.py$']
let g:pymode_lint_checkers = ['pep8']
let g:pymode_lint_cwindow = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_autoimport = 0
let g:pymode_syntax_print_as_function = 1

au FileType python setlocal tabstop=4 expandtab
au FileType htmldjango setlocal tabstop=2 expandtab colorcolumn=

set wildignore+=dist,node_modules,*.pyc


" Docker
call vam#ActivateAddons([
	\ 'github:ekalinin/Dockerfile.vim'
	\ ])


" Other
call vam#ActivateAddons([
	\ 'github:puppetlabs/puppet-syntax-vim',
	\ ])


syntax on
filetype plugin indent on
set hls

colorscheme summerfruit256
set t_Co=256

if has('gui_running')
	if system('fc-list | grep -q "Anonymous Pro" && echo 1 || echo 0')
		set guifont=Anonymous\ Pro\ 11
	endif
	set guioptions-=m
	set guioptions-=T

	" FIXME Windows are incorrectly resized when the tab line is shown
	set showtabline=2
endif

if exists('+colorcolumn')
	set colorcolumn=80
endif

" Follow tabstop
set softtabstop=-1 shiftwidth=0

au FileType yaml setlocal tabstop=2 expandtab

au FileType ruby setlocal tabstop=2 expandtab

au FileType perl setlocal tabstop=4 noexpandtab
let perl_include_pod = 1
au FileType mason setlocal tabstop=2 noexpandtab

au FileType cucumber setlocal tabstop=2 expandtab colorcolumn=

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
