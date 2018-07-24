" (do (use 'figwheel-sidecar.repl-api)
"     (start-figwheel!)
"     (cljs-repl))

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

Plug 'https://github.com/nikvdp/ejs-syntax'

" " clojure stuff
Plug 'https://github.com/tpope/vim-fireplace'
Plug 'https://github.com/clojure-vim/async-clj-omni'
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" Plug 'https://github.com/tpope/vim-dispatch.git'
" Plug 'https://github.com/radenling/vim-dispatch-neovim'
" Plug 'https://github.com/tpope/vim-salve'

" Plug 'https://github.com/jebberjeb/clojure-socketrepl.nvim'
" let g:disable_socket_repl_mappings = 1

" " languages I'm not using (frequently) or just playing around with
" Plug 'https://github.com/wlangstroth/vim-racket'
" Plug 'https://github.com/posva/vim-vue'
" Plug 'https://github.com/kchmck/vim-coffee-script'
" Plug 'https://github.com/rust-lang/rust.vim'
" Plug 'https://github.com/ElmCast/elm-vim'
" Plug 'https://github.com/elixir-editors/vim-elixir'
" Plug 'https://github.com/Glench/Vim-Jinja2-Syntax.git'
" Plug 'https://github.com/dag/vim-fish.git'
" Plug 'https://github.com/leafgarland/typescript-vim.git'
" Plug 'https://github.com/wlangstroth/vim-racket.git'
" Plug 'https://github.com/vim-scripts/utl.vim.git' " use to open links in vim-org
" Plug 'https://github.com/mhartington/nvim-typescript.git', { 'do': ':UpdateRemotePlugins' }
" Plug 'https://github.com/leafgarland/typescript-vim'

" Plug 'https://github.com/nelstrom/vim-markdown-folding'
" Plug 'https://github.com/ryanss/vim-hackernews.git'
" Plug 'https://github.com/neovim/node-host'

" language enhancements
Plug 'https://github.com/sebastianmarkow/deoplete-rust'
Plug 'https://github.com/zchee/deoplete-go', { 'do': 'make' }
Plug 'https://github.com/jceb/vim-orgmode.git'
Plug 'https://github.com/mattn/emmet-vim.git'
Plug 'https://github.com/salomvary/vim-eslint-compiler'
Plug 'https://github.com/zchee/deoplete-jedi'
Plug 'https://github.com/tpope/vim-endwise.git' " for bash + ruby blocks
Plug 'https://github.com/jwalton512/vim-blade.git'
Plug 'https://github.com/mxw/vim-jsx.git'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs'

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
Plug 'https://github.com/kana/vim-textobj-user.git'
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

let g:deoplete#sources#rust#racer_binary='/Users/zach/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/zach/opt/rust/src'

" remove extra spaces when aligning
let g:lion_squeeze_spaces = 1

" let deoplete handle this
let g:jedi#completions_enabled = 0

" auto completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'

" deoplete-tern + tern_for_vim compatibility
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

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
let g:ctrlp_custom_ignore = {
    \ 'dir':'node_modules\|vendor\|\.git\|build\|coverage\|env\|__pycache__\|target\|out'
    \}

" enable jsx syntax package without the .jsx file extension
let g:jsx_ext_required = 0

" vim-ripgrep config
let g:rg_highlight = 1

" don't try and autopair ' when writing lisp
au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
au Filetype lisp let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
au Filetype scheme let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}

" +--------------------------------------------------------------+
" |                       Editor Settings                        |
" +--------------------------------------------------------------+

set t_Co=256
set background=light
colorscheme lucius
" colorscheme unicon

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
set path=.,/usr/include,,**     " searching through files in current directory

set backupdir=/Users/zach/.local/share/nvim/swap " don't clutter my working directory with swp files

" set hidden
set confirm " prompt to save changes before leaving a modified buffer

" +--------------------------------------------------------------+
" |                       Key Mappings                           |
" +--------------------------------------------------------------+

" spacebar as leader
let mapleader = " "

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

map <Leader>e :!bash %
map <Leader>m :make<cr>

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

map <Leader>vn :vnew<cr>

" close the autocomplete preview window
map <Leader>pc :pclose<cr>

" copy the file to the clipboard
map <Leader>y mzgg"*yG'z

" open a markdown link
map <Leader>o f(yi(:!open 0

map <Leader>ff :e
map <Leader>fs :w<cr>
map <Leader>fe :e ~/.config/nvim/init.vim<cr>
map <Leader>fp :e ~/.config/nvim/UltiSnips<cr>
map <Leader>fb :e ~/.bashrc<cr>
map <Leader>fa :e ~/.aliases<cr>
map <Leader>ft :set ft=

map <Leader>te :term<cr>
map <Leader>gs :Gstatus<cr>
map <Leader>gb :Gblame<cr>

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

" emacsish
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

imap <m-a> <c-o>(
imap <m-e> <c-o>)
imap <m-f> <esc>ea
imap <m-b> <c-o>b
imap <m-d> <c-o>de
imap <m-q> <c-o>gwip
imap <m-bs> <c-o>vbd
imap <m-u> <c-o>gUe<c-o>e<right>
imap <m-l> <c-o>gue<c-o>e<right>
imap <m-c> <esc>lgUllguewi

" when entering commands too
cmap <C-f> <right>
cmap <C-b> <left>
cmap <C-e> <end>
cmap <C-a> <home>

" use supertab for completion so we can override c-p + c-n
" or just fall back to the c-x prefix
inoremap <C-p> <up>
inoremap <C-n> <down>

" Other Mappings
""""""""""""""""

" turn current line into markdown h1 (H) or h2 (h)
nnoremap mh yypVr-
nnoremap mH yypVr=

inoremap jk <esc>

" die typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" what to do with <tab> in normal and visual mode?
" nnoremap <tab> gt
" nnoremap <s-tab> gT
nnoremap <tab> za
nnoremap <s-tab> zf
vnoremap <tab> %

" better navigation to beggining of line
xnoremap 0 ^
xnoremap ^ 0
nnoremap ^ 0
nnoremap 0 ^

" " better marks
" xnoremap ' `
" xnoremap ` '
" nnoremap ` '
" nnoremap ' `

" " Move visual selection up and down
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv

" move visual selection vertically (this is kinda buggy)
vnoremap H dhPgvhoho
vnoremap L dpgvlolo

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

" close autocompletion preview window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ocaml stuff
"""""""""""""
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
" " https://github.com/ocaml/merlin/wiki/vim-from-scratch
" " execute "helptags " . substitute(system('opam config var share'),'\n$','','''') .  "/merlin/vim/doc"

" " ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

" let s:opam_configuration = {}

" function! OpamConfOcpIndent()
"   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

" function! OpamConfOcpIndex()
"   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

" function! OpamConfMerlin()
"   let l:dir = s:opam_share_dir . "/merlin/vim"
"   execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')

" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor
" " ## end of OPAM user-setup addition for vim / base ## keep this line


autocmd FileType clojure setlocal shiftwidth=2
autocmd FileType clojure setlocal tabstop=2
autocmd FileType clojure setlocal softtabstop=2
