-- install lazy.nvim plugin manager if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup(require("plugins"))

-- put cursor on any line below and press gF (buffer local shortcut)
-- to open one of the Lua config files below
require("core")
require("code")
require("keys")
pcall(require, "personal") -- insert personal configs here (optional)
require("plugins")
require("spacing")
require("spell_autocorrects")
require("super_powers")
require("visual")
require("config_utils")
