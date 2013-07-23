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
" blue solarized delek evening gummybears vividchalk
