" edit the list below to choose plugins; run PlugInstall to install

call plug#begin('~/.vim/plugged')
" note: must use single quotes

Plug 'junegunn/vim-easy-align'        " replaces godlygeek's tabular plugin
Plug 'fatih/vim-go'                   " go language
Plug 'nelstrom/vim-markdown-folding'  " collapse + expand markdown outlines
Plug 'vim-scripts/mru.vim'            " most-recently used files (like :browse oldfiles)
Plug 'tmhedberg/matchit'              " when i press % to balance a ] or a }, make that work on if .. end blocks too
Plug 'Shutnik/jshint2.vim'            " find js errors
Plug 'christoomey/vim-titlecase'      " title-case text
Plug 'ervandew/supertab'              " tab-complete anything
Plug 'moll/vim-bbye'                  " don't mess with my window layout just because i closed a buffer
Plug 'scrooloose/nerdtree'            " file browser
Plug 'tomtom/tcomment_vim'            " comment blocks in any language
Plug 'tpope/vim-endwise'              " complete simple code structures like if .. end without being annoying
Plug 'tpope/vim-repeat'               " when i type . in command mode, repeat the *entire* last command

Plug 'maksimr/vim-jsbeautify', { 'dir': '~/.vim/plugged/vim-jsbeautify', 'do': 'git submodule update --init --recursive' } " prettify css + js

" color schemes
Plug 'altercation/vim-colors-solarized' 
Plug 'junegunn/seoul256.vim'

" languages + syntaxes
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'honza/dockerfile.vim'

call plug#end()

