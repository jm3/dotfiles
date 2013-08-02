" always indicate the current mode.
set showmode

" show the current command and selection size / line #
set showcmd

" display line numbers
set ruler
set number

" allow vim to set the terminal title, but restore it on exit
" this fixes vim permanently clobbering your terminal title
" with the string "Thanks for flying vim!"
set title
let &t_ti = &t_ti . "\e[22;0t"
let &t_te = "\e[23;0t" . &t_te

set background=dark
colorscheme elflord

" alternate non-horrible color schemes:
" [blue solarized delek evening gummybears vividchalk]

" when i open files, vim should know from the file extension
" what mode + syntax highlighting to use:
syntax enable
autocmd BufNewFile,BufRead *.erb              set ft=html
autocmd BufNewFile,BufRead *.jade             set ft=jade
autocmd BufNewFile,BufRead *.json             set ft=javascript
autocmd BufNewFile,BufRead *.sublime-settings set ft=javascript
autocmd BufNewFile,BufRead *.less             set ft=css
autocmd BufNewFile,BufRead *.ru               set ft=ruby
autocmd BufNewFile,BufRead */css/*.erb        set ft=css
autocmd BufNewFile,BufRead /etc/nginx/*       set ft=nginx

" replace Angry Fruit Salad colors to make diff'ing legible
highlight! DiffAdded   term=none      ctermfg=4  ctermbg=0
highlight! DiffRemoved term=none      ctermfg=1  ctermbg=0
highlight! DiffText    term=reverse   ctermfg=1  ctermbg=3

highlight! link DiffAdd DiffAdded
highlight! link DiffDelete DiffRemoved

" HiGH-C0nTrAsT version (owch!)
"highlight! DiffAdd    term=none      ctermfg=8  ctermbg=4
"highlight! DiffChange term=underline ctermfg=13 ctermbg=black
"highlight! DiffDelete term=none      ctermfg=8  ctermbg=1
"highlight! DiffText   term=reverse   ctermfg=1  ctermbg=3

