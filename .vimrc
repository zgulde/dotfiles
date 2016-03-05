set nocompatible
filetype on
set runtimepath+=~/.vim/bundle/ultisnips
set runtimepath+=~/.vim/ftdetect/

execute pathogen#infect()
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" ---------------------------------------------

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" youcompleteme stuff
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

syntax on
set wildmenu
set wildmode=list:longest,full

set foldmethod=indent
set foldlevel=20

" searching through files in current directory
set path=.,/usr/include,,**

let mapleader = " "

" get rid of highlighted search terms
map <Leader>c :noh<cr>

map <Leader>1 :set background=light<cr>
map <Leader>2 :set background=dark<cr>

" run the current file
map <Leader>r :execute '!' . &ft . ' ' . @%<cr>

" toggle relative or absolut line numbers
map <Leader>n :set relativenumber!<cr>

" substitution
map <Leader>S :%s/
map <Leader>s :s/

" add ; to end of line
map <Leader>; A;<esc>

" turn off smart and auto indent for pasting code
map <Leader>p :set ai!<cr> :set si!<cr> :set ai?<cr>

map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l

" page scrolling
map <C-[> <C-e>
map <C-]> <C-y>

" moving between windows
nmap <C-h> <C-w>h<C-w>\|
nmap <C-j> <C-w>j<C-w>_
nmap <C-k> <C-w>k<C-w>_
nmap <C-l> <C-w>l<C-w>\|

" new tab
map <Leader>t :tabe .<cr>

" search for file to open
map <Leader>o :find 

" better (for me) navigation to beggining of line
nnoremap 0 ^
nnoremap ^ 0

" emmet
map <Leader>, <C-y>,

nmap K :NERDTree<cr>

" alignment plugin
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

" multi-cursor stuff
let g:multi_cursor_exit_from_insert_mode=0

" execute macro in q
map Q @q

set relativenumber
set number
set ruler
set cmdheight=2
set hlsearch
set incsearch
set background=dark
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set colorcolumn=80,100
set cursorline
set splitbelow    " more natural splits
set splitright    " more natural splits
set noequalalways " don't resize windows when I split
set nowrap

colorscheme solarized
