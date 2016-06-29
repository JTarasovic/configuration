syntax on
filetype plugin indent on

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
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/promptline.vim'
" Plug 'felixhummel/setcolors.vim'
Plug 'ryanoasis/vim-devicons'

" language specific plugins
" text
Plug 'elzr/vim-json', 			        { 'for': 'json' }
Plug 'chrisbra/csv.vim', 		        { 'for': ['csv','tsv'] }
" web stuff
Plug 'gregsexton/MatchTag', 	        { 'for': 'html' }
Plug 'othree/html5.vim', 		        { 'for': 'html' }
Plug 'pangloss/vim-javascript',         { 'for': 'javascript' }
Plug 'moll/vim-node', 			        { 'for': 'javascript' }
Plug 'millermedeiros/vim-esformatter',  { 'for': 'javascript' }
Plug 'mxw/vim-jsx', 			        { 'for': 'jsx' }
" markdown
Plug 'plasticboy/vim-markdown',         { 'for': 'markdown' }
" golang
Plug 'fatih/vim-go', 			        { 'for': 'go' }
" elixir
Plug 'elixir-lang/vim-elixir',	        { 'for': 'elixir' }
Plug 'mattreduce/vim-mix',		        { 'for': 'elixir' }
" Dockerfile
Plug 'ekalinin/Dockerfile.vim',         { 'for': 'Dockerfile' }

call plug#end()

" set variables and such
set nocompatible				" ignore backwards compatibility - ignored by neovim
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set fillchars+=stl:\ ,stlnc:\
set t_Co=256
set encoding=utf-8              " neovim won't let one of these be changes after it's been set
set termencoding=utf-8          " so it pitches a fit if you source this from a running instance
set laststatus=2
set noshowmode
set ts=4						" by default tabs are 4 spaces
set expandtab					" and expand them
set history=50					" keep 50 lines of command line history
set ruler						" show the cursor position all the time
set showcmd						" display incomplete commands
set incsearch					" do incremental searching
set hlsearch                    " turn on highlighting during searches
set number						" show line numbers
set langnoremap
set background=dark
set guifont=SauceCodePro\ Nerd\ Font\ Regular:h12
set mouse=a
set backup						" keep a backup file (restore to previous version)
set undofile					" keep an undo file (undo changes after closing)
" move temporary files out of working directory
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" VARIABLES
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" promptline
let g:promptline_preset = {
        \'a'    : [ promptline#slices#host({ 'only_if_ssh': 1 }),
                \'$( command -v nvm_ls_current > /dev/null 2>&1 && nvm_version="$(nvm_ls_current)" && echo ${nvm_version#none} )',
                \'$USER' ],
        \'b'    : [ promptline#slices#cwd() ],
        \'y'    : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
        \'z'    : [ promptline#slices#battery({ 'threshold': 100 }) ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
let g:promptline_theme = 'airline'
let g:promptline_symbols = {
        \'battery'   : ''}

" language specific
" csv
let g:csv_highlight_column = 'y'

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
                        \ 'p:package', 'i:imports:1', 'c:constants', 'v:variables', 't:types',
                        \ 'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor',
                        \ 'f:functions'
                        \ ],
                        \ 'sro' : '.',
                        \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
                        \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
                        \ 'ctagsbin'  : 'gotags',
                        \ 'ctagsargs' : '-sort -silent'
                        \ }


" elixir
let g:tagbar_type_elixir = {
                        \ 'ctagstype' : 'elixir',
                        \ 'kinds' : [ 'f:functions', 'functions:functions', 'c:callbacks',
                        \ 'd:delegates', 'e:exceptions', 'i:implementations', 'a:macros',
                        \ 'o:operators', 'm:modules', 'p:protocols', 'r:records'
                        \ ]
                        \ }



" MAPS
map Q gq                                        " Don't use Ex mode, use Q for formatting
nmap <F9> :TagbarToggle<CR>                     " F9 for Tagbar
nmap <space> :set hlsearch! hlsearch?<CR>	    " clear highlighted search
inoremap jj <esc>l 								" escape insert mode if you type jj
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" location and quick fix helpers
noremap [l :lprevious<CR>
noremap ]l :lnext<CR>
noremap [L :lfirst<CR>
noremap ]L :llast<CR>
noremap [q :cprevious<CR>
noremap ]q :cnext<CR>
noremap [Q :cfirst<CR>
noremap ]Q :clast<CR>

" custom functions
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

" AUTOCOMMAND GROUPS
augroup filespecific
        au!

        " golang
        au FileType go nmap <leader>r <Plug>(go-run)
        au FileType go nmap <leader>t <Plug>(go-test)
        au FileType go nmap <leader>b <Plug>(go-build)
        au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
        au FileType go nmap <leader>s <Plug>(go-implements)
        au FileType go nmap <leader>i <Plug>(go-info)
        au FileType go nmap <leader>e <Plug>(go-rename)
        au FileType go nmap <leader>a :GoAlternate<CR>
        au FileType go nmap <leader>gd <Plug>(go-doc)

        " elixir
        au FileType elixir nmap <leader>r :Mix<CR>
        au FileType elixir nmap <leader>t :Mtest<CR>
        au FileType elixir nmap <leader>b :Mcompile<CR>

augroup END

augroup general
        au!
        au BufWritePost .vimrc source %
        au BufWritePost init.vim source %       " for neovim
        au BufWritePost * Neomake
        "au BufWritePost *.js Esformatter

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        au BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") |  exe "normal! g`\"" | endif
augroup END

colorscheme antares
