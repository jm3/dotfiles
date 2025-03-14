" mwah ha ha
abbrev dbg // eslint-disable-next-linedebugger

" LINTER SETUP (requires ale in plugins.vim; dense-analysis >>>> w0rp (RIP w0rp)
" npm i -g eslint prettier eslint-config-prettier
" npm i -g stylelint stylelint-order stylelint-color-format stylelint-no-unsupported-browser-features stylelint-config-tailwindcss # FML
" brew install tidy-html5
let g:ale_linters = {
\ 'html': ['tidy'],
\ 'css': ['stylelint'],
\ 'javascript': ['eslint'],
\ 'json': ['jq'],
\ }

let g:ale_fixers = {
\ 'css': ['stylelint'],
\ 'javascript': ['prettier', 'eslint'],
\ 'html': ['tidy'],
\ 'json': ['jq'],
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ }

" let g:ale_javascript_prettier_use_global = 0
" let g:ale_javascript_eslint_use_global = 0

let g:ale_fix_on_save = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" don't lint rails mailer html template files; HTML mail doesn't follow the same DTD rules
let g:ale_pattern_options = { '.*_mailer/*': {'ale_enabled': 0} }

" when i open files, vim should know from the file extension
" what mode + syntax highlighting to use:
syntax enable
autocmd BufNewFile,BufRead *.erb              set ft=html
autocmd BufNewFile,BufRead *.fish             set ft=sh
autocmd BufNewFile,BufRead *.jade             set ft=pug
autocmd BufNewFile,BufRead *.less             set ft=css
autocmd BufNewFile,BufRead *.pug              set ft=pug
autocmd BufNewFile,BufRead *.ru               set ft=ruby
autocmd BufNewFile,BufRead *.slim             set ft=pug
autocmd BufNewFile,BufRead *.thor             set ft=ruby
autocmd BufNewFile,BufRead */css/*.erb        set ft=css
autocmd BufNewFile,BufRead .babelrc           set ft=javascript
autocmd BufNewFile,BufRead /etc/nginx/*       set ft=nginx
autocmd BufNewFile,BufRead Gemfile            set ft=ruby
autocmd BufNewFile,BufRead Guardfile          set ft=ruby
autocmd BufNewFile,BufRead Vagrantfile        set ft=ruby

autocmd BufNewFile,BufRead *vim setlocal keywordprg=:help
