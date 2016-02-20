syntax on

let mapleader = " "

" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
function! ToggleLineNumber()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

" code indentation
map <Leader>] :s/.*/    &/<cr> :noh<cr>
map <Leader>[ :s/    //<cr> :noh<cr>

" get rid of highlighted search terms
map <Leader>c :noh<cr>

map <Leader>1 :set background=light<cr>
map <Leader>2 :set background=dark<cr>

" run the current file
map <Leader>r :!./%

" toggle relative or absolut line numbers
map <Leader>n :call ToggleLineNumber()<cr>

" substitution
map <Leader>S :%s/
map <Leader>s :s/

" add ; to end of line
map <Leader>; A;<esc>

" turn off smart and auto indent for pasting code
map <Leader>p :set ai!<cr> :set si!<cr> :set ai?<cr>

" code commenting
map <Leader>m :s/.*/\/\/ &/<cr> :noh<cr>
map <C-m> :s/\/\/\s//<cr>

" page scrolling
map <C-j> <C-e>
map <C-k> <C-y>

map Q @q

"
" -----------------------javascript 'snippets'-----------------------
"
command Lcl :s/cl \(.*\)/console.log(\1);



set relativenumber
set ruler
set cmdheight=2
set hlsearch
set incsearch
set background=light
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
