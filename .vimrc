fun! SetupVimPlug()
	let autoload = expand('$HOME', 1) . '/.vim/autoload'
	if !isdirectory(autoload)
		execute '!curl --create-dirs --location -o ~/.vim/autoload/plug.vim '
			\ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	endif

endfun
call SetupVimPlug()
call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'ingo-library'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'Supertab'
Plug 'Syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fubitive'
Plug 'trailing-whitespace'
Plug 'Tabular'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'ConflictDetection'
Plug 'CountJump'
Plug 'ConflictMotions'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-indent-object'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'honza/vim-snippets'
Plug 'UltiSnips'
Plug 'editorconfig-vim'

" The default mode map for Syntastic
let g:syntastic_mode_map = {
	\ 'mode': 'active',
	\ 'passive_filetypes': [] }

" JavaScript, CSS et al.
Plug 'vim-javascript'
Plug 'wookiehangover/jshint.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'elzr/vim-json'
Plug 'raichoo/purescript-vim'
Plug 'frigoeu/psc-ide-vim'
Plug 'groenewege/vim-less'

au FileType html setlocal tabstop=2 expandtab colorcolumn=

au FileType javascript setlocal tabstop=2 expandtab

au FileType css setlocal tabstop=2 expandtab
au FileType less setlocal tabstop=2 expandtab

au FileType yaml setlocal tabstop=2 expandtab

au FileType json setlocal tabstop=2 expandtab
let g:vim_json_syntax_conceal = 0

set wildignore+=node_modules,bower_components


" Haskell
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

au FileType haskell nnoremap <buffer> <silent> tw :GhcModTypeInsert<CR>
au FileType haskell nnoremap <buffer> <silent> ts :GhcModSplitFunCase<CR>
au FileType haskell nnoremap <buffer> <silent> tq :GhcModType<CR>
au FileType haskell nnoremap <buffer> <silent> te :GhcModTypeClear<CR>

au FileType haskell setlocal tabstop=4 expandtab
au FileType haskell setlocal formatprg=hindent

let g:haskellmode_completion_ghc = 1
au FileType haskell setlocal omnifunc=necoghc#omnifunc

au FileType cabal setlocal tabstop=2 expandtab

au FileType hamlet setlocal tabstop=2 expandtab


" Python
Plug 'davidhalter/jedi-vim'
Plug 'klen/python-mode'
Plug 'hynek/vim-python-pep8-indent'

let g:jedi#show_call_signatures = "0"
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#usages_command = "<leader>u"

let g:pymode_folding = 0
let g:pymode_indent = 0
let g:pymode_run = 0

let g:pymode_lint_checkers = ['pep8', 'pylint']
let g:pymode_lint_cwindow = 0
let g:pymode_lint_options_pep8 = {'max_line_length': 999}
let g:pymode_lint_ignore = 'E501,I0011,I0012'

let g:pymode_rope_lookup_project = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_autoimport = 0
let g:pymode_rope_completion = 0
let g:pymode_syntax_print_as_function = 1

au FileType python setlocal tabstop=4 expandtab
au FileType htmldjango setlocal tabstop=2 expandtab colorcolumn=

" Disable Syntastic for Python files
call add(g:syntastic_mode_map['passive_filetypes'], 'python')
au FileType python let b:syntastic_auto_loc_list = 0

set wildignore+=dist,htmlcov,*.pyc

au FileType python command! -range=% Isort :<line1>,<line2>! isort -

" Split an argument list so that each argument is on its own line
function! DoSplitCommas()
	" If the argument list is already split, join it back
	try
		s/(\n/(/
	catch /^Vim\%((\a\+)\)\=:E486/
	endtry

	let l:commas = 1
	while l:commas
		try
			s/\()\)\@<!,\n */,/
		catch /^Vim\%((\a\+)\)\=:E486/
			let l:commas = 0
		endtry
	endwhile

	" Put the closing bracket onto a new line
	s/^\( *\)\(.*[^,]\),\? *)\([^)]*\)/\1\2,\r\1)\3/
	" Return to the original line
	execute "normal! k"

	" Find all commas separating arguments (except the last) and put each
	" argument onto its own line
	let l:commas = 1
	while l:commas
		try
			s/^\( *\)\(.\+\), *\($\)\@!/\1\2,\r\1    /
			execute "normal! k"
		catch /^Vim\%((\a\+)\)\=:E486/
			let l:commas = 0
		endtry
	endwhile

	" Put the first argument onto a new line
	s/^\( *\)\([^(]\+\)( */\1\2(\r\1    /
	execute "normal! k"
	nohlsearch
endfunction

au FileType python command! SplitCommas call DoSplitCommas()


" Docker
Plug 'ekalinin/Dockerfile.vim'


" Other
Plug 'puppetlabs/puppet-syntax-vim'


" End plugins
call plug#end()

" Generic
syntax on
filetype plugin indent on
set hlsearch

colorscheme summerfruit256
set t_Co=256

" Highlighting the word under cursor
" http://stackoverflow.com/a/25233145/288201
set updatetime=10

highlight WordUnderCursor guibg=LightYellow ctermbg=LightYellow

function! HighlightWordUnderCursor()
	if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
		exec 'match' 'WordUnderCursor' '/\V\<'.expand('<cword>').'\>/'
	else
		match none
	endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

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

nnoremap <silent> <Leader>n :nohlsearch<CR>

set grepprg=rg\ --vimgrep
let g:ackprg='rg --vimgrep'

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

command! W w !sudo sponge %

" Write all buffers, save a session and quit
function! SaveSession()
	all
	mksession!
	qall
endfunction

" Load and remove the session
function! LoadSession()
	source Session.vim
	silent !rm Session.vim
endfunction

command! SaveSession call SaveSession()
command! LoadSession call LoadSession()

set exrc
