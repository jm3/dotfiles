" .exrc for jm3
syntax enable
set hidden
set history=1000
set ignorecase
set smartcase
set title
filetype plugin indent on

call pathogen#infect()

set background=dark
colorscheme elflord 
" blue solarized delek evening gummybears vividchalk

if has("gui_running")
  set guifont=Menlo:h18

  "Fullscreen mode:
  "set fuoptions=maxvert,maxhorz
  "au GUIEnter * set fullscreen
endif

"sane pasting
" 8 + 9 on number keypad
map  Ox :set paste<CR>
map  Oy :set nopaste<CR>
imap Ox <C-O>:set paste<CR>
imap Oy <nop>
set pastetoggle=Oy

" sane search highlighting
set hlsearch
set incsearch
noremap <silent> <c-l> :nohls<cr><c-l>

" holy shit, i am a god-damned genius. in-/undent with space/backspace
noremap <space> >>
noremap <backspace> <<

" format JSON; invoke as \j
map <Leader>j !python -m json.tool

" backspace over everything in case of brainmelt
set backspace=indent,eol,start

set dictionary=~/.dict
setlocal spell spelllang=en_us
set nospell
set spellcapcheck=

" can we disable spellcheck on certain files?
"
" hilarious.
autocmd BufEnter .txt set spell
autocmd BufEnter .md set spell

" " while typing a word in insert mode (edit mode)
" ctl-x s to bring up vim's list of spelling suggestions for the current
" word...
"
" tho oddly, it has WAY too many suggestions, always, even on
" correctly spelled words, eg. on the word "awesome", there a over
" a page of spelling suggestions.

" set tabs correctly
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab 
set scrolloff=5
" reminder :retab to replace tabs with spaces in a buffer

set wildmenu
" Path/file expansion in colon-mode.
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>

set nocompatible 

" whichwrap thing
set ww=b,<,>,h,l

" discard ctl-characters and always indicate the current mode.
set showmode

" display line numbers
set ruler
map N :set number<CR>
map M :set nonumber<CR>
set number

" jm3-accelerators
nmap :E :e
nmap R :redo<CR>
nmap [ {
nmap ] }
nmap V :e ~/.vimrc<CR>
nmap W :w
nmap q :q
nmap Q :q
nmap :W   :w
nmap :W!  :w!
nmap :Q   :q
nmap :Q!  :q!
nmap :Wq! :wq!
nmap :WQ! :wq!

" spelling
map s :set nospell<CR>
map S :set spell<CR>

" highlight current line in insert mode
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" save a file as root in case we forgot to edit using sudo:
" FIXME: this stopped working...
"map \s :w !sudo tee %

"make this line a list item:
map L ^i<li>$a</li>

" set escape and OS X arrow keys
set ek
map [A k
map [B j
map [C l
map [D h

" correct typos
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

" NerdTree open/close
" map <Del> :NERDTreeToggle<CR>
" map \nt :NERDTreeToggle<CR>

" Tabularize shortcuts: ,a= ,a:
let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a# :Tabularize /#<CR>
  vmap <Leader>a# :Tabularize /#<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" comment out blocks in any language with ,c
map <Leader>c gcip<CR>

" wrap words
map f !} fmt<CR>

" slurp whole buffer into OS X clipboard
"map c 1GyG:1,$!pbcopy<CR>PGdd1G

" save cursor position in buffers across sessions
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

" colorize nginx, .erb, .json, .ru, etc
autocmd BufNewFile,BufRead *.erb         set ft=html
autocmd BufNewFile,BufRead */css/*.erb   set ft=css
autocmd BufNewFile,BufRead *.less        set ft=css
autocmd BufNewFile,BufRead /etc/nginx/*  set ft=nginx
autocmd BufNewFile,BufRead *.json        set ft=javascript
autocmd BufNewFile,BufRead *.ru          set ft=ruby
autocmd BufNewFile,BufRead *.jade        set ft=jade

" no trailing whitespace
autocmd FileType rb,json,yml,css,js,html,haml autocmd BufWritePre <buffer> :%s/\s\+$//e

" move vim net housekeeping crud to tmp
let g:netrw_home="/tmp/"

" notes:
" :MRU for recently used files
" gU => to Uppercase
" gu => to Lowercase
" :qall to close all buffers (append ! for nosave)
" args file/selector-path*/*
" argdo %s/foo/bar/gec        # (note no colon, e=suppress errors, c=confirm)
:setlocal ff=unix
