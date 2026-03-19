-- jm3 @ { monkey, sigma6, organic, zivity, 140proof, apple, etc } -- 🚀 ...

-- put cursor on any line below and press gF (buffer local shortcut)
-- to open one of the Lua config files below
require("lazy_bootstrap").setup()

-- lazy.nvim may not be available on first launch before the bootstrap clone completes
local lazy_ok, lazy = pcall(require, "lazy")
if lazy_ok then
  lazy.setup(require("plugins")) -- ~/.config/nvim/lua/plugins.lua
else
  vim.notify("lazy.nvim not found — plugins disabled. Quit and reopen nvim to auto-install, or check that git is available.", vim.log.levels.WARN)
end

-- require("plugins") - -included only for easy access to plugin configs via gF :)
require("core")
require("code")
require("keys")
pcall(require, "personal") -- ~/.config/nvim/lua/personal.lua
require("spacing")
require("spell_autocorrects")
require("super_powers")
require("visual")
require("config_utils")
