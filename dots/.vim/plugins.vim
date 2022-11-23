" edit the list below to choose plugins;
" to update: ,p or source this file (:so %) then :PlugInstall
call plug#begin('~/.vim/plugged')

" NOTE: single quotes only, since " is a comment in vim :)
" GENERAL EDITING
Plug 'gabesoft/vim-ags'              " search with the silver-searcher (ag)
Plug 'ervandew/supertab'             " <tab> to complete words in buffer
Plug 'junegunn/fzf'                  " amazing fuzzy search. also enhances zsh
Plug 'junegunn/vim-easy-align'       " <Enter> to align assignments, blocks, etc.
Plug 'mhinz/vim-startify'            " awesome startup screen, uses my fortunes file
Plug 'nelstrom/vim-markdown-folding' " zO + zC to open + close markdown outlines
Plug 'scrooloose/nerdtree'           " file browser
Plug 'vim-scripts/mru.vim'           " ,m to open 'Most-Recently Used' files (like :browse oldfiles)
Plug 'tpope/vim-repeat'              " when i type . in command mode, repeat the *entire* last command
Plug 'christoomey/vim-titlecase'     " :gt to title-case text
Plug 'mbbill/undotree'               " visualize + manipulate undo history

" CODING
Plug 'tmhedberg/matchit'             " % to match open/close <html> tags + if/else blocks, not just [] {} ()
Plug 'tomtom/tcomment_vim'           " ,c to comment blocks in any language
Plug 'tpope/vim-endwise'             " auto-complete simple code structures like if..end w/out being annoying
Plug 'airblade/vim-gitgutter'        " show git diff status in sidebar
Plug 'mattn/emmet-vim'               " magically expand HTML + CSS expressions

Plug 'vim-scripts/LargeFile'         " auto-optimize settings when editing large files

" prettify css + js - note, this must be on one line :(
Plug 'maksimr/vim-jsbeautify', { 'dir': '~/.vim/plugged/vim-jsbeautify', 'do': 'git submodule update --init --recursive' }

" COLOR SCHEMES
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'junegunn/seoul256.vim', { 'dir': '~/.vim/plugged/seoul256.vim', 'do': 'rm colors/seoul256-light.vim' }
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme', { 'dir': '~/.vim/plugged/vim-tomorrow-theme', 'do': 'rm colors/Tomorrow-Night-Blue.vim  colors/Tomorrow-Night.vim colors/Tomorrow.vim' }

" MISC VISUAL STUFF
Plug 'junegunn/vim-emoji'            " ha ha fuck yes
Plug 'junegunn/goyo.vim'             " minimalist editing
Plug 'junegunn/limelight.vim'        " dim all paragraphs but current one

" " LANGUAGES + SYNTAXES
Plug 'leafo/moonscript-vim'
Plug 'elzr/vim-json'
Plug 'honza/dockerfile.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug'
Plug 'pangloss/vim-javascript'
Plug 'Shutnik/jshint2.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'keith/swift.vim'

" UNUSED
" Plug 'tpope/vim-fugitive'    " git integration that i never use
" Plug 'moll/vim-bbye'         " close buffers gracefully - not sure if this works / does anything
" Plug 'skammer/vim-css-color' " fuck this plugin, adds a 3 second delay on opening a MARKDOWN file?!?

call plug#end()

map ,p :so %<Enter>:PlugInstall<Enter>

" NOTE: problems with errors that PlugUpdate can't find rubygems.rb?
" that's a sign vim was linked against a different ruby binary than system
" ruby when compiling. (maybe you were running rvm?) uninstall and brew install vim
" will fix this and make :ruby commands worked again. to test, try... :ruby puts VERSION
