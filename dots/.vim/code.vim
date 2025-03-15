" mwah ha ha
abbrev dbg // eslint-disable-next-linedebugger

" LINTER SETUP (requires ale in plugins.vim; dense-analysis >>>> w0rp (RIP w0rp)
" npm i -g eslint prettier eslint-config-prettier
" npm i -g stylelint stylelint-order stylelint-color-format stylelint-no-unsupported-browser-features stylelint-config-tailwindcss # FML
" brew install tidy-html5
let g:ale_linters = {
\ 'css': ['stylelint'],
\ 'html': ['tidy'],
\ 'javascript': ['eslint'],
\ 'json': ['jq'],
\ 'ruby': ['rubocop'],
\ }

let g:ale_fixers = {
\ 'css': ['stylelint'],
\ 'html': ['tidy'],
\ 'javascript': ['prettier', 'eslint'],
\ 'json': ['jq'],
\ 'ruby': ['rails_best_practices', 'rubocop'],
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ }

" let g:ale_javascript_prettier_use_global = 0
" let g:ale_javascript_eslint_use_global = 0

let g:ale_fix_on_save = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" don't lint rails mailer html template files; HTML mail doesn't follow the same DTD rules
let g:ale_pattern_options = { '.*_mailer/*': {'ale_enabled': 0} }

" thx: https://www.vimfromscratch.com/articles/vim-for-ruby-and-rails-in-2019
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '🫣 %d Warnings %d Errors',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

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
