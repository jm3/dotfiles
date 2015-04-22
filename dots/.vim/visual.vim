" rotate color schemes with <F8>
source ~/.vim/color-cycle.vim

" always indicate the current mode.
set showmode

" show the current command and selection size / line #
set showcmd

" display line numbers
set ruler
set number

" always show current file in status line
set laststatus=2

" enable junegunn's background-dimming 'Limelight' mode for markdown;
" limelight is installed with PlugInstall in ~/.vim/plugins.vim
autocmd BufNewFile,BufRead  *.md Limelight
autocmd BufLeave			      *.md Limelight!

" wrap at word boundaries, not in the middle of words
set linebreak

" allow vim to set the terminal title, but restore it on exit
" this fixes vim permanently clobbering your terminal title
" with the string "Thanks for flying vim!"
set title
let &t_ti = &t_ti . "\e[22;0t"
let &t_te = "\e[23;0t" . &t_te

if has("gui_running")
  " set guifont    = Menlo:h18
  " set guifont    = PT\ Mono:h18 " also good: Menlo:h18
else
  " elaborate, emoji-rich status bar lifted shamelessly from junegunn's dotfiles
  set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P
  silent! if emoji#available()
    let s:ft_emoji = map({
      \ 'c':          'baby_chick',
      \ 'clojure':    'lollipop',
      \ 'coffee':     'coffee',
      \ 'cpp':        'chicken',
      \ 'css':        'art',
      \ 'eruby':      'ring',
      \ 'gitcommit':  'soon',
      \ 'haml':       'hammer',
      \ 'help':       'angel',
      \ 'html':       'herb',
      \ 'java':       'older_man',
      \ 'javascript': 'monkey',
      \ 'make':       'seedling',
      \ 'markdown':   'book',
      \ 'perl':       'camel',
      \ 'python':     'snake',
      \ 'ruby':       'gem',
      \ 'scala':      'barber',
      \ 'sh':         'shell',
      \ 'slim':       'dancer',
      \ 'text':       'books',
      \ 'vim':        'poop',
      \ 'vim-plug':   'electric_plug',
      \ 'yaml':       'tongue'
    \ }, 'emoji#for(v:val)')

    function! S_filetype()
      if empty(&filetype)
        return emoji#for('grey_question')
      else
        return get(s:ft_emoji, &filetype, '['.&filetype.']')
      endif
    endfunction

    function! S_modified()

      if &modified
        return emoji#for('kiss').' '

      " locked files or non-editable buffers
      elseif !&modifiable
        return emoji#for('rotating_light').' '
      else
        return ''
      endif
    endfunction

    function! S_fugitive()
      if !exists('g:loaded_fugitive')
        return ''
      endif
      let head = fugitive#head()
      if empty(head)
        return ''
      else
        return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
      endif
    endfunction

    let s:moons = map(
    \ ['new_moon', 'waxing_crescent_moon', 'first_quarter_moon',
    \  'waxing_gibbous_moon', 'full_moon', 'waning_gibbous_moon',
    \  'last_quarter_moon', 'waning_crescent_moon', 'new_moon'], 'emoji#for(v:val)')

    function! Moonbar()
      let width = len(s:moons)
      let [cur, max] = [line('.'), line('$')]
      let pos   = min([width * (cur - 1) / max([1, max - 1]), width - 1])
      let icon  = s:moons[pos]
      return repeat(' ', pos) . icon . repeat(' ', width - pos - 1)
    endfunction

    hi def link User1 TablineFill
    let s:cherry = emoji#for('skull') " s/🌸 /💀 /g
    function! MyStatusLine()
      let mod = '%{S_modified()}'
      let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
      let ft  = '%{S_filetype()}'
      let fug = ' %{S_fugitive()}'
      let sep = ' %= '
      let pos = ' %l,%c%V '
      let pct = ' %P '

      return s:cherry.' [%n] %F %<'.mod.ro.ft.fug.sep.pos.
            \ '%1*%{Moonbar()}%*'.pct.s:cherry
    endfunction

    " Note that the "%!" expression is evaluated in the context of the
    " current window and buffer, while %{} items are evaluated in the
    " context of the window that the statusline belongs to.
    set statusline=%!MyStatusLine()
    set completefunc=emoji#complete
  endif

endif

set background=dark
colorscheme solarized

" highlight current line (but only in the active window)
set cursorline

" replace Angry Fruit Salad colors to make diff'ing legible
highlight! DiffAdded   term=none      ctermfg=4  ctermbg=0
highlight! DiffRemoved term=none      ctermfg=1  ctermbg=0
highlight! DiffText    term=reverse   ctermfg=1  ctermbg=3

highlight! link DiffAdd DiffAdded
highlight! link DiffDelete DiffRemoved

highlight! link markdownItalic htmlTagName
highlight! link markdownBold   Todo
highlight! link markdownH1   texRefLabel

" folding shiz
set foldminlines=2
set fillchars="vert:|,fold:."

" reclaim some wasted vertical space from Goyo
:let g:goyo_margin_top    = 0
:let g:goyo_margin_bottom = 0

" json plugin uses this to hide extraneous syntax 
:set conceallevel=2
