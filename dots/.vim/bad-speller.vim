" reminder:
" when in insert mode, to get suggestions while typing (like completion), press: ctl-x s
" vim will display a list of spelling suggestions
" for spelling suggestions when NOT in insert mode: press: z=

" shared spelling file so that spelling corrections made anywhere are
" saved forever. the format is just a list of words.
set spellfile=~/xfer/.dotfiles/vim-spell-dir/en.utf-8.add

" vim uses a hokey index for the file. rebuild the index on load so any
" new words or corrects added outside of vim are available:
silent mkspell! ~/xfer/.dotfiles/vim-spell-dir/en.utf-8.add

" i don't regularly capitalize, so don't flag lower-case words as typos
set spellcapcheck=

" don't flag URLs as misspelled
syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell

" not working: syn match ThousandsDollarAmountNoSpell "\$\d\+k" contains=@NoSpell

" localize as needed
setlocal spell spelllang=en_us

":highlight clear SpellBad
":highlight SpellBad term=bold ctermfg=5

" configure spelling, but leave it off by default since most of
" what we edit is code, not prose. note that this option must come
" AFTER the above spelling configurations.
set nospell

" force enable spell-checking on markdown and text files
" some people do this on BufEnter, which fires ever time the buffer
" gains focus. YMMV.
autocmd BufRead  *.txt setlocal spell
autocmd BufRead  *.md  setlocal spell
autocmd BufEnter *.md  setlocal spell

" Auto-correct some common typos while typing
abbrev <A <a
abbrev buig bug
abbrev flase false
abbrev frmo from
abbrev jsut just
abbrev manogoian manoogian
abbrev nad and
abbrev ot to
abbrev pate paste
abbrev prolly probably
abbrev teamplate template
abbrev tempalte template
abbrev teh the
abbrev hte the
abbrev yuo you
