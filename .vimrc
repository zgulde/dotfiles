set nocompatible
set runtimepath+=~/.vim/bundle/ultisnips
set runtimepath+=~/.vim/ftdetect/
set relativenumber
set number
set ruler
set cmdheight=1
set hlsearch
set incsearch
set ignorecase "case insensitive search
set smartcase  "unless there is a capital letter
set background=dark
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set breakindent "word wrap won't screw up formatting
set colorcolumn=80,100
set cursorline
set splitbelow    " more natural splits
set splitright    " more natural splits
set noequalalways " don't resize windows when I split
set nowrap
set omnifunc=syntaxcomplete#Complete
set wildmenu
set wildmode=list:longest,full
set foldmethod=indent
set foldlevel=20
set path=.,/usr/include,,** " searching through files in current directory
set pumheight=10 "max height for completion menu
set completeopt=menuone

" gui stuff
set guioptions-=L "get rid of scrollbars
set guioptions-=r
set guioptions-=e "get rid of gui tabs
set guifont=Ubuntu\ Mono:h16

syntax on

filetype on
filetype plugin indent on

colorscheme solarized

" +--------------------------------------------------------------+
" |                          Plugins                             |
" +--------------------------------------------------------------+

execute pathogen#infect()

runtime macros/matchit.vim

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
xnoremap x :call UltiSnips#SaveLastVisualSelection()<CR>gvs

" emmet
let g:user_emmet_leader_key='<C-m>'

nmap K :NERDTree<cr>

" alignment plugin
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

" multi-cursor stuff
let g:multi_cursor_exit_from_insert_mode=1

" +--------------------------------------------------------------+
" |                       Leader Mappings                        |
" +--------------------------------------------------------------+

" spacebar as leader
let mapleader = " "

" turn cursor column on and off
map <Leader>cc :set cursorcolumn!<cr>

" get rid of highlighted search terms
map <Leader>c :noh<cr>

" run the current file, read in the output to the end of the file, comment it
" out, and visually select all the output
map <Leader>r Go:r !%'[VGogcgvk

" toggle relative or absolut line numbers
map <Leader>n :set relativenumber!<cr>
map <Leader>nn :set norelativenumber<cr> :set nonumber<cr>

" substitution
map <Leader>S :%s/
map <Leader>s :s/

map <Leader>w :w<cr>

" add ; to end of line
map <Leader>; A;<esc>

" turn off smart and auto indent for pasting code
map <Leader>p :set ai!<cr> :set si!<cr> :set ai?<cr>

map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l

map <Leader><Leader> :call SyntaxAttr()<CR>

" new tab
map <Leader>t :tabe .<cr>

" search for file to open
map <Leader>o :find 

" see where I am in nested parens
nmap <Leader>, va(
xmap <Leader>, a(
xmap <Leader>. v`'

" tags
nnoremap <Leader>[ <C-[>
nnoremap <Leader>] <C-]>

" playing with colorschemes
map <Leader>1 :set background=light<cr>
map <Leader>2 :set background=dark<cr>

" colorschemes with both light and dark variants
map <Leader>3 :colo solarized<cr>
map <Leader>4 :colo pencil<cr>
map <Leader>5 :colo lucius<cr>
map <Leader>6 :colo materialbox<cr>
map <Leader>7 :colo rakr<cr>

map <Leader>0 :colo off<cr>



" light color schemes
map <Leader>11 :colo pyte<cr>
map <Leader>12 :colo soda<cr>
map <Leader>13 :colo laederon<cr>
map <Leader>14 :colo cascadia<cr>
map <Leader>15 :colo cake16<cr>
map <Leader>16 :colo proton<cr>
map <Leader>17 :colo cleanroom<cr>

" dark color schemes
map <Leader>21 :colo zenburn<cr>
map <Leader>22 :colo stonewashed-gui<cr>
map <Leader>23 :colo oceandeep<cr>

map <Leader>z :colo mine<cr>

" base 16
map <Leader>b1 :colo base16-3024<cr>
map <Leader>b2 :colo base16-apathy<cr>
map <Leader>b3 :colo base16-ashes<cr>
map <Leader>b4 :colo base16-atelierdune<cr>
map <Leader>b5 :colo base16-atelierforest<cr>
map <Leader>b6 :colo base16-atelierheath<cr>
map <Leader>b7 :colo base16-atelierlakeside<cr>
map <Leader>b8 :colo base16-atelierseaside<cr>
map <Leader>b9 :colo base16-bespin<cr>
map <Leader>b11 :colo base16-brewer<cr>
map <Leader>b12 :colo base16-bright<cr>
map <Leader>b13 :colo base16-chalk<cr>
map <Leader>b14 :colo base16-codeschool<cr>
map <Leader>b15 :colo base16-colors<cr>
map <Leader>b16 :colo base16-default<cr>
map <Leader>b17 :colo base16-eighties<cr>
map <Leader>b18 :colo base16-embers<cr>
map <Leader>b19 :colo base16-flat<cr>
map <Leader>b21 :colo base16-google<cr>
map <Leader>b22 :colo base16-grayscale<cr>
map <Leader>b23 :colo base16-greenscreen<cr>
map <Leader>b24 :colo base16-harmonic16<cr>
map <Leader>b25 :colo base16-isotope<cr>
map <Leader>b26 :colo base16-londontube<cr>
map <Leader>b27 :colo base16-marrakesh<cr>
map <Leader>b28 :colo base16-mocha<cr>
map <Leader>b29 :colo base16-monokai<cr>
map <Leader>b22 :colo base16-ocean<cr>
map <Leader>b31 :colo base16-paraiso<cr>
map <Leader>b32 :colo base16-pop<cr>
map <Leader>b33 :colo base16-railscasts<cr>
map <Leader>b34 :colo base16-shapeshifter<cr>
map <Leader>b35 :colo base16-solarized<cr>
map <Leader>b36 :colo base16-summerfruit<cr>
map <Leader>b37 :colo base16-tomorrow<cr>
map <Leader>b38 :colo base16-twilight<cr>

" colorsbox colorschemes
map <Leader>31 :colo colorsbox-faff<cr>
map <Leader>32 :colo colorsbox-greenish<cr>
map <Leader>33 :colo colorsbox-material<cr>
map <Leader>34 :colo colorsbox-stblue<cr>
map <Leader>35 :colo colorsbox-stbright<cr>
map <Leader>36 :colo colorsbox-steighties<cr>
map <Leader>37 :colo colorsbox-stnight<cr>

" +--------------------------------------------------------------+
" |                       Control Mappings                       |
" +--------------------------------------------------------------+

" page scrolling
nnoremap <C-[> <C-e>
nnoremap <C-]> <C-y>

" moving between windows
nmap <C-h> <C-w>h<C-w>\|
nmap <C-j> <C-w>j<C-w>_
nmap <C-k> <C-w>k<C-w>_
nmap <C-l> <C-w>l<C-w>\|

" emacs style beginning and end of line
imap <c-e> <c-o>$
imap <c-a> <c-o>0

" +--------------------------------------------------------------+
" |                       Other Mappings                         |
" +--------------------------------------------------------------+

" what to do with <tab> in normal and visual mode?
nnoremap <tab> %
xnoremap <tab> %

" better navigation to beggining of line
xnoremap 0 ^
nnoremap ^ 0
nnoremap 0 ^
xnoremap ^ 0

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Don't cancel visual selection when changing indent
xnoremap <  <gv
xnoremap >  >gv

" more consistent yanking default is the same as 'yy'
nmap Y y$

" execute macro in q
map Q @q

let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'html']


" +--------------------------------------------------------------+
" |                        Autocommands                          |
" +--------------------------------------------------------------+

" remove cursor line, relative numbers when leaving window
" https://www.reddit.com/r/vim/comments/4aab93/weekly_vim_tips_and_tricks_thread_1/
augroup highlight_follows_focus
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END

augroup active_relative_number
  au!
  au BufEnter * :setlocal number relativenumber
  au WinEnter * :setlocal number relativenumber
  au BufLeave * :setlocal nonumber norelativenumber
  au WinLeave * :setlocal nonumber norelativenumber
augroup END

" close autocompletion preview window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
