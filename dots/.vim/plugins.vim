" edit the list below to choose plugins;
" to update: ,p or source this file (:so %) then :PlugInstall
call plug#begin('~/.vim/plugged')
" note: must use single quotes

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'         " show git diff status in sidebar
Plug 'ervandew/supertab'              " <tab> to complete words in buffer
Plug 'junegunn/fzf'                   " amazing fuzzy search. also enhances zsh
Plug 'junegunn/goyo.vim'              " minimalist editing
" Plug 'junegunn/limelight.vim'         " dim all paragraphs but current one
Plug 'junegunn/vim-easy-align'        " <Enter> to align assignments, blocks, etc.
Plug 'junegunn/vim-emoji'             " ha ha fuck yes
Plug 'mhinz/vim-startify'             " awesome startup screen, uses my fortunes file
Plug 'moll/vim-bbye'                  " close buffers gracefully
Plug 'nelstrom/vim-markdown-folding'  " zO + zC to open + close markdown outlines
Plug 'scrooloose/nerdtree'            " file browser
Plug 'tmhedberg/matchit'              " % to match open/close <html> tags + if/else blocks, not just [] {} ()
Plug 'tpope/vim-endwise'              " auto-complete simple code structures like if .. end without being annoying
Plug 'vim-scripts/mru.vim'            " ,m to open most-recently used files (like :browse oldfiles)
Plug 'tpope/vim-repeat'               " when i type . in command mode, repeat the *entire* last command
Plug 'tomtom/tcomment_vim'            " ,c to comment blocks in any language
Plug 'christoomey/vim-titlecase'      " :gt to title-case text

Plug 'maksimr/vim-jsbeautify', { 'dir': '~/.vim/plugged/vim-jsbeautify', 'do': 'git submodule update --init --recursive' } " prettify css + js

" color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim', { 'dir': '~/.vim/plugged/seoul256.vim', 'do': 'rm colors/seoul256-light.vim' }
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme', { 'dir': '~/.vim/plugged/vim-tomorrow-theme', 'do': 'rm colors/Tomorrow-Night-Blue.vim  colors/Tomorrow-Night.vim colors/Tomorrow.vim' }

" languages + syntaxes
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'honza/dockerfile.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'Shutnik/jshint2.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'keith/swift.vim'

call plug#end()

map ,p :so %<Enter>:PlugInstall<Enter>
