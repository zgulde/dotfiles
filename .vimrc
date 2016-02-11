syntax on

let mapleader = " "

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

map <Leader>c :noh<cr>
map <Leader>1 :set background=light<cr>
map <Leader>2 :set background=dark<cr>
map <Leader>r :!./%
map <Leader>n :call NumberToggle()<cr>

map <C-j> :m .+1<cr>
map <C-k> :m .-2<cr>

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
set ai
set si
set colorcolumn=80,100
set cursorline

colorscheme solarized

execute pathogen#infect()
