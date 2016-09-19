" http://vim.wikia.com/wiki/Folding_for_plain_text_files_based_on_indentation
setlocal foldmethod=expr
setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))
set foldtext=getline(v:foldstart)
set fillchars=fold:\ "(there's a space after that \)
highlight Folded ctermfg=DarkGreen ctermbg=Black
