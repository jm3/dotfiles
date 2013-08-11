" for some reason, this can't be loaded from the vimrc load path;
" pathogen:infect doesn't seem to load the plugins until after all
" the files sources from ~/.vimrc are done. ugh.
"
" more here: https://raw.github.com/godlygeek/tabular/master/doc/Tabular.txt

if exists(":Tabularize")
  let mapleader=','
  " align text with the Tabularize plugin: ,a= ,a:
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a# :Tabularize /#<CR>
  vmap <Leader>a# :Tabularize /#<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

