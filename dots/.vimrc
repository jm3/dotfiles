" jm3@{monk3y.org, umich.edu, jm3.net, 140proof.com}

" enable special features that aren't in vi
set nocompatible

" all settings are organized into groups for easy modularity
" tip: to open any of the files, just navivgate to one of the files
" and press gf  (go to file)

source ~/.vim/plugins.vim
source ~/.vim/keys.vim
source ~/.vim/visual.vim
source ~/.vim/code.vim
source ~/.vim/bad-speller.vim
source ~/.vim/spacing.vim
source ~/.vim/super-powers.vim
" export DOTFILES_HOME="$USER/Desktop/dotfiles"
silent! source ~/iCloud/Dotfiles/personal.vim"

set directory=~/.vim/backups//,~/.tmp/,~/tmp/,.tmp/
set hidden         " allow free switching between buffers even w/unsaved changes
set history=10000  " why limit the reach of history?
set ic hlsearch    " incrementally execute + highlight searches; clear with ctl-l
set ignorecase     " lowercase searches are case insensitive...
set incsearch      " true search incrementally as we type
set smartcase      " mixed/uppercase searches are case-sensitive
set timeout timeoutlen=1000 ttimeoutlen=10  " i don't have time to wait
set wildchar=<TAB>
set wildmenu       " when i hit tab, vim should try to complete whatever i'm typing
set wildmode=list:longest " anaologous to show-all-if-ambiguous in [ba,z]sh shells

" this makes reloading the file idempotent/reentrant. if you don't know what
" that means, don't worry about it :)
set wildignore=

" ignore these files when completing paths:
" ...binaries
set wildignore+=*alias,*.alfredworkflow,*.gem,*.gif,*.jpg,*.mov,*.mp4,*.pdf,*.png,*.psd,*.ttf,*.webloc
" ...archive files
set wildignore+=*.zip,*.gz
" ...web temp junk
set wildignore+=.git,*/.bundle/*,*.swp,*~,._*,tmp,vendor,log

" when moving at the edge of a line, cursor should wrap to
" previous line, and vice versa
set whichwrap=b,<,>,h,l

" allow editing crontab files on OSX without errors
autocmd filetype crontab setlocal nobackup nowritebackup

" move .vim housekeeping files into ~/.vim/
let MRU_File=$HOME . "/.vim/recent-files.vim"
let MRU_Max_Entries = 100

" move vim network housekeeping crud file
let g:netrw_home="/tmp/"

" i honestly don't recall why i added this
set modelines=1
set nocompatible 
filetype plugin on
set modeline 

