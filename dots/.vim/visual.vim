" highlight code
syntax on

" rotate color schemes with <F8>
source ~/.vim/color-cycle.vim

" always indicate the current mode.
set showmode

" show the current command and selection size / line #
set showcmd

" display line numbers
set ruler
set number

" always show current file in status line
set laststatus=2

" enable junegunn's background-dimming 'Limelight' mode for markdown;
" limelight is installed with PlugInstall in ~/.vim/plugins.vim
" autocmd BufNewFile,BufRead  *.md Limelight
" autocmd BufLeave			      *.md Limelight!
" nmap <leader>l <Plug>(Limelight!!)
" terminal mode vim needs this for some reason:

" let g:limelight_conceal_ctermfg = 238

" wrap at word boundaries, not in the middle of words
set linebreak

" allow vim to set the terminal title, but restore it on exit
" this fixes vim permanently clobbering your terminal title
" with the string "Thanks for flying vim!"
set title
let &t_ti = &t_ti . "\e[22;0t"
let &t_te = "\e[23;0t" . &t_te

if has("gui_running")
  " set any GUI / MacVim-specific stuff here

  " hide toolbar
  set guioptions-=T

  " hide RHS scrollbars:
  set guioptions-=r

  colorscheme dracula
endif

" preview colorschemes with fn-F8 or :Colors
silent! colorscheme wildcherry " dracula
set t_Co=256

" highlight current line (but only in the active window)
set cursorline

" replace Angry Fruit Salad colors to make diff'ing legible
highlight! DiffAdded   term=none      ctermfg=4  ctermbg=0
highlight! DiffRemoved term=none      ctermfg=1  ctermbg=0
highlight! DiffText    term=reverse   ctermfg=1  ctermbg=3

highlight! link DiffAdd DiffAdded
highlight! link DiffDelete DiffRemoved

highlight! link markdownItalic htmlTagName
highlight! link markdownBold   Todo
highlight! link markdownH1     texRefLabel

" folding shiz
"set foldminlines=2
"set fillchars="vert:|,fold:."

" reclaim a little bit of vertical space from Goyo
:let g:goyo_margin_top    = 2
:let g:goyo_margin_bottom = 2

" json plugin uses this to hide extraneous syntax
:set conceallevel=2
