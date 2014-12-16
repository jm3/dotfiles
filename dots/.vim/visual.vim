" always indicate the current mode.
set showmode

" use 256 colors
"set t_Co=256

" show the current command and selection size / line #
set showcmd

" display line numbers
set ruler
set number

" always show current file in status line
set laststatus=2

" wrap at word boundaries, not in the middle of words
set linebreak

" allow vim to set the terminal title, but restore it on exit
" this fixes vim permanently clobbering your terminal title
" with the string "Thanks for flying vim!"
set title
let &t_ti = &t_ti . "\e[22;0t"
let &t_te = "\e[23;0t" . &t_te

if has("gui_running")
  set background=dark
  set guifont=Menlo:h18
  set guifont=PT\ Mono:h18 " also good: Menlo:h18
  "set guifont=monofur:h24
  "Monofur ItalicMonofur Italic
endif

" color scheme options: blue solarized delek evening

" highlight the current line but only in the active window
set cursorline

" replace Angry Fruit Salad colors to make diff'ing legible
highlight! DiffAdded   term=none      ctermfg=4  ctermbg=0
highlight! DiffRemoved term=none      ctermfg=1  ctermbg=0
highlight! DiffText    term=reverse   ctermfg=1  ctermbg=3

highlight! link DiffAdd DiffAdded
highlight! link DiffDelete DiffRemoved

highlight! link markdownItalic htmlTagName
highlight! link markdownBold   Todo
highlight! link markdownH1   texRefLabel

" highlight Folded guibg=242 ctermfg=210

" folding shiz
set foldminlines=2

:set fillchars="vert:|,fold:."

