execute pathogen#infect()
Helptags

set nocompatible

set runtimepath+=~/.vim/bundle/ultisnips
set runtimepath+=~/.vim/ftdetect/
set runtimepath+=~/.fzf

let g:phpcomplete_parse_docblock_comments = 1

" set relativenumber
" set number
set ruler
set cmdheight=1
set hlsearch
set incsearch
set ignorecase "case insensitive search
set smartcase  "unless there is a capital letter
set background=light
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set breakindent "word wrap won't screw up formatting
set colorcolumn=80,100,120
set textwidth=80
set cursorline
set splitbelow    " more natural splits
set splitright    " more natural splits
set noequalalways " don't resize windows when I split
set nowrap
set omnifunc=syntaxcomplete#Complete
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.swp,*.zip
set foldmethod=indent
set foldlevel=20
set path=.,/usr/include,,** " searching through files in current directory
set pumheight=10 "max height for completion menu
set completeopt=menuone,preview
set backupdir=/home/zach/.vim/swp " don't clutter my working directory with swp files
set t_Co=256

" gui stuff
set guioptions-=L "get rid of scrollbars
set guioptions-=r
set guioptions-=e "get rid of gui tabs
" set guifont=Ubuntu\ Mono:h16
set guifont=Monaco:h14

syntax on
filetype on
filetype plugin indent on

colorscheme lucius

" +--------------------------------------------------------------+
" |                          Plugins                             |
" +--------------------------------------------------------------+

runtime macros/matchit.vim

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
xnoremap x :call UltiSnips#SaveLastVisualSelection()<CR>gvc
vnoremap x :call UltiSnips#SaveLastVisualSelection()<CR>gvc

" emmet
let g:user_emmet_leader_key='<C-m>'
let g:user_emmet_install_global = 0
autocmd FileType html EmmetInstall
autocmd FileType eruby EmmetInstall

" vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1

let g:netrw_liststyle=3

" alignment plugin
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

" multi-cursor stuff
let g:multi_cursor_exit_from_insert_mode=1

" tern js
let g:tern_show_signature_in_pum=1

" ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir':'node_modules\|vendor\|\.git'
    \}

" jedi -- why would you override _my_ leader mappings by default?
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = ""
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" +--------------------------------------------------------------+
" |                       Leader Mappings                        |
" +--------------------------------------------------------------+

" spacebar as leader
let mapleader = " "

" start git repl
map <Leader>wg :!with git<cr>

" filter the current buffer through external command
map <Leader>f :%!
" map <Leader>e :w !
map <Leader>e :%!python<cr>

" duplicate line
map <Leader>d yyp

" turn cursor column on and off
map <Leader>cc :set cursorcolumn!<cr>

" get rid of highlighted search terms
map <Leader>sc :noh<cr>

" run the current file, read in the output to the end of the file, comment it
" out, and visually select all the output
map <Leader>r Go:r !python %'[VGogcgvk

" toggle relative or absolut line numbers
map <Leader>n :set relativenumber!<cr>
map <Leader>nn :set nonumber!<cr>




" commentarry
map <Leader>; gc

" turn off smart and auto indent for pasting code
" map <Leader>p :set ai!<cr> :set si!<cr> :set ai?<cr>

map <Leader>p :!newlisp %<cr>

map <Leader>wh <C-w>h
map <Leader>wj <C-w>j
map <Leader>wk <C-w>k
map <Leader>wl <C-w>l
map <Leader>wo :only<cr>

map <Leader>or cor
map <Leader>ow cow
map <Leader>on con

map <Leader>bp :bp<cr>
map <Leader>bs :Buffers<cr>

map <Leader><Leader> :call SyntaxAttr()<CR>

" new tab
map <Leader>t :tabe .<cr>

" search for file to open
map <Leader>o :find 

" tags
nnoremap <Leader>[ <C-[>
nnoremap <Leader>] <C-]>

" All the fonts
map <Leader>f1 :set guifont=Ubuntu\ Mono:h16<cr>
map <Leader>f2 :set guifont=Monaco:h13<cr>
map <Leader>f3 :set guifont=Menlo:h14<cr>
map <Leader>f4 :set guifont=monofur:h16<cr>
map <Leader>f5 :set guifont=Inconsolata:h16<cr>
map <Leader>f6 :set guifont=Hack:h13<cr>
" map <Leader>f7 :set guifont=Source\ Code\ Pro:h13<cr>
" map <Leader>f8 :set guifont=Consolas:h13<cr>
" map <Leader>f9 :set guifont=Fira\ Code:h13<cr>
" map <Leader>f0 :set guifont=BPmono:h16<cr>

" ----- playing with colorschemes -----

map <Leader>1 :set background=light<cr>
map <Leader>2 :set background=dark<cr>

" +--------------------------------------------------------------+
" |                       Control Mappings                       |
" +--------------------------------------------------------------+

" emacs has nothing on me!
vmap <C-x><C-e> :!clisp -q -norc<cr>

" page scrolling
" nnoremap <C-[> <C-e>
" nnoremap <C-]> <C-y>

" moving between windows
nmap <C-h> <C-w>h<C-w>\|
nmap <C-j> <C-w>j<C-w>_
nmap <C-k> <C-w>k<C-w>_
nmap <C-l> <C-w>l<C-w>\|

" emacs style beginning and end of line
imap <c-e> <c-o>$
imap <c-a> <c-o>0

" **| to *|*
" imap ** **<left>

" +--------------------------------------------------------------+
" |                       Other Mappings                         |
" +--------------------------------------------------------------+

" die typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" :%!clisp -q -norc<cr>

nnoremap ge :%!
vnoremap ge :!

" what to do with <tab> in normal and visual mode?
nnoremap <tab> za
vnoremap <tab> %

" improved surround.vim bindings
" vmap s S
" nmap s ys

" better navigation to beggining of line
xnoremap 0 ^
nnoremap ^ 0
nnoremap 0 ^
xnoremap ^ 0

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

vnoremap H dhPgvhoho
vnoremap L dpgvlolo

inoremap jk <esc>

" Don't cancel visual selection when changing indent
xnoremap <  <gv
xnoremap >  >gv

" more consistent yanking default is the same as 'yy'
nmap Y y$

" execute macro in q
map Q @q

let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'html', 'php', 'sql']


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

" augroup active_relative_number
"   au!
"   au BufEnter * :setlocal number relativenumber
"   au WinEnter * :setlocal number relativenumber
"   au BufLeave * :setlocal nonumber norelativenumber
"   au WinLeave * :setlocal nonumber norelativenumber
" augroup END

" close autocompletion preview window automatically
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
