" edit the list below to choose plugins;
" to update: ,p or source this file (:so %) then :PlugInstall
call plug#begin('~/.vim/plugged')

" NOTE: single quotes only, since " is a comment in vim :)

" GENERAL EDITING
Plug 'gabesoft/vim-ags'               " search with the silver-searcher (ag)
Plug 'junegunn/vim-easy-align'        " <Enter> to align assignments, blocks, etc.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " core fuzzy finder
Plug 'junegunn/fzf.vim'               " a set of vim recipes for fzf
set rtp+=/opt/homebrew/opt/fzf
Plug 'mikeboiko/vim-markdown-folding' " zO + zC to open + close markdown outlines
Plug 'scrooloose/nerdtree'           " file browser
Plug 'tpope/vim-repeat'              " when i type . in command mode, repeat the *entire* last command
Plug 'vim-scripts/LargeFile'         " auto-optimize settings when editing large files
Plug 'mhinz/vim-startify'             " awesome startup screen, uses my fortunes file
Plug 'vim-scripts/mru.vim'            " Most-Recently Used files ,m (like :browse oldfiles)
Plug 'ervandew/supertab'              " <tab> to complete words in buffer
Plug 'wellle/targets.vim'             " <https://github.com/wellle/targets.vim>

" CODING
Plug 'github/copilot.vim'            " GH opilot completion
Plug 'tmhedberg/matchit'             " % to match open/close <html> tags + if/else blocks, not just [] {} ()
Plug 'mattn/emmet-vim'               " expand HTML + CSS exprs via <ctrl-y><comma> https://bit.ly/emmet-vim-tut
Plug 'tpope/vim-endwise'             " auto-complete simple code structures like if..end w/out being annoying
Plug 'airblade/vim-gitgutter'        " show git diff status in sidebar
Plug 'tomtom/tcomment_vim'           " ,c to comment blocks in any language

" COLOR SCHEMES
Plug 'dracula/vim'
Plug 'dbb/vim-gummybears-colorscheme'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme', { 'dir': '~/.vim/plugged/vim-tomorrow-theme', 'do': 'rm colors/Tomorrow-Night-Blue.vim  colors/Tomorrow-Night.vim colors/Tomorrow.vim' }
Plug 'sliminality/wild-cherry-vim'

" MISC VISUAL MODALITIES
Plug 'junegunn/goyo.vim'             " minimalist editing
Plug 'junegunn/limelight.vim'        " dim all paragraphs but current one

" LANGUAGES + SYNTAXES
Plug 'dense-analysis/ale'   " async linting engine, no mo w0rp
Plug 'honza/dockerfile.vim'
Plug 'rhysd/vim-gfm-syntax' " GitHub Flavored Markdown
let g:markdown_fenced_languages = ['bash', 'javascript', 'json', 'ruby', 'sh']
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'leafgarland/typescript-vim'

" Inactive Plugins
" Plug 'moll/vim-bbye'             " close buffers gracefully - not sure if this works / does anything
" Plug 'skammer/vim-css-color'     " lol no, this adds THREE-SECOND delay opening a markdown file foh
" Plug 'kchmck/vim-coffee-script'  " not currently using CoffeeScript
" Plug 'jparise/vim-graphql'       " GraphQL syntax
" Plug 'junegunn/vim-emoji'        " seems to be no longer maintained
" Plug 'tpope/vim-fugitive'        " git integration that i never use
" Plug 'fatih/vim-go'              " not currently using Go
" Plug 'tpope/vim-haml'
" Plug 'maxmellon/vim-jsx-pretty'  " JS and JSX syntax
" Plug 'tpope/vim-surround'    " cs"' to change surrounding quotes, ds" to delete surrounding quotes, etc.
" Plug 'christoomey/vim-titlecase' " gz to title-case text
" Plug 'mbbill/undotree'           " visualize + manipulate undo history

call plug#end()

map ,p :so %<Enter>:PlugInstall<Enter>

" NOTE: problems with errors that PlugUpdate can't find rubygems.rb?
" that's a sign vim was linked against a different ruby binary than system
" ruby when compiling. (maybe you were running rvm?) uninstall and brew install vim
" will fix this and make :ruby commands worked again. to test, try... :ruby puts VERSION
