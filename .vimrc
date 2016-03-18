set nocompatible
filetype on
set runtimepath+=~/.vim/bundle/ultisnips
set runtimepath+=~/.vim/ftdetect/

execute pathogen#infect()
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
runtime macros/matchit.vim

" ---------------------------------------------

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
xnoremap x :call UltiSnips#SaveLastVisualSelection()<CR>gvs

syntax on
set wildmenu
set wildmode=list:longest,full

set foldmethod=indent
set foldlevel=20

" searching through files in current directory
set path=.,/usr/include,,**

let mapleader = " "

" turn cursor column on and off
map <Leader>cc :set cursorcolumn!<cr>

" get rid of highlighted search terms
map <Leader>c :noh<cr>

" playing with colorschemes
map <Leader>1 :set background=light<cr>
map <Leader>2 :set background=dark<cr>

map <Leader>3 :colo solarized<cr>
map <Leader>4 :colo zenburn<cr>
map <Leader>5 :colo pencil<cr>
map <Leader>6 :colo moonshine<cr>
map <Leader>7 :colo stonewashed<cr>
map <Leader>8 :colo oceandeep<cr>
map <Leader>9 :colo pyte<cr>

map <Leader>z :colo mine<cr>

map <Leader>11 :colo colorsbox-faff<cr>
map <Leader>12 :colo colorsbox-greenish<cr>
map <Leader>13 :colo colorsbox-material<cr>
map <Leader>14 :colo colorsbox-stblue<cr>
map <Leader>15 :colo colorsbox-stbright<cr>
map <Leader>16 :colo colorsbox-steighties<cr>
map <Leader>17 :colo colorsbox-stnight<cr>



" run the current file, read in the output to the end of the file, comment it
" out, and visually select all the output
map <Leader>r Go:r !%'[VGogcgvk
" map <Leader>r :!./%

" toggle relative or absolut line numbers
map <Leader>n :set relativenumber!<cr>

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

" page scrolling
nnoremap <C-[> <C-e>
nnoremap <C-]> <C-y>

nnoremap <Leader>[ <C-[>
nnoremap <Leader>] <C-]>


" moving between windows
nmap <C-h> <C-w>h<C-w>\|
nmap <C-j> <C-w>j<C-w>_
nmap <C-k> <C-w>k<C-w>_
nmap <C-l> <C-w>l<C-w>\|

" what to do with <tab> in normal and visual mode?
nnoremap <tab> %
xnoremap <tab> %



" new tab
map <Leader>t :tabe .<cr>

" search for file to open
map <Leader>o :find 

" better (for me) navigation to beggining of line
nnoremap 0 ^
nnoremap ^ 0

" see where I am in nested parens
nmap <Leader>, va(
xmap <Leader>, a(
xmap <Leader>. v`'

" emmet
let g:user_emmet_leader_key=','

nmap K :NERDTree<cr>

" alignment plugin
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

" multi-cursor stuff
let g:multi_cursor_exit_from_insert_mode=1

let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'html']

" execute macro in q
map Q @q

set relativenumber
set number
set ruler
set cmdheight=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set background=dark
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set breakindent
set colorcolumn=80,100
set cursorline
set splitbelow    " more natural splits
set splitright    " more natural splits
set noequalalways " don't resize windows when I split
set nowrap

" hi Search cterm=underline term=underline

colorscheme solarized

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

" gui stuff
set guioptions-=L
set guioptions-=r
set guifont=Ubuntu\ Mono:h16
