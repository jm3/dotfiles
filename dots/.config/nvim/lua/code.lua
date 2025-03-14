-- insert debugger in JS but don't whine about it
vim.cmd [[
  iabbrev dbg // eslint-disable-next-line<CR>debugger
]]

-- ALE (linter & fixer) setup
vim.g.ale_linters = {
  html = { "tidy" },
  javascript = { "eslint" },
  json = { "jq" },
}

vim.g.ale_fixers = {
  javascript = { "prettier", "eslint" },
  html = { "tidy" },
  json = { "jq" },
  ["*"] = { "remove_trailing_lines", "trim_whitespace" },
}

-- Optional: uncomment to disable global prettier/eslint
-- vim.g.ale_javascript_prettier_use_global = 0
-- vim.g.ale_javascript_eslint_use_global = 0

vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = "❌"
vim.g.ale_sign_warning = "⚠️"

vim.g.ale_pattern_options = {
  [".*_mailer/*"] = { ale_enabled = 0 }
}

-- Syntax highlighting based on file type
vim.cmd("syntax enable")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.erb", command = "set filetype=html" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.fish", command = "set filetype=sh" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.jade", command = "set filetype=pug" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.less", command = "set filetype=css" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.pug", command = "set filetype=pug" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.ru", command = "set filetype=ruby" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.slim", command = "set filetype=pug" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.thor", command = "set filetype=ruby" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*/css/*.erb", command = "set filetype=css" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = ".babelrc", command = "set filetype=javascript" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "/etc/nginx/*", command = "set filetype=nginx" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "Gemfile", command = "set filetype=ruby" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "Guardfile", command = "set filetype=ruby" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "Vagrantfile", command = "set filetype=ruby" })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*vim", command = "setlocal keywordprg=:help" })
