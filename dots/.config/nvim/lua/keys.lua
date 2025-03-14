-- Leader key
vim.g.mapleader = ","

local map = vim.keymap.set

-- Insert mode: quick escape
map("i", "jj", "<Esc>")

-- Command-line mode tweaks
map("c", "<C-a>", "<C-b>") -- ctrl-a should be beginning of line
map("c", "<C-k>", "<C-u>") -- ctrl-k to delete to beginning (as close as possible)

-- File + buffer commands
map("n", "<Leader>n", ":NERDTreeToggle<CR>")

-- Auto-correct common mistakes
map("n", ":E", ":e")
map("n", "<Leader>v", ":e ~/.config/nvim/init.lua<CR>") -- adjust to ~/.config/nvim/init.lua if needed

map("n", "q", ":q<CR>")
map("n", "Q", ":q")
map("n", "W", ":w")
map("n", ":W", ":w")
map("n", ":W!", ":w!")
map("n", ":Q", ":q")
map("n", ":Q!", ":q!")
map("n", ":Wq!", ":wq!")
map("n", ":WQ!", ":wq!")

-- Redo shortcut
map("n", "R", ":redo<CR>")

-- Abbreviations for datetime
vim.cmd [[
  iabbr <expr> dts strftime("%Y-%m-%d - %A, %B %d")
  iabbr <expr> ttt strftime("%H:%M %p")
]]

-- Save + run grunt
map("n", "<F1>", ":w<CR>:!clear;grunt<CR><CR>")

-- Clear search highlight
map({ "n", "v" }, "<C-l>", ":nohls<CR><C-l>", { silent = true })

-- Indent / Un-indent with space / backspace
map("", "<Space>", ">>", { noremap = true })
map("", "<BS>", "<<", { noremap = true })

-- Allow backspacing freely
vim.opt.backspace = { "indent", "eol", "start" }

-- Toggle line numbers
map("", "N", ":set number<CR>")
map("", "M", ":set nonumber<CR>")

-- Arrow key remaps (OSX quirks / VimR handling)
if not vim.fn.has("nvim") then
  vim.opt.esckeys = true
end

map("", "[A", "k") -- Up
map("", "[B", "j") -- Down
map("", "[C", "l") -- Right
map("", "[D", "h") -- Left

-- Folding shortcuts
map("", "zC", "zM")
map("", "zO", "zR")

-- MRU (Most Recently Used files)
map("n", "<Leader>m", ":MRU<CR>")
map("n", "<Leader>,", ":MRU<CR>")

-- EasyAlign (visual mode)
map("v", "<CR>", "<Plug>(EasyAlign)")

-- Move lines up/down
map("n", "<C-j>", ":m .+1<CR>==", { noremap = true, silent = true })
map("n", "<C-k>", ":m .-2<CR>==", { noremap = true, silent = true })
map("i", "<C-j>", "<ESC>:m .+1<CR>==gi", { noremap = true, silent = true })
map("i", "<C-k>", "<ESC>:m .-2<CR>==gi", { noremap = true, silent = true })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Undotree toggle
map("n", "<Leader>u", ":UndotreeToggle<CR>")

-- Titlecase (plugin mapping)
map("n", "<Leader>gt", "<Plug>Titlecase")
map("v", "<Leader>gt", "<Plug>Titlecase")
map("n", "<Leader>gT", "<Plug>TitlecaseLine")

-- Disabled: block navigation, kept for future
-- map("n", "[", "{")
-- map("n", "]", "}")

-- Disabled spell/number toggles (optional to re-enable)
-- map("", "s", ":set nospell<CR>")
-- map("", "S", ":set spell<CR>")

-- Commented-out CSS block navigation (future):
-- map("n", "<Leader>s", "[<CR><CR>!}sort<CR>v}:s/:\\([^ ]\\)/: \\1/<CR>")
