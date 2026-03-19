-- lua/lazy_bootstrap.lua

local M = {}

function M.setup()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  local fs_stat = (vim.uv or vim.loop).fs_stat  -- vim.uv preferred in nvim 0.10+
  if not fs_stat(lazypath) then
    local out = vim.fn.system({
      "git", "clone", "--filter=blob:none", "--branch=stable",
      "https://github.com/folke/lazy.nvim.git", lazypath,
    })
    if vim.v.shell_error ~= 0 then
      vim.notify("lazy.nvim clone failed:\n" .. out, vim.log.levels.ERROR)
      return
    end
  end
  vim.opt.rtp:prepend(lazypath)
end

return M
