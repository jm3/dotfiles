" reminder:
" when i type a word and i press [ctl-x s], then
" vim will display a list of spelling suggestions
"
" i don't regularly capitalize, so don't flag lower-case words as typos
set spellcapcheck=

" localize as needed
setlocal spell spelllang=en_us

":highlight clear SpellBad
":highlight SpellBad term=bold ctermfg=5

" configure spelling, but leave it off by default since most of
" what we edit is code, not prose. note that this option must come
" AFTER the above spelling configurations.
set nospell

" spell check with aspell with: ,s
map <Leader>s :w!<CR>:!aspell check %<CR>:e! %<CR>

" force enable spell-checking on markdown and text files
" some people do this on BufEnter, which fires ever time the buffer
" gains focus. YMMV.
autocmd BufRead  *.txt setlocal spell
autocmd BufRead  *.md  setlocal spell
autocmd BufEnter *.md  setlocal spell

" Correct some common typos
abbrev <A <a
abbrev buig bug
abbrev flase false
abbrev frmo from
abbrev hte the
abbrev jsut just
abbrev manogoian manoogian
abbrev nad and
abbrev ot to
abbrev pate paste
abbrev prolly probably
abbrev teamplate template
abbrev teh the
abbrev tempalte template
abbrev yuo you

