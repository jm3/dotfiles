-- Syntax highlighting
vim.cmd("syntax on")

-- Show mode and command in status line
vim.opt.showmode = true
vim.opt.showcmd = true

-- Line numbers and ruler
vim.opt.ruler = true
vim.opt.number = true

-- Always show status line
vim.opt.laststatus = 2

-- Word wrapping at word boundaries
vim.opt.linebreak = true

-- jm3 fave colorscheme at the moment; alt: dracula
vim.cmd("silent! colorscheme wildcherry")
vim.opt.termguicolors = true -- terminal color support (modern equivalent of t_Co=256)

-- Highlight current line
vim.opt.cursorline = true

-- Borrow some more legible colors (make diffs more legible)
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*", -- Apply on any colorscheme load
  callback = function()
    vim.api.nvim_set_hl(0, 'DiffAdded', { fg = '#00afff', bg = 'none', bold = false })
    vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = '#ff005f', bg = 'none', bold = false })
    vim.api.nvim_set_hl(0, 'DiffText', { fg = '#ff005f', bg = '#ffd700', reverse = true })
    vim.api.nvim_set_hl(0, 'DiffAdd', { link = 'DiffAdded' })
    vim.api.nvim_set_hl(0, 'DiffDelete', { link = 'DiffRemoved' })
    vim.api.nvim_set_hl(0, "markdownItalic", { link = "htmlTagName" })
    vim.api.nvim_set_hl(0, "markdownBold", { link = "Todo" })
    vim.api.nvim_set_hl(0, "markdownH1", { link = "texRefLabel" })
  end,
})

-- JSON conceal
vim.opt.conceallevel = 2

-- Goyo margins
vim.g.goyo_margin_top = 2
vim.g.goyo_margin_bottom = 2

-- GUI (VimR/MacVim) specific settings
if vim.g.neovide or vim.fn.exists("g:GuiLoaded") == 1 then
  vim.cmd("colorscheme dracula") -- GUI-specific colorscheme

  -- VimR-specific settings (alternative to guioptions)
  vim.opt.linespace = 2  -- Adjust line spacing (optional)
  vim.opt.guifont = "FiraCode Nerd Font:h14"  -- Set a GUI font (change as needed)
end

-- Optional: Limelight auto-toggle for markdown
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.md", command = "Limelight" })
vim.api.nvim_create_autocmd("BufLeave", { pattern = "*.md", command = "Limelight!" })
vim.keymap.set("n", "<Leader>L", ":Limelight!!<CR>", { silent = true })
vim.g.limelight_conceal_ctermfg = 238 -- i forget what this is

-- Folding options
vim.opt.foldminlines = 2 -- don't fold if <=2 lines, incl 1st e.g header
vim.opt.fillchars = { vert = "|", fold = "="}
