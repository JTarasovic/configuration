" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2015 Mar 24
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
		set nobackup		" do not keep a backup file, use versions instead
else
		set backup		" keep a backup file (restore to previous version)
		set undofile		" keep an undo file (undo changes after closing)
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
		set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

		" Enable file type detection.
		" Use the default filetype settings, so that mail gets 'tw' set to 72,
		" 'cindent' is on in C files, etc.
		" Also load indent files, to automatically do language-dependent indenting.
		filetype plugin indent on

		" Put these in an autocmd group, so that we can delete them easily.
		augroup vimrcEx
				au!

				" For all text files set 'textwidth' to 78 characters.
				autocmd FileType text setlocal textwidth=78

				" When editing a file, always jump to the last known cursor position.
				" Don't do it when the position is invalid or when inside an event handler
				" (happens when dropping a file on gvim).
				autocmd BufReadPost *
										\ if line("'\"") >= 1 && line("'\"") <= line("$") |
										\   exe "normal! g`\"" |
										\ endif

		augroup END

else

		set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
		command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
								\ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
		" Prevent that the langmap option applies to characters that result from a
		" mapping.  If unset (default), this may break plugins (but it's backward
		" compatible).
		set langnoremap
endif

set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
set termencoding=utf-8
set laststatus=2
set noshowmode
set ts=4
set history=50					" keep 50 lines of command line history
set ruler						" show the cursor position all the time
set showcmd						" display incomplete commands
set incsearch					" do incremental searching
set number						" show line numbers
set background=dark
set guifont=Inconsolata\ for\ Powerline:h15

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
		syntax on
		set hlsearch
endif



" Plugins (vim-plug)
call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline-themes'

" utilities / generic
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'sotte/presenting.vim'
Plug 'benekastah/neomake'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/promptline.vim'
" Plug 'ctrlpvim/ctrlp.vim'


" language specific plugins 
" text
Plug 'elzr/vim-json', 			{ 'for': 'json' }
Plug 'chrisbra/csv.vim', 		{ 'for': ['csv','tsv'] }
" web stuff
Plug 'gregsexton/MatchTag', 	{ 'for': 'html' }
Plug 'othree/html5.vim', 		{ 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'moll/vim-node', 			{ 'for': 'javascript' }
Plug 'othree/yajs.vim', 		{ 'for': 'javascript' }
Plug 'mxw/vim-jsx', 			{ 'for': 'jsx' }
" markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" golang
Plug 'fatih/vim-go', 			{ 'for': 'go' }
" elixir
Plug 'elixir-lang/vim-elixir',	{ 'for': 'elixir' }
Plug 'mattreduce/vim-mix',		{ 'for': 'elixir' }


call plug#end()

" misc mappings
inoremap jj <esc>l 								" escape insert mode if you type jj
noremap <space> :set hlsearch! hlsearch?<cr>	" clear highlighted search
" location and quick fix helpers
noremap [l :lprevious<cr>
noremap ]l :lnext<cr>
noremap [L :lfirst<cr>							
noremap ]L :llast<cr>
noremap [q :cprevious<cr>
noremap ]q :cnext<cr>
noremap [Q :cfirst<cr>
noremap ]Q :clast<cr>



" airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

" tagbar
nmap <F8> :TagbarToggle<CR>


" language specific
" golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" elixir
let g:tagbar_type_elixir = {
	\ 'ctagstype' : 'elixir',
	\ 'kinds' : [
		\ 'f:functions',
		\ 'functions:functions',
		\ 'c:callbacks',
		\ 'd:delegates',
		\ 'e:exceptions',
		\ 'i:implementations',
		\ 'a:macros',
		\ 'o:operators',
		\ 'm:modules',
		\ 'p:protocols',
		\ 'r:records'
	\ ]
\ }

augroup filestuff
    autocmd!
    " golang
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>c <Plug>(go-coverage)
    au FileType go nmap <Leader>s <Plug>(go-implements)
    au FileType go nmap <Leader>i <Plug>(go-info)
    au FileType go nmap <Leader>e <Plug>(go-rename)
    au FileType go nmap <Leader>gd <Plug>(go-doc)

	" elixir
	au FileType elixir nmap <leader>r :Mix<CR>
	au FileType elixir nmap <leader>t :Mtest<CR>
	au FileType elixir nmap <leader>b :Mcompile<CR>

    " misc
    autocmd! BufWritePost * Neomake
    autocmd BufWritePost .vimrc source %
augroup END

colorscheme SlateDark
