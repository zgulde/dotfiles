set nocompatible
syntax on
filetype plugin indent on

" run time path
set rtp+=/usr/local/opt/fzf

" +--------------------------------------------------------------+
" |                          Plugins                             |
" +--------------------------------------------------------------+

" use plugged for plugins
call plug#begin('~/.local/share/nvim/plugged/')

" assuming fzf was installed w/ brew
Plug '/usr/local/opt/fzf'


" " languages I'm not using frequently
" Plug 'https://github.com/jebberjeb/clojure-socketrepl.nvim' let g:disable_socket_repl_mappings = 1
" Plug 'https://github.com/wlangstroth/vim-racket'
" Plug 'https://github.com/posva/vim-vue'
" Plug 'https://github.com/kchmck/vim-coffee-script'
Plug 'https://github.com/ElmCast/elm-vim'
let g:elm_setup_keybindings = 0
" Plug 'https://github.com/elixir-editors/vim-elixir'
" Plug 'https://github.com/Glench/Vim-Jinja2-Syntax.git'
" Plug 'https://github.com/dag/vim-fish.git'
" Plug 'https://github.com/leafgarland/typescript-vim.git'
" Plug 'https://github.com/wlangstroth/vim-racket.git'
" Plug 'https://github.com/mhartington/nvim-typescript.git', { 'do': ':UpdateRemotePlugins' }
" Plug 'https://github.com/leafgarland/typescript-vim'
" Plug 'https://github.com/tpope/vim-fireplace' " clojure
" Plug 'https://github.com/clojure-vim/async-clj-omni' " clojure
" Plug 'https://github.com/rust-lang/rust.vim'
" Plug 'https://github.com/sebastianmarkow/deoplete-rust'
" Plug 'https://github.com/zchee/deoplete-go', { 'do': 'make' }
" Plug 'https://github.com/jceb/vim-orgmode.git'
" Plug 'https://github.com/jwalton512/vim-blade.git'
Plug 'https://github.com/mxw/vim-jsx.git'
" Plug 'https://github.com/pangloss/vim-javascript'
" Plug 'https://github.com/ternjs/tern_for_vim'
" Plug 'carlitux/deoplete-ternjs'

" language enhancements
Plug 'https://github.com/mattn/emmet-vim.git'
Plug 'https://github.com/zchee/deoplete-jedi'
Plug 'https://github.com/tpope/vim-endwise.git' " for bash + ruby blocks

" Plug 'https://github.com/terryma/vim-multiple-cursors'
" Plug 'https://github.com/mg979/vim-visual-multi'
" editor enhancements
Plug 'https://github.com/mzlogin/vim-markdown-toc.git' " generate markdown toc
Plug 'https://github.com/osyo-manga/vim-anzu' " show search status
Plug 'https://github.com/dahu/vim-fanfingtastic' " make f and t movements multiline
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " async autocompletion
Plug 'https://github.com/Shougo/neco-syntax' " autocomplete based of file syntax def
Plug 'https://github.com/SirVer/ultisnips.git' " snippets
Plug 'https://github.com/editorconfig/editorconfig-vim.git' " respect .editorconfig files
Plug 'https://github.com/ervandew/supertab.git' " tab all the things!
Plug 'https://github.com/zgulde/auto-pairs.git' " pair ([{}])
Plug 'https://github.com/jpalardy/vim-slime' " send text to another [tmux|vim] [split|pane]
Plug 'https://github.com/jremmen/vim-ripgrep' " rg integration
Plug 'https://github.com/junegunn/vim-easy-align.git' " align things
Plug 'https://github.com/tommcdo/vim-lion.git'        " align things
Plug 'https://github.com/kana/vim-textobj-user.git' "
Plug 'https://github.com/kien/ctrlp.vim.git' " project files search
Plug 'https://github.com/machakann/vim-highlightedyank.git' " visually indicate what was yanked (neovim)
Plug 'https://github.com/tommcdo/vim-exchange.git' " exchange regions of text
Plug 'https://github.com/tpope/vim-commentary.git' " comment toggling
Plug 'https://github.com/tpope/vim-fugitive.git' " git integration
Plug 'https://github.com/tpope/vim-repeat' " make . better
Plug 'https://github.com/tpope/vim-speeddating' " ctrl-a, ctrl-x but for dates (and more)
Plug 'https://github.com/tpope/vim-surround.git' " surround things
Plug 'https://github.com/tpope/vim-unimpaired' " handy mappings
Plug 'https://github.com/tpope/vim-vinegar.git' " -, file browsing
Plug 'https://github.com/vim-scripts/SyntaxAttr.vim' " see what syntax/colorscheme rule is being applied
Plug 'https://github.com/wesQ3/vim-windowswap.git' " swap splits

" colorscheme
Plug 'https://github.com/flazz/vim-colorschemes/' " a whole bunch of them
Plug 'https://github.com/jonathanfilip/vim-lucius.git'
Plug 'https://github.com/andbar-ru/vim-unicon'

call plug#end()

" +--------------------------------------------------------------+
" |                       Plugin Config                          |
" +--------------------------------------------------------------+

" let g:deoplete#sources#rust#racer_binary='/Users/zach/.cargo/bin/racer'
" let g:deoplete#sources#rust#rust_source_path='/Users/zach/opt/rust/src'
"
" " deoplete-tern + tern_for_vim compatibility
" let g:tern#command = ["tern"]
" let g:tern#arguments = ["--persistent"]

" remove extra spaces when aligning
let g:lion_squeeze_spaces = 1

" deoplete
let g:deoplete#enable_at_startup = 1
" let deoplete handle this
let g:jedi#completions_enabled = 0
let g:deoplete#sources#jedi#python_path = '/Users/zach/anaconda3/bin/python'
" deoplete for clojure
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" Super Tab
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
xnoremap x :call UltiSnips#SaveLastVisualSelection()<CR>gvc
vnoremap x :call UltiSnips#SaveLastVisualSelection()<CR>gvc

" emmet
" let g:user_emmet_leader_key='<C-m>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript.jsx EmmetInstall
imap <expr> <c-j> emmet#expandAbbrIntelligent("\<c-j>")
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" vim-slime
let g:slime_target = "tmux" " use tmux split
" let g:slime_target = "vimterminal" " use native vim terminal
" let g:slime_target = "neovim" " use neovim terminal
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1

" alignment plugin
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

" anzu mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" multi-cursor stuff
let g:multi_cursor_exit_from_insert_mode=1

" ctrlp
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_custom_ignore = {
    \ 'dir':'node_modules\|vendor\|\.git\|build\|coverage\|env\|__pycache__\|target\|out'
    \}
" Allow spaces to be wildcards when searching, see https://github.com/kien/ctrlp.vim/issues/282
let g:ctrlp_regexp = 1
let g:ctrlp_abbrev = {
            \ 'abbrevs': [
            \ {
            \ 'pattern': ' ',
            \ 'expanded': '.*',
            \ 'mode': 'pfrz',
            \ }
            \]
            \}

" enable jsx syntax package without the .jsx file extension
let g:jsx_ext_required = 0

" vim-ripgrep config
let g:rg_highlight = 1

" don't try and autopair ' when writing lisp
au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
au Filetype lisp let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
au Filetype scheme let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
au Filetype scheme let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
au Filetype markdown let b:AutoPairs = {'`': '`', '"': '"', '{': '}', '''': '''', '(': ')', '[': ']', '*': '*'}

" when writing r markdown, use '# ' as the comments, not '> '
autocmd FileType rmd setlocal commentstring=#\ %s

" +--------------------------------------------------------------+
" |                       Editor Settings                        |
" +--------------------------------------------------------------+

set undofile

" color scheme
set t_Co=256
set background=light
colorscheme unicon

" appearence
""""""""""""
set ruler
set cmdheight=1
set colorcolumn=80,100,120
set cursorline         " highlight the current line
set foldmethod=manual  " create folds manually with zf{motion}
set pumheight=10       " max height for completion menu
set inccommand=nosplit " live preview substitutions
set listchars+=space:. " explicitly show space characters when showing whitespace (:set list)

" vim gui stuff
if has('gui')
    set guioptions-=L guioptions-=r guioptions-=e " get rid of gui nonsense
    set guifont=Monaco:h14
endif

" behavior
""""""""""

" search
set hlsearch incsearch " highlight search matches as they are found
set ignorecase smartcase " case insensitive search unless search contains a capital letter

" indentation
set expandtab " translate tabs to spaces
set smarttab tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent breakindent

set nowrap " no word wrap
set textwidth=80

" more natural splits
set splitbelow splitright noequalalways

set omnifunc=syntaxcomplete#Complete

set wildmenu wildmode=list:longest,full wildignore+=*.swp,*.zip
set completeopt=menuone,preview " tab cycles completions
set path=.,/usr/include,,** " searching through files in current directory

set backupdir=/Users/zach/.local/share/nvim/swap " don't clutter my working directory with swp files

set hidden " switch buffers even with unsaved work
set confirm " prompt to save changes before leaving a modified buffer

" +--------------------------------------------------------------+
" |                       Key Mappings                           |
" +--------------------------------------------------------------+

" spacebar as leader
let mapleader = " "

" multiple cursors
" nnoremap <silent> <Leader>mr :MultipleCursorsFind
" vnoremap <silent> <Leader>mr :MultipleCursorsFind

" org mode
map <Leader>cc :OrgCheckBoxToggle<cr>
map <Leader>cu :OrgCheckBoxUpdate<cr>
map <Leader>cn :OrgCheckBoxNewBelow<cr>
map <Leader>cp :OrgCheckBoxNewAbove<cr>
map <Leader>co :OrgHyperlinkFollow<cr>

" change indentation width (theres probably a better way to do this...)
map <Leader>t2 :set shiftwidth=2<cr>:set tabstop=2<cr>:set softtabstop=2<cr>
map <Leader>t4 :set shiftwidth=4<cr>:set tabstop=4<cr>:set softtabstop=4<cr>

" get rid of highlighted search terms
map <Leader>sc :noh<cr>

" run the current file, read in the output to the end of the file, comment it
" out, and visually select all the output. kinda gross, but it works
map <Leader>r Go:r !./%'[VGogcgvk

map <Leader>e :!./%<cr>
map <Leader>m :!make<cr>

" window manipulation with leader + w in addition to C-w
map <Leader>wh <C-w>h
map <Leader>wj <C-w>j
map <Leader>wk <C-w>k
map <Leader>wl <C-w>l
map <Leader>wv <C-w>v
map <Leader>ws <C-w>s
map <Leader>wo :only<cr>
map <Leader>wc <C-w>c
map <Leader>w= <C-w>=
map <Leader>wt :tabnew<cr>
map <Leader>wT <C-w>T

map <Leader>vn :vnew<cr>

" close the autocomplete preview window
map <Leader>pc :pclose<cr>

" copy the file to the clipboard
map <Leader>y mzgg"*yG'z

" open a markdown link
map <Leader>o f(yi(:!open 0

" duplicate line and comment out
map <Leader>d yypkgccj

" files
map <Leader>ff :e
map <Leader>fs :up<cr>
map <Leader>fe :e ~/.config/nvim/init.vim<cr>
map <Leader>fp :e ~/.config/nvim/UltiSnips<cr>
map <Leader>fb :e ~/.bashrc<cr>
map <Leader>fa :e ~/.aliases<cr>
map <Leader>ft :set ft=
map <Leader>ftm :set ft=markdown<cr>

map <Leader>te :term<cr>A
map <Leader>gs :Gstatus<cr>
map <Leader>gb :Gblame<cr>
map <Leader>gl :!git log --oneline --decorate --graph -n 10<cr>

map <Leader>gob :!go build<cr>
map <Leader>goi :!go install<cr>
map <Leader>gor :!go run %
map <Leader>gof :!go fmt<cr>

map <Leader>ca :!cargo
map <Leader>car :!cargo run<cr>
map <Leader>cab :!cargo build<cr>
map <Leader>cac :!cargo check<cr>

map <Leader>ac <Plug>(anzu-clear-search-status)

map <Leader>bp :bp<cr>
map <Leader>bn :bn<cr>
map <Leader>bs :CtrlPBuffer<cr>
map <Leader>bb :CtrlPBuffer<cr>

map <Leader>lt :!lein test<cr>

map <Leader>1 :set background=light<cr>
map <Leader>2 :set background=dark<cr>

map <Leader>;; gcc
map <Leader>; gc

map <Leader>wq :x<cr>

map <Leader>pi :PlugInstall<cr>
map <Leader>pp "*p

map <Leader>fj -

map <Leader><Leader> :call SyntaxAttr()<cr>

" Control Mappings
""""""""""""""""""

" " emacs has nothing on me!
" vmap <C-x><C-e> :!lumo -<cr>
" nmap <C-x><C-e> vip:!lumo -<cr>

" moving between windows, tiling wm-like effect
nmap <C-h> <C-w>h<C-w>\|
nmap <C-j> <C-w>j<C-w>_
nmap <C-k> <C-w>k<C-w>_
nmap <C-l> <C-w>l<C-w>\|

" emacs / readline style keybindings in insert mode
imap <c-e> <C-o>$
imap <c-a> <C-o>0
imap <c-f> <right>
imap <c-b> <left>
imap <c-k> <C-o>D
imap <c-l> <C-o>zz
imap <c-d> <C-o>dl
imap <c-s> <C-o>/
imap <c-/> <c-o>u
imap <c-g> <esc>
imap <c-y> <c-r>*
imap <c-r> <c-o>?

imap <m-a> <c-o>(
imap <m-e> <c-o>)
imap <m-f> <esc>ea
imap <m-b> <c-o>b
imap <m-d> <c-o>de
imap <m-q> <c-o>gwip
imap <m-bs> <c-o>vbd
imap <m-u> <c-o>gUe<c-o>e<right>
imap <m-l> <c-o>gue<c-o>e<right>
imap <m-c> <esc>lgUllguewa

" when entering commands too
cmap <C-f> <right>
cmap <C-b> <left>
cmap <C-e> <end>
cmap <C-a> <home>

" use supertab for completion so we can override c-p + c-n
" or just fall back to the c-x prefix
imap <C-p> <up>
imap <C-n> <down>

" Other Mappings
""""""""""""""""

inoremap jk <esc>

" turn current line into markdown h1 (H) or h2 (h)
nnoremap mh yypVr-
nnoremap mH yypVr=

" die typos
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" what to do with <tab> in normal and visual mode?
" tab to switch between tabs
nnoremap <tab> gt
nnoremap <s-tab> gT
nnoremap <c-tab> gT
" nnoremap <tab> za
" nnoremap <s-tab> zf
" vnoremap <tab> %

" Don't cancel visual selection when changing indent
xnoremap <  <gv
xnoremap >  >gv

" more consistent yanking, default is the same as 'yy'
nmap Y y$

" execute macro in q
map Q @q

" +--------------------------------------------------------------+
" |                       Miscellaneous                          |
" +--------------------------------------------------------------+

" .txt files should be treated as restructured text
autocmd BufRead,BufNewFile *.txt set filetype=rst

" tell vim anything with a .sh extension is bash, specifically (as opposed to another shell)
let g:is_bash = 1

" make comments italic in *all* languages
hi Comment cterm=italic

" status line
set statusline=<%{anzu#search_status()}>\ %h%r%w%F%m\ (%y)%=\ %c,\ %l/%L\ %p%%\

let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'html', 'php', 'sql', 'java']

" neovim specifics
if has('nvim')
    " https://github.com/neovim/neovim/issues/2048
    " nmap <BS> <C-W>h<C-W>\|
    " terminal mode mappings
    tnoremap <Esc> <C-\><C-n>
    tnoremap jk <C-\><C-n>

    " switch cursor shape between normal and insert mode
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

    " highlight yanks
    let g:highlightedyank_highlight_duration = 400
    hi HighlightedyankRegion cterm=reverse gui=reverse
endif

""" OCaml """

" " Append this to your .vimrc to add merlin to vim's runtime-path:
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
" " Also run the following line in vim to index the documentation:

set rtp+=/Users/zach/.opam/default/share/merlin/vim

" :execute "helptags " . g:opamshare . "/merlin/vim/doc"

" +--------------------------------------------------------------+
" |                        Abbreviations                         |
" +--------------------------------------------------------------+

" There's probably a more elegant way to do this, but I don't really want to
" learn a bunch of vimscript...
let g:my_abbreviations_on = 0
function! MyAbbreviate()
    if g:my_abbreviations_on == 1
        una ift
        una ld
        una ge
        una le
        una neq
        una omg
        una ep
        una cap
        una cup
        una es
        una ra
        una la
        una La
        una Ra
        una lra
        una Lra
        una iff
        una in
        let g:my_abbreviations_on = 0
        echo 'Abbreviations Off'
    else
        ab ift ∞
        ab ld λ
        ab ge ≥
        ab le ≤
        ab neq ≠
        ab omg Ω
        ab ep ε
        ab cup ∪
        ab cap ∩
        ab es ∅
        ab ra →
        ab la ←
        ab La ⇐
        ab Ra ⇒
        ab lra ↔︎
        ab Lra ⇔
        ab iff ⇔
        ab in ∈
        let g:my_abbreviations_on = 1
        echo 'Abbreviations On'
    endif
endfunction
map <Leader>ab :call MyAbbreviate()<cr>
imap <c-x>a <c-o>:call MyAbbreviate()<cr>

" +--------------------------------------------------------------+
" |                        Autocommands                          |
" +--------------------------------------------------------------+

" remove cursor line, relative numbers when leaving window
" https://www.reddit.com/r/vim/comments/4aab93/weekly_vim_tips_and_tricks_thread_1/
augroup highlight_follows_focus
  autocmd!
  autocmd! WinEnter * set cursorline
  autocmd! WinLeave * set nocursorline
augroup END

" close autocompletion preview window automatically
autocmd! CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd! InsertLeave * if pumvisible() == 0|pclose|endif

autocmd FileType clojure setlocal shiftwidth=2
autocmd FileType clojure setlocal tabstop=2
autocmd FileType clojure setlocal softtabstop=2

autocmd BufWritePost *.py !black -q %
autocmd BufWritePost *.py e %

au Filetype php set commentstring=//%s

" autocmd BufWritePost *.md !pandoc --from markdown --to markdown % | sponge %
" autocmd BufWritePost *.md e %
