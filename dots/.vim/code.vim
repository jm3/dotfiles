" stuff for programmers

" when i open files, vim should know from the file extension
" what mode + syntax highlighting to use:
syntax enable
autocmd BufNewFile,BufRead */css/*.erb        set ft=css
autocmd BufNewFile,BufRead *.erb              set ft=html
autocmd BufNewFile,BufRead /etc/nginx/*       set ft=nginx
autocmd BufNewFile,BufRead *.fish             set ft=sh
autocmd BufNewFile,BufRead Gemfile            set ft=ruby
autocmd BufNewFile,BufRead Guardfile          set ft=ruby
autocmd BufNewFile,BufRead *.jade             set ft=jade
autocmd BufNewFile,BufRead *.less             set ft=css
autocmd BufNewFile,BufRead *.ru               set ft=ruby
autocmd BufNewFile,BufRead *.sublime-settings set ft=javascript
autocmd BufNewFile,BufRead .babelrc           set ft=javascript
autocmd BufNewFile,BufRead Vagrantfile        set ft=ruby

autocmd BufNewFile,BufRead *vim setlocal keywordprg=:help

let jshint2_command = '/usr/local/bin/jshint' " js hinting
let jshint2_confirm = 0 " don't warn about linting non-JS files (e.g. JSON)
let jshint2_read    = 1 " auto-hint on file OPEN (needs monkeypatch to work on JSON)
let jshint2_save    = 1 " auto-hint on file SAVE (needs)
let jshint2_error   = 0 " hide the numeric error codes, e.g. trailing comma == 94; irrelevant)

