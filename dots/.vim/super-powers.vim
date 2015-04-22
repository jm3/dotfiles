" Make vim do cool stuff it can't normally do

let g:gist_clip_command = 'pbcopy'

" If we edited a file we don't have permissions to save without
" using sudo, reload the file as sudo with: ,s
nmap <Leader>s :w !sudo tee %<CR>

"make the line an HTML list item:
map L ^i<li>$a</li>

"make the line a HTML link
map <Leader>a 0i<a href="<Esc>$a"></a><Esc>hhhi

"insert row of ='s or -'s
map - o<Esc>24i-<Esc>
map = o<Esc>24i=<Esc>

" comment out blocks in any language with ,c
map <Leader>c gcip<CR>

" disable auto comment-next-line shit
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" (re-)wrap the current block
map f !} fmt<CR>

" pretty-print a block of JSON; requires Python
map <Leader>j ggVG!python -m json.tool<CR><CR>

" pretty-print a block of HTML; requires HTML Tidy
map <Leader>h !tidy -q --show-warnings no<CR><CR>

" slurp whole buffer into OS X clipboard
" FIXME: need a good key to map this to. suggestions?
map C 1GyG:1,$!pbcopy<CR>PGdd1G

set viminfo=%,'100,/100,:999,@100,f0
"           | |    |    |    |    + whether to store global marks
"           | |    |    |    + input line history (what is this?)
"           | |    |    |
"           | |    |    +command-line history saved
"           | |    +search history saved
"           | |
"           | + save marks for N files (required to restore cursor/line pos)
"           +save/restore buffer list (what is this?)

" required to restore cursor position using the above viminfo file
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" trigger listing
map <Leader>d :!~/bin/unversioned/d<CR>

" commify list (e.g. to build a SQL query in(...) list
map ,C :%s/ /,/g<CR>

" copy the path of the current filename
map <Leader>r :let @" = expand("%")<CR>

" cd to directory of the current file
map <Leader>g :cd %:p:h<CR>

" display a fortune from our fortunes file
" N.b.: after adding fortunes to ~/.dotfiles/fortunes,
" be sure to run 'strfile fortunes' to regenerate fortunes.dat
let g:startify_custom_header =
\ map(split(system('fortune /Users/jm3/.dotfiles/fortunes'), '\n'), '"   ". v:val') + ['','']

" hide these files from the "recent files" list in Startify's startup screen
let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ $HOME . '/.dotfiles/dots/.vim/plugged/.*/doc'
\ ]
