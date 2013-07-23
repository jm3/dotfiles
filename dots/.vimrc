" jm3@{monkey.org, umich.edu, jm3.net, 140proof.com}
"
" what follows is distilled from roughly 17 years of vim usage.
" you're welcome. :)

" enable special features that aren't in vi
set nocompatible 

" load plugins from ~/.vim/bundle.
" manage plugins by modifying ~/.vim/plugins.vim
call pathogen#infect()

source ~/.vim/keys.vim
source ~/.vim/visual.vim
source ~/.vim/bad-speller.vim
source ~/.vim/spacing.vim
source ~/.vim/super-powers.vim

set hidden         " allow free switching between buffers even w/unsaved changes
set history=100000 " why limit the reach of history?
set hlsearch       " visually highlight searches; clear with ctl-l (see keys.vim)
set incsearch      " search incrementally as we type
set ignorecase     " any lowercase search is case insensitive...
set smartcase      " ...while searches in mixed/uppercase will be case-sensitive
set wildmenu       " when i hit tab, vim should try to complete whatever i'm typing
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>

" when moving at the edge of a line, cursor should wrap to the
" previous line, and vice versa
set whichwrap=b,<,>,h,l

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

" move vim net housekeeping crud to tmp
let g:netrw_home="/tmp/"

