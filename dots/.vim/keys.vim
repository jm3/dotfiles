" since vim uses almost all the regular key commands,
" allow prefixing with
let mapleader=','

" in css mode, from any selector, attempt to move up to the head
" of the block move to the beginning of the block, and sort the
" selectors:
nmap <Leader>s [<CR><CR>!}sort<CR>v}:Tabularize /:\zs<CR>

" accelerator keys; work around common typos
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

" save and re-run grunt
nmap <F1> :w<CR>:!clear;grunt<CR><CR>

" clear any visually selected searches with ctl-l
noremap <silent> <c-l> :nohls<cr><c-l>

" type less by indenting/un-indenting with space/backspace
noremap <space> >>
noremap <backspace> <<

" allow backspacing through anything in case of brainmelt
set backspace=indent,eol,start

" toggle spell-check mode
map s :set nospell<CR>
map S :set spell<CR>

" toggle line numbers
map N :set number<CR>
map M :set nonumber<CR>

" set escape and OS X arrow keys
set ek
map [A k
map [B j
map [C l
map [D h

