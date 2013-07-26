" reminder:
" when i type a word and i press [ctl-x s], then
" vim will display a list of spelling suggestions
"
" i don't regularly capitalize, so don't flag lower-case words as typos
set spellcapcheck=

" localize as needed
setlocal spell spelllang=en_us

:highlight clear SpellBad
:highlight SpellBad term=bold ctermfg=5

" configure spelling, but leave it off by default since most of
" what we edit is code, not prose. note that this option must come
" AFTER the above spelling configurations.
set nospell

" force enable spell-checking on markdown and text files
" some people do this on BufEnter, which fires ever time the buffer
" gains focus. YMMV.
autocmd BufRead *.txt set spell
autocmd BufRead *.md set spell

" Correct some common typos
abbrev <A <a
abbrev teh the
abbrev yuo you
abbrev hte the
abbrev nad and
abbrev frmo from
abbrev buig bug
abbrev jsut just
abbrev tempalte template
abbrev teamplate template
abbrev flase false
abbrev manogoian manoogian

