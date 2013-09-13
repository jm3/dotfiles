" jm3@{monkey.org, umich.edu, jm3.net, 140proof.com}
"
" modular configs are loaded from ~/.vim/

" enable special features that aren't in vi
set nocompatible

" plugin loader; reads installed plugins from ~/.vim/bundle.
" add/remove plugins by modifying ~/.vim/plugins.vim
call pathogen#infect()

source ~/.vim/keys.vim
source ~/.vim/visual.vim
source ~/.vim/bad-speller.vim
source ~/.vim/spacing.vim
source ~/.vim/super-powers.vim

set backupdir=~/.vim/backups/,~/.backups,.,/tmp/
set hidden         " allow free switching between buffers even w/unsaved changes
set history=100000 " why limit the reach of history?
set hlsearch       " visually highlight searches; clear with ctl-l (see keys.vim)
set ignorecase     " lowercase searches are case insensitive...
set incsearch      " search incrementally as we type
set smartcase      " mixed/uppercase searches are case-sensitive
set wildchar=<TAB>
set wildmenu       " when i hit tab, vim should try to complete whatever i'm typing
set wildmode=longest:full,list:full,list:longest

" when moving at the edge of a line, cursor should wrap to
" previous line, and vice versa
set whichwrap=b,<,>,h,l

" move .vim housekeeping files into ~/.vim/
let MRU_File=$HOME . "/.vim/recent-files.vim"
set viminfo=%,'50,\"100,n~/.vim/saved-state.vim

" move vim network housekeeping crud file
let g:netrw_home="/tmp/"

" start editing at the of log files
:au BufNewFile,BufRead /Volumes/Travel/*.md :normal Gz.
