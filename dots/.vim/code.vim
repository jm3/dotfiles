" mwah ha ha
abbrev dbg // eslint-disable-next-linedebugger

" LINTER SETUP (requires ale in plugins.vim)
" npm i -g eslint prettier eslint-config-prettier
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'json': ['jq'],
\ }

" brew install tidy-html5
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'html': ['tidy-html5'],
\ 'json': ['jq'],
\ }

" let g:ale_javascript_prettier_use_global = 0
" let g:ale_javascript_eslint_use_global = 0

let g:ale_fix_on_save = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" when i open files, vim should know from the file extension
" what mode + syntax highlighting to use:
syntax enable
autocmd BufNewFile,BufRead */css/*.erb        set ft=css
autocmd BufNewFile,BufRead *.erb              set ft=html
autocmd BufNewFile,BufRead /etc/nginx/*       set ft=nginx
autocmd BufNewFile,BufRead *.fish             set ft=sh
autocmd BufNewFile,BufRead Gemfile            set ft=ruby
autocmd BufNewFile,BufRead Guardfile          set ft=ruby
autocmd BufNewFile,BufRead *.jade             set ft=pug
autocmd BufNewFile,BufRead *.less             set ft=css
autocmd BufNewFile,BufRead *.pug              set ft=pug
autocmd BufNewFile,BufRead *.ru               set ft=ruby
autocmd BufNewFile,BufRead *.slim             set ft=pug
autocmd BufNewFile,BufRead *.sublime-settings set ft=javascript
autocmd BufNewFile,BufRead .babelrc           set ft=javascript
autocmd BufNewFile,BufRead Vagrantfile        set ft=ruby

autocmd BufNewFile,BufRead *vim setlocal keywordprg=:help
