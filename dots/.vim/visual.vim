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
" alternate schemes that aren't horrible: blue solarized delek evening gummybears vividchalk


" when i open files, vim should know from the file extension
" what mode + syntax highlighting to use:
syntax enable
autocmd BufNewFile,BufRead *.erb         set ft=html
autocmd BufNewFile,BufRead *.jade        set ft=jade
autocmd BufNewFile,BufRead *.json        set ft=javascript
autocmd BufNewFile,BufRead *.less        set ft=css
autocmd BufNewFile,BufRead *.ru          set ft=ruby
autocmd BufNewFile,BufRead */css/*.erb   set ft=css
autocmd BufNewFile,BufRead /etc/nginx/*  set ft=nginx

" rm default angry fruit salad colors to make diff'ing legible
highlight clear DiffDelete
" was: term=bold ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
highlight DiffDelete ctermfg=9 guifg=Red ctermbg=0 guibg=Black

highlight clear DiffAdd " was: term=bold ctermbg=4 guibg=DarkBlue
highlight DiffAdd term=bold ctermfg=6 guifg=#80a0ff

highlight clear DiffChange " was: term=bold ctermbg=5 guibg=DarkMagenta
highlight DiffChange term=underline ctermfg=13 guifg=Magenta

highlight clear DiffText " was: term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
highlight DiffChange term=underline ctermfg=13 guifg=Magenta

