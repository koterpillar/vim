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
	\ 'ag',
	\ 'ingo-library',
	\ 'github:ctrlpvim/ctrlp.vim',
	\ 'summerfruit256',
	\ 'Supertab',
	\ 'Syntastic',
	\ 'commentary',
	\ 'fugitive',
	\ 'github:tommcdo/vim-fubitive',
	\ 'trailing-whitespace',
	\ 'Tabular',
	\ 'sleuth',
	\ 'surround',
	\ 'ConflictDetection',
	\ 'CountJump',
	\ 'ConflictMotions',
	\ 'github:nathanaelkane/vim-indent-guides',
	\ 'vim-indent-object',
	\ 'vimproc',
	\ 'vim-snippets',
	\ 'UltiSnips',
	\ 'editorconfig-vim',
	\ ])

" The default mode map for Syntastic
let g:syntastic_mode_map = {
	\ 'mode': 'active',
	\ 'passive_filetypes': [] }

" JavaScript, CSS et al.
call vam#ActivateAddons([
	\ 'vim-javascript',
	\ 'jshint%3576',
	\ 'github:mustache/vim-mustache-handlebars',
	\ 'github:elzr/vim-json',
	\ 'github:raichoo/purescript-vim',
	\ 'github:frigoeu/psc-ide-vim',
	\ 'github:groenewege/vim-less',
	\ ])

au FileType html setlocal tabstop=2 expandtab colorcolumn=

au FileType javascript setlocal tabstop=2 expandtab

au FileType css setlocal tabstop=2 expandtab
au FileType less setlocal tabstop=2 expandtab

au FileType yaml setlocal tabstop=2 expandtab

au FileType json setlocal tabstop=2 expandtab
let g:vim_json_syntax_conceal = 0

set wildignore+=node_modules,bower_components


" Haskell
call vam#ActivateAddons([
	\ 'github:pbrisbin/vim-syntax-shakespeare',
	\ 'github:neovimhaskell/haskell-vim',
	\ 'github:eagletmt/ghcmod-vim',
	\ 'github:bitc/vim-hdevtools',
	\ 'github:eagletmt/neco-ghc',
	\ ])

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
au FileType haskell setlocal tabstop=4 expandtab

let g:haskellmode_completion_ghc = 0
au FileType haskell setlocal omnifunc=necoghc#omnifunc

au FileType cabal setlocal tabstop=2 expandtab

au FileType hamlet setlocal tabstop=2 expandtab


" Python
call vam#ActivateAddons([
	\ 'jedi-vim',
	\ 'github:klen/python-mode',
	\ 'github:hynek/vim-python-pep8-indent',
	\ ])

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

set wildignore+=dist,*.pyc

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
call vam#ActivateAddons([
	\ 'github:ekalinin/Dockerfile.vim'
	\ ])


" Other
call vam#ActivateAddons([
	\ 'github:puppetlabs/puppet-syntax-vim',
	\ ])


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
let g:SuperTabDefaultCompletionType = "context"

imap <C-BS> <C-W>
imap <C-Del> <C-O>de

nnoremap <silent> <C-W>t :tabnew<CR>

nnoremap <silent> <Leader>n :nohlsearch<CR>

let g:ag_working_path_mode="r"

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

command! W w !sudo sponge %

" Write all buffers, save a session and quit
function! SaveSession()
    wall
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
