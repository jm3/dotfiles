-- Set tabs and indentation
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 5 -- Keep 5 lines visible when scrolling

-- Reminder: :retab to replace tabs with spaces in a buffer

-- Enable filetype plugins and indentation
vim.cmd("filetype plugin indent on")

-- Automatically remove trailing whitespace on save for specific file types
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.rb", "*.json", "*.yml", "*.css", "*.js", "*.html", "*.haml" },
  command = [[%s/\s\+$//e]],
})