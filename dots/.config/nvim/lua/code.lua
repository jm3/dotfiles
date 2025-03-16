-- insert debugger in JS but don't whine about it
vim.cmd [[
  iabbrev dbg // eslint-disable-next-line<CR>debugger
]]

-- Disable Python 3 provider
vim.g.loaded_python3_provider = 0

-- Syntax highlighting based on file type
vim.cmd("syntax enable")

-- Toggle commenting a visually selected block (using tcomment_vim)
vim.keymap.set("n", "<Leader>c", function()
  vim.cmd('normal gcip')
end, { desc = "Toggle comment block with tcomment", noremap = true })

-- ALE lint/error status in bottom statusline
-- adapted from: https://www.vimfromscratch.com/articles/vim-for-ruby-and-rails-in-2019
_G.linter_status = function()
  local counts = vim.fn["ale#statusline#Count"](vim.api.nvim_get_current_buf())

  local all_errors = counts.error + counts.style_error
  local all_non_errors = counts.total - all_errors

  if counts.total == 0 then
    return "✨ all good ✨"
  else
    return string.format("🫣 %d Warnings %d Errors", all_non_errors, all_errors)
  end
end

vim.opt.statusline = table.concat({
  "%m",      -- Modified flag
  " %f",     -- File path
  "%=",      -- Right-align following
  "%{v:lua.linter_status()}" -- Call Lua function dynamically
})
-- Set filetype based on file extension
local filetype_cmds = {
  { pattern = "*.erb",       filetype = "html" },
  { pattern = "*.fish",      filetype = "sh" },
  { pattern = "*.jade",      filetype = "pug" },
  { pattern = "*.less",      filetype = "css" },
  { pattern = "*.pug",       filetype = "pug" },
  { pattern = "*.ru",        filetype = "ruby" },
  { pattern = "*.slim",      filetype = "pug" },
  { pattern = "*.thor",      filetype = "ruby" },
  { pattern = "*/css/*.erb", filetype = "css" },
  { pattern = ".babelrc",    filetype = "javascript" },
  { pattern = "/etc/nginx/*",filetype = "nginx" },
  { pattern = "Gemfile",     filetype = "ruby" },
  { pattern = "Guardfile",   filetype = "ruby" },
  { pattern = "Vagrantfile", filetype = "ruby" },
  { pattern = "*vim",        command  = "setlocal keywordprg=:help" },
}

for _, entry in ipairs(filetype_cmds) do
  local cmd = entry.command or ("set filetype=" .. entry.filetype)
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = entry.pattern,
    command = cmd,
  })
end
