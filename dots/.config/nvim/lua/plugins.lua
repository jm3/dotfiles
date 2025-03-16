-- lua/plugins.lua
return {

  -- GENERAL EDITING
  { "gabesoft/vim-ags" },                -- silver-searcher (ag)
  { "junegunn/vim-easy-align" },         -- alignment
  { "junegunn/fzf" },                    -- core fuzzy finder
  { "junegunn/fzf.vim" },                -- fzf recipes: https://github.com/junegunn/fzf.vim?tab=readme-ov-file#commands
  { "mikeboiko/vim-markdown-folding" },  -- markdown folding
  { "scrooloose/nerdtree" },             -- file browser
  { "tpope/vim-repeat" },                -- repeat last command
  { "vim-scripts/LargeFile" },           -- optimize large files
  { "mhinz/vim-startify" },              -- start screen
  { "vim-scripts/mru.vim" },             -- most-recent files
  { "ervandew/supertab" },               -- <tab> for completion
  { "wellle/targets.vim" },              -- text objects

  -- CODING
  { "github/copilot.vim" },              -- copilot AI - uses cloud
  { "tmhedberg/matchit" },               -- % to match tags
  { "mattn/emmet-vim" },                 -- emmet for html/css
  { "tpope/vim-endwise" },               -- auto "end"
  { "airblade/vim-gitgutter" },          -- git status in margin
  { "tomtom/tcomment_vim" },             -- block comment toggle with ,c

  -- COLOR SCHEMES
  { "dracula/vim" },
  { "dbb/vim-gummybears-colorscheme" },
  { "altercation/vim-colors-solarized" },
  { "sliminality/wild-cherry-vim" },

  -- MISC VISUAL
  { "junegunn/goyo.vim" },
  { "junegunn/limelight.vim" },

  -- LANGUAGES + SYNTAXES

-- LINTER SETUP (requires ale in plugins.vim; dense-analysis >>>> w0rp (RIP w0rp)
  {
    -- all hail ALE, the asynchronous linter

    -- the below setup, optimized for my web-dev workflow, requires:

      -- CSS:
      -- npm i -g stylelint stylelint-order stylelint-color-format stylelint-no-unsupported-browser-features stylelint-config-tailwindcss # FML

      -- HTML:
      -- brew install tidy-html5

      -- JS:
      -- npm i -g eslint prettier eslint-config-prettier

      -- ruby:
      -- gem install rubocop rails_best_practices reek # standardrb

    "dense-analysis/ale",
    config = function()
      vim.g.ale_enabled = 1
      vim.g.ale_fix_on_save = 1

      vim.g.ale_sign_error = "❌"
      vim.g.ale_sign_warning = "⚠️"
      -- vim.g.ale_ruby_rubocop_executable = "bundle" -- this didn't work well for me

      vim.g.ale_linters = {
        css = { "stylelint" },
        html = { "tidy" },
        javascript = { "eslint" },
        json = { "jq" },
        ruby = {"rails_best_practices", "rubocop"}, -- i don't approve of: standardrb
      }

      vim.g.ale_fixers = {
        css = { "stylelint" },
        html = { "tidy" },
        javascript = { "prettier", "eslint" },
        json = { "jq" },
        ruby = {"rubocop" },
        ["*"] = { "remove_trailing_lines", "trim_whitespace" },
      }

      vim.g.ale_pattern_options = {
        [".*_mailer/*"] = { ale_enabled = 0 }
      }

      -- any other ALE-specific settings
    end,
  },
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

-- { "nomnivore/ollama.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require("ollama").setup() end },
