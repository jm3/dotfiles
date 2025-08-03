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
  { pattern = ".pryrc",      filetype = "ruby" },
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

-- make sure we can find files in src/ and its subdirectories (e.g. for gf)
vim.opt.path:append("src/**")
vim.opt.suffixesadd:append({".js", ".vue", ".ts"})
vim.opt.includeexpr = "v:lua.resolve_import_path(v:fname)"

function _G.resolve_import_path(path)
  -- Debug: show original path
  vim.api.nvim_echo({{"Original path: " .. path, "Normal"}}, false, {})

  -- Handle @ alias transformation
  if string.match(path, "^@/") then
    path = string.gsub(path, "^@/", "")
    vim.api.nvim_echo({{"After @ strip: " .. path, "Normal"}}, false, {})
  end

  -- Find git root by traversing up
  local current_dir = vim.fn.expand('%:p:h')
  local git_root = nil

  while current_dir ~= '/' do
    if vim.fn.isdirectory(current_dir .. '/.git') == 1 then
      git_root = current_dir
      break
    end
    current_dir = vim.fn.fnamemodify(current_dir, ':h')
  end

  if git_root then
    local src_dir = "web-client/src"
    local resolved = git_root .. "/" .. src_dir .. path
    vim.api.nvim_echo({{"Resolved to: " .. resolved, "Normal"}}, false, {})
    return resolved
  else
    vim.api.nvim_echo({{"No git root found", "ErrorMsg"}}, false, {})
  end

  return path
end
