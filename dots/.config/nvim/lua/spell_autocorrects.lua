-- Spelling reminders:
-- In insert mode, Ctrl-x s for suggestions
-- In normal mode, z= for suggestions

-- Don't require capitalization for spelling
vim.opt.spellcapcheck = ""

-- Don't flag URLs as misspelled
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.fn.matchadd("UrlNoSpell", [[\w\+:\/\/\S\+]])
  end,
})

-- (Optional, not working yet in original Vimscript)
-- vim.cmd([[syn match ThousandsDollarAmountNoSpell "\$\d\+k" contains=@NoSpell]])

-- Set spell language and enable spelling locally, but keep off globally
vim.opt.spelllang = { "en_us" }
vim.opt.spell = false -- default to off

-- Uncomment if you want to clear or adjust SpellBad highlighting:
-- vim.cmd("highlight clear SpellBad")
-- vim.cmd("highlight SpellBad term=bold ctermfg=5")

-- Auto-enable spell checking for markdown and text files
vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
  pattern = { "*.txt", "*.md" },
  command = "setlocal spell",
})

-- Auto-correct common typos
vim.cmd [[
  iabbrev <A <a
  iabbrev buig bug
  iabbrev flase false
  iabbrev frmo from
  iabbrev jsut just
  iabbrev manogoian manoogian
  iabbrev nad and
  iabbrev ot to
  iabbrev pate paste
  iabbrev prolly probably
  iabbrev teamplate template
  iabbrev tempalte template
  iabbrev teh the
  iabbrev hte the
  iabbrev yuo you
]]
