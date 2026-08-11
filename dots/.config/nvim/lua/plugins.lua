-- lua/plugins.lua
-- lazy.nvim plugin manager
return {

  -- GENERAL EDITING
  { "gabesoft/vim-ags" },                -- silver-searcher (ag)
  { "junegunn/vim-easy-align" },         -- alignment
  { "junegunn/fzf" },                    -- core fuzzy finder
  { "junegunn/fzf.vim" },                -- fzf recipes: https://github.com/junegunn/fzf.vim?tab=readme-ov-file#commands
  { "mikeboiko/vim-markdown-folding" },  -- markdown folding
  { "scrooloose/nerdtree" },             -- file browser
  {
    "nvim-tree/nvim-web-devicons",       -- Nerd Font file-type icons (requires a Nerd Font in your terminal)
    config = function() require("nvim-web-devicons").setup() end,
  },
  {
    "tiagofumo/vim-nerdtree-syntax-highlight", -- feeds nvim-web-devicons into NERDTree
    dependencies = { "scrooloose/nerdtree", "nvim-tree/nvim-web-devicons" },
  },
  { "tpope/vim-repeat" },                -- repeat last command
  { "vim-scripts/LargeFile" },           -- optimize large files
  { "mhinz/vim-startify" },              -- start screen
  { "vim-scripts/mru.vim" },             -- most-recent files
  { "ervandew/supertab" },               -- <tab> for completion
  { "wellle/targets.vim" },              -- text objects

  -- CODING
  { "github/copilot.vim" },              -- copilot AI - uses cloud
  { "williamboman/mason.nvim" },         -- installs LSP servers for you
  { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim" } },
  {
    "saghen/blink.cmp", version = "1.*", -- completion menu UI
    opts = {
      keymap = { preset = "default" }, -- <C-y> accept, <C-n>/<C-p> or arrows to select
      completion = {
        documentation = { auto_show = true },
        -- default menu draw (with kind_icon) now that a Nerd Font is installed
      },
      -- default sources included "buffer", which suggests any word already
      -- typed in the current buffer -- that's what was popping a menu after
      -- every word in plaintext/commit messages/etc. with no LSP to scope
      -- it. lsp/path/snippets only fire where they're actually relevant.
      sources = { default = { "lsp", "path", "snippets" } },
    },
  },
  {
    "neovim/nvim-lspconfig",             -- real, type-aware TS/Vue completion (see lua/lsp.lua)
    dependencies = { "williamboman/mason-lspconfig.nvim", "saghen/blink.cmp" },
    config = function() require("lsp").setup() end,
  },
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

      -- CSS: npm i -g stylelint stylelint-order stylelint-color-format stylelint-no-unsupported-browser-features stylelint-config-tailwindcss # FML

      -- HTML: brew install tidy-html5

      -- JS: npm i -g eslint prettier eslint-config-prettier

      -- ruby: gem install rubocop rails_best_practices reek # standardrb

    "dense-analysis/ale",
    config = function()
      vim.g.ale_enabled = 1
      vim.g.ale_fix_on_save = 1

      vim.g.ale_sign_error = "❌"
      vim.g.ale_sign_warning = "⚠️"
      -- vim.g.ale_ruby_rubocop_executable = "bundle" -- this didn't work well for me

      vim.g.ale_javascript_prettier_options = "--config-precedence file-override"
      vim.g.ale_vue_prettier_options = "--config-precedence file-override"
      vim.g.ale_typescript_prettier_options = "--config-precedence file-override"

      -- typescript pinned to eslint explicitly (matching javascript/vue below) so
      -- ALE doesn't auto-detect and spawn its own bundled "deno" LSP linter just
      -- because the deno binary happens to be on PATH -- that duplicated vtsls
      -- (see lua/lsp.lua) on every plain .ts file.
      vim.g.ale_linters = {
        css = { "stylelint" },
        html = { "tidy" },
        javascript = { "eslint" },
        json = { "jq" },
        ruby = {"rails_best_practices", "rubocop"}, -- i don't approve of: standardrb
        typescript = { "eslint" },
        vue = { "eslint" },
      }

      vim.g.ale_fixers = {
        css = { "stylelint" },
        html = { "tidy" },
        javascript = { "prettier", "eslint" },
        json = { "jq" },
        ruby = {"rubocop" },
        typescript = { "prettier", "eslint" },
        vue = { "prettier", "eslint" },
        ["*"] = { "remove_trailing_lines", "trim_whitespace" },
      }

      vim.g.ale_pattern_options = {
        [".*_email.html.erb"] = { ale_enabled = 0 }
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
