inoremap jj <Esc>

" since vim uses almost all the regular key commands,
" allow prefixing with
let mapleader=','

map <Leader>n :NERDTreeToggle<CR>

" for the completely awesome bbye plugin that closes buffers without
" closing WINDOWS, thus preserving your window layout as you had it.
nmap <Leader>k :Bdelete<CR>

" auto-correct some easy-to-accidentally-capitalize commands
nmap :E   :e
nmap <Leader>v    :e ~/.vimrc<CR>

" fix some common typos i make
nmap q    :q
nmap Q    :q
nmap W    :w
nmap :W   :w
nmap :W!  :w!
nmap :Q   :q
nmap :Q!  :q!
nmap :Wq! :wq!
nmap :WQ! :wq!
nmap K    J

" i disabled these once I realized that ][ are both used to
" run the jump-to-[next,prev]-misspelled-word commands.
" FIXME: make these take effect in code buffers but not in text/markdown/yaml
" block-navigate without the shift key
" nmap [    {
" nmap ]    }

" much faster than :redo
nmap R :redo<CR>

" insert current date + time with "dts"
:iabbr <expr> dts strftime("%Y-%m-%d - %A, %B %d")
:iabbr <expr> ttt strftime("%H:%M %p")
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
" map s :set nospell<CR>
" map S :set spell<CR>

" toggle line numbers
map N :set number<CR>
map M :set nonumber<CR>

" set escape and OS X arrow keys
set ek
map [A k
map [B j
map [C l
map [D h

" folding mode
map zC zM
map zO zR

" most recently used files list
map <Leader>m :MRU<CR>
map <Leader>, :MRU<CR>

" the titlecase plugin i use adds mappings for gt and gT to title-case
" text + selection, respectively

" in css mode, from any selector, attempt to move up to the head
" of the block move to the beginning of the block, and sort selectors:
" nmap <Leader>s [<CR><CR>!}sort<CR>v}:s/:\([^ ]\)/: \1/<CR>

" if you use Tabularize, this will also indent all your selectors
" nmap <Leader>s [<CR><CR>!}sort<CR>v}:Tabularize /:\zs<CR>

" more rational folding mode shortcuts:
map zO zR
map zC zM

" move lines with ctl-j/k
" ... in normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

