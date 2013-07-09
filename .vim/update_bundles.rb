#!/usr/bin/env ruby

git_bundles = [
  "git://github.com/altercation/vim-colors-solarized.git", # sane, modern colors
  "git://github.com/ervandew/supertab.git",                # tab-complete anything
  "git://github.com/godlygeek/tabular.git",                # align assignments and arg lists
  "git://github.com/jelera/vim-gummybears-colorscheme",    # pretty colors
  "git://github.com/kchmck/vim-coffee-script.git",         # syntax highlighting for coffeescript
  "git://github.com/pangloss/vim-javascript.git",          # highlighting + syntax for JS
  "git://github.com/tomtom/tcomment_vim.git",              # comment any language
  "git://github.com/tpope/vim-endwise.git",                # complete simple code structues
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tpope/vim-repeat.git",                 # make . repeat the last whole plugin command
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/tsaleh/vim-matchit.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/vim-scripts/Gist.vim.git",
  "git://github.com/vim-scripts/mru.vim.git"               # navigate most-recently used files
]

# mess with these later:
# "git://github.com/tsaleh/vim-shoulda.git",
# "git://github.com/vim-scripts/IndexedSearch.git",
# "git://github.com/vim-scripts/jQuery.git",
# "git://github.com/tpope/vim-surround.git",

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
end

