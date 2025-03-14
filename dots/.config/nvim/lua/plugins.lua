-- lua/plugins.lua
return {

  -- GENERAL EDITING
  { "gabesoft/vim-ags" },                -- silver-searcher (ag)
  { "junegunn/vim-easy-align" },         -- alignment
  { "junegunn/fzf" },                    -- core fuzzy finder
  { "junegunn/fzf.vim" },                -- fzf recipes
  { "mikeboiko/vim-markdown-folding" },  -- markdown folding
  { "scrooloose/nerdtree" },             -- file browser
  { "tpope/vim-repeat" },                -- repeat last command
  { "vim-scripts/LargeFile" },           -- optimize large files
  { "mhinz/vim-startify" },              -- start screen
  { "vim-scripts/mru.vim" },             -- most-recent files
  { "ervandew/supertab" },               -- <tab> for completion
  { "wellle/targets.vim" },              -- text objects

  -- CODING
  { "github/copilot.vim" },              -- copilot
  { "tmhedberg/matchit" },               -- % to match tags
  { "mattn/emmet-vim" },                 -- emmet for html/css
  { "tpope/vim-endwise" },               -- auto "end"
  { "airblade/vim-gitgutter" },          -- git status in left-hand 'gutter'
  { "nomnivore/ollama.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require("ollama").setup() end },
  { "tomtom/tcomment_vim" },             -- commenting

  -- COLOR SCHEMES
  { "dracula/vim" },
  { "dbb/vim-gummybears-colorscheme" },
  { "altercation/vim-colors-solarized" },
  { "sliminality/wild-cherry-vim" },

  -- MISC VISUAL
  { "junegunn/goyo.vim" },
  { "junegunn/limelight.vim" },

  -- LANGUAGES + SYNTAXES
  { "dense-analysis/ale" },              -- async linter
  { "honza/dockerfile.vim" },
  { "rhysd/vim-gfm-syntax" },
  { "pangloss/vim-javascript" },
  { "elzr/vim-json" },
  { "tpope/vim-markdown" },
  { "tpope/vim-rails" },
  { "leafgarland/typescript-vim" },

  -- Example of adding post-install command if needed
  -- { "example/plugin", build = "make" },
}
