syntax on
filetype plugin indent on

" Plugins (vim-plug)
call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline-themes'

" utilities / generic
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'sotte/presenting.vim'
Plug 'benekastah/neomake'
Plug 'shougo/deoplete.nvim',            { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" tmux and prompt generators
" leave these commented out normally
" Plug 'edkolev/promptline.vim'
" Plug 'edkolev/tmuxline.vim'
" Plug 'felixhummel/setcolors.vim'

" language specific plugins
" text
Plug 'elzr/vim-json',                   { 'for': 'json' }
Plug 'plasticboy/vim-markdown',         { 'for': 'markdown' }
Plug 'chrisbra/csv.vim',                { 'for': ['csv','tsv'] }
Plug 'stephpy/vim-yaml',                { 'for': ['yaml','yml'] }

" web stuff
Plug 'gregsexton/MatchTag',             { 'for': 'html' }
Plug 'othree/html5.vim',                { 'for': 'html' }
Plug 'pangloss/vim-javascript',         { 'for': ['javascript','js'] }
Plug 'moll/vim-node',                   { 'for': ['javascript','js'] }
Plug 'millermedeiros/vim-esformatter',  { 'for': ['javascript','js'] }
Plug 'mxw/vim-jsx',                     { 'for': 'jsx' }

" golang
Plug 'zchee/deoplete-go',               { 'do': 'make', 'for': 'go'}
Plug 'fatih/vim-go',                    { 'for': 'go' }

" elixir
Plug 'elixir-lang/vim-elixir',          { 'for': 'elixir' }
Plug 'mattreduce/vim-mix',              { 'for': 'elixir' }

" Dockerfile
Plug 'ekalinin/Dockerfile.vim',         { 'for': 'Dockerfile' }

call plug#end()

" set variables and such
set nocompatible                    " ignore backwards compatibility - ignored by neovim
set tabstop=4                       " by default tabs are 4 spaces
set softtabstop=4
set shiftwidth=4
set expandtab                       " and expand them
set clipboard+=unnamedplus          " use system clipboard always

set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set fillchars+=stl:\ ,stlnc:\
set t_Co=256
set encoding=utf-8                  " neovim won't let one of these be changes after it's been set
set termencoding=utf-8              " so it pitches a fit if you source this from a running instance
set laststatus=2
set noshowmode
set history=50                      " keep 50 lines of command line history
set ruler                           " show the cursor position all the time
set showcmd                         " display incomplete commands
set incsearch                       " do incremental searching
set hlsearch                        " turn on highlighting during searches
set number                          " show line numbers
set background=dark
set mouse=a
set backup                          " keep a backup file (restore to previous version)
set undofile                        " keep an undo file (undo changes after closing)

" completion related settings
set completeopt-=preview
set completeopt+=noselect

" move temporary files out of working directory
set backupdir=~/.local/share/nvim/backup//

if has('langmap') && exists('+langnoremap')
    set langnoremap
endif

" VARIABLES
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" promptline
" let kube_status = {
"     \'function_name': 'kube_status',
"     \'function_body': [
"         \'function kube_status {',
"         \'  local context="$(kubectl config current-context 2>/dev/null)"',
"         \'  context="${context:-N/A}"',
"         \'  local ns=$(kubectl config view --minify --output "jsonpath={..namespace}" 2>/dev/null)',
"         \'  ns="${ns:-default}"',
"         \'  printf "\u2388 %s:%s" "$context" "$ns"',
"         \'}']}


" let g:promptline_preset = {
"         \'a'    : [ promptline#slices#host({ 'only_if_ssh': 1 }),'$USER' ],
"         \'b'    : [ kube_status ],
"         \'c'    : [ promptline#slices#cwd() ],
"         \'y'    : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
"         \'z'    : [ promptline#slices#battery({ 'threshold': 100 }) ],
"         \'warn' : [ promptline#slices#last_exit_code() ]}
" let g:promptline_theme = 'airline'
" let g:promptline_symbols = {
"         \'battery'   : ''}


" deoplete
let g:deoplete#enable_at_startup = 1

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
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
" let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1
let g:go_metalinter_autosave = 0
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"


let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = "~/.cache/deoplete/go/$GOOS_$GOARCH"
let g:deoplete#sources#go#gocode_binary = "~/go/bin/gocode"

let g:neomake_go_gometalinter_args = ['--disable-all', '--enable=errcheck', '--enable=goimports' , '--enable=golint', '--enable=vet' ]

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
" nmap <space> :set hlsearch! hlsearch?<CR>       " clear highlighted search
inoremap jj <esc>l                              " escape insert mode if you type jj
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
        au FileType go set noexpandtab
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

        " javascript
        au FileType javascript setlocal ts=2 sw=2

        " yaml
        au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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
