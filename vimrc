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
	\ 'github:ctrlpvim/ctrlp.vim',
	\ 'commentary',
	\ 'sleuth',
	\ 'editorconfig-vim',
	\ ])

au FileType html setlocal tabstop=2 expandtab colorcolumn=

au FileType javascript setlocal tabstop=2 expandtab

au FileType css setlocal tabstop=2 expandtab
au FileType less setlocal tabstop=2 expandtab

au FileType yaml setlocal tabstop=2 expandtab

au FileType json setlocal tabstop=2 expandtab

set wildignore+=node_modules,bower_components

au FileType haskell setlocal tabstop=4 expandtab
au FileType haskell setlocal formatprg=hindent

au FileType cabal setlocal tabstop=2 expandtab

au FileType hamlet setlocal tabstop=2 expandtab

au FileType python setlocal tabstop=4 expandtab
au FileType htmldjango setlocal tabstop=2 expandtab colorcolumn=

set wildignore+=dist,htmlcov,*.pyc


" Generic
syntax on
filetype plugin indent on
set hlsearch

if exists('+colorcolumn')
	set colorcolumn=80
endif

" Follow tabstop
set softtabstop=-1 shiftwidth=0

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

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

command! W w !sudo sponge %

set exrc
