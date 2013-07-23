" Make vim do cool stuff it can't normally do

" If we edited a file we don't have permissions to save without
" using sudo, reload the file as sudo with \s
map \s :w !sudo tee %<CR>

"make the line an HTML list item:
map L ^i<li>$a</li>

" comment out blocks in any language with ,c
map <Leader>c gcip<CR>

" (re-)wrap the current block
map f !} fmt<CR>

" pretty-print a block of JSON; requires Python
map \j !python -m json.tool<CR><CR>

" pretty-print a block of HTML; requires HTML Tidy
map \h !tidy -q --show-warnings no<CR><CR>

" slurp whole buffer into OS X clipboard
" FIXME: need a good key to map this to. suggestions?
" map c 1GyG:1,$!pbcopy<CR>PGdd1G

" save cursor position in buffers across sessions
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

