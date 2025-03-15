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

-- Set terminal title, restore on exit
vim.opt.title = true
vim.cmd([[let &t_ti = &t_ti . "\e[22;0t"]])
vim.cmd([[let &t_te = "\e[23;0t" . &t_te]])

-- Set colorscheme with fallback
vim.cmd("silent! colorscheme wildcherry") -- fallback if dracula unavailable
vim.opt.termguicolors = true -- terminal color support (modern equivalent of t_Co=256)

-- Highlight current line
vim.opt.cursorline = true

-- Diff colors (make diffs legible)
vim.cmd([[
  highlight! DiffAdded   term=none      ctermfg=4  ctermbg=0
  highlight! DiffRemoved term=none      ctermfg=1  ctermbg=0
  highlight! DiffText    term=reverse   ctermfg=1  ctermbg=3

  highlight! link DiffAdd DiffAdded
  highlight! link DiffDelete DiffRemoved

  highlight! link markdownItalic htmlTagName
  highlight! link markdownBold   Todo
  highlight! link markdownH1     texRefLabel
]])

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
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.md", command = "Limelight" })
-- vim.api.nvim_create_autocmd("BufLeave", { pattern = "*.md", command = "Limelight!" })
-- vim.keymap.set("n", "<Leader>l", "<Plug>(Limelight!!)", { silent = true })
-- vim.g.limelight_conceal_ctermfg = 238 -- Uncomment if needed

-- Folding options (commented, as in Vim)
-- vim.opt.foldminlines = 2
-- vim.opt.fillchars = { vert = "|", fold = "." }
