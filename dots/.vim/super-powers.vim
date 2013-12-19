" Make vim do cool stuff it can't normally do

" If we edited a file we don't have permissions to save without
" using sudo, reload the file as sudo with: ,s
nmap <Leader>s :w !sudo tee %<CR>

"make the line an HTML list item:
map L ^i<li>$a</li>

"make the line a HTML link
map A 0i<a href="<Esc>$a"></a><Esc>hhhi

"insert row of ='s or -'s
map - o<Esc>24i-<Esc>
map = o<Esc>24i=<Esc>

" comment out blocks in any language with ,c
map <Leader>c gcip<CR>

" (re-)wrap the current block
map f !} fmt<CR>

" pretty-print a block of JSON; requires Python
map <Leader>j !python -m json.tool<CR><CR>

" pretty-print a block of HTML; requires HTML Tidy
map <Leader>h !tidy -q --show-warnings no<CR><CR>

" slurp whole buffer into OS X clipboard
" FIXME: need a good key to map this to. suggestions?
map C 1GyG:1,$!pbcopy<CR>PGdd1G

" save cursor position in buffers across sessions:
set viminfo=%,'50,\"100,n~/.vim/saved-state.vim
" FIXME: if saved-state file exceeds 100k-ish lines,
" vim can be slow to exit

