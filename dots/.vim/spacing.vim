" set tabs correctly
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab 
set scrolloff=5
" reminder :retab to replace tabs with spaces in a buffer

filetype plugin indent on

" no trailing whitespace
autocmd FileType rb,json,yml,css,js,html,haml autocmd BufWritePre <buffer> :%s/\s\+$//e

