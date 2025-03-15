vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "init.lua",
  callback = function()
    -- Buffer-local mapping for 'gF' in init.lua
    vim.keymap.set("n", "gF", function()
      -- Get the current line
      local line = vim.api.nvim_get_current_line()
      -- Extract module name inside require("...")
      local module = line:match('require%(["\'](.-)["\']%)')

      if not module then
        print("No require() module found on this line.")
        return
      end

      -- Convert dots to slashes for nested modules
      local path = vim.fn.stdpath("config") .. "/lua/" .. module:gsub("%.", "/") .. ".lua"

      -- Check if file exists
      if vim.fn.filereadable(path) == 1 then
        vim.cmd("edit " .. path)
        print("Opened: " .. path)
      else
        print("Module not found: " .. path)
      end
    end, { buffer = true, desc = "Jump to Lua module from require line" })
  end,
})
