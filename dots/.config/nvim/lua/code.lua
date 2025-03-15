-- insert debugger in JS but don't whine about it
vim.cmd [[
  iabbrev dbg // eslint-disable-next-line<CR>debugger
]]

-- Disable Python 3 provider
vim.g.loaded_python3_provider = 0

-- Syntax highlighting based on file type
vim.cmd("syntax enable")

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
