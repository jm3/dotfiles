-- ✅ Recommended Order in init.lua:

-- In most cases, you want the vim.opt and vim.g.mapleader settings to
-- happen before the require calls to your module files — especially if
-- those modules assume that leader is set, or use global options like
-- clipboard, mouse, number, etc.
--
-- As for plugin loading via lazy.nvim, that should also come before you
-- require any modules that depend on those plugins.
--

-- 1.	General Neovim options and leader key (since modules or plugins may depend on them).
-- 2.	Lazy.nvim setup and plugin loading.
-- 3.	Your module require calls (like code, keys, spacing, etc.), since some may use the plugins.

-- ================================
-- Bootstrap lazy.nvim (Plugin Manager) if not installed
-- ================================
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

-- ================================
-- General Neovim Options & Leader
-- ================================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.g.mapleader = " " -- Sets leader to Spacebar

-- ================================
-- Load Plugins (after Bootstrap)
-- ================================
require("lazy").setup(require("plugins"))

-- ================================
-- Load Modular Config Files, all assumed to be .lua files
-- ================================
require("code")
require("keys")
pcall(require, "personal") -- Optional/personal, won't throw if missing
require("plugins")
require("preview_schemes")
require("recent_files")
require("spacing")
require("spell_autocorrects")
require("super_powers")
require("visual")

-- ================================
-- Example Plugin Keymap (Optional)
-- ================================
vim.keymap.set("v", "<leader>oo", function()
  require("ollama").ask()
end, { desc = "Ask Ollama (visual selection)" })
