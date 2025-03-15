-- Gist clipboard copy command for macOS
vim.g.gist_clip_command = "pbcopy"

local map = vim.keymap.set

-- Sort selected block
map("n", "<Leader>s", "!}sort -f<CR>")

-- Make line an HTML list item
map("n", "<Leader>l", "^i<li><Esc>$a</li><Esc>")

-- Insert an HTML link with cursor in the URL
map("n", "<Leader>a", '0i<a href=""><Esc>$i</a><Esc>hhhhi', { desc = "Insert <a> tag", noremap = true })

-- Insert row of '=' or '-'
map("n", "-", 'o<Esc>24i-<Esc>')
map("n", "=", 'o<Esc>24i=<Esc>')

-- Re-wrap current block
map("n", "f", "!} fmt -w 72<CR>")

-- Pretty-print JSON block (Python required)
map("n", "<Leader>j", "ggVG!python3 -m json.tool<CR><CR>")

-- Pretty-print HTML block (HTML Tidy required)
map("n", "<Leader>h", "!tidy -q --show-warnings no<CR><CR>")

-- history stuff
-- %: Save/restore buffer list (list of open files).
-- '100: Save marks for 100 files.
-- /100: Save the last 100 search patterns.
-- :999: Save 999 lines of command-line history.
-- @100: Save contents of 100 input lines (typed at command line).
-- f0: Don't save file marks (like '0-9 marks' used for jumping to files).
--     We don't store file marks bc cursor restoration is handled via Lua
--     autocmd, below
vim.opt.shada = "%,'100,/100,:999,@100,f0"

-- restore cursor position for previously opened files
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    -- Skip git commit message buffers.
    if vim.fn.expand("%"):match("COMMIT_EDITMSG") then
      return
    end
    -- Get the stored cursor position from mark '"'.
    local pos = vim.fn.getpos('\"')
    local lnum = pos[2]
    local col = pos[3] - 1  -- API expects 0-indexed column
    local total_lines = vim.api.nvim_buf_line_count(0)
    if lnum > 1 and lnum <= total_lines then
      vim.api.nvim_win_set_cursor(0, { lnum, col })
    end
  end,
})

-- Restore cursor position (skip git commit messages)
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if not vim.fn.expand("%"):match("COMMIT_EDITMSG") and
       vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})

-- Commify list (space-separated to comma-separated)
map("n", ",C", ":%s/ /,/g<CR>")

-- Copy file path of current buffer to clipboard
vim.keymap.set("n", "<Leader>r", function()
  local filepath = vim.fn.expand("%:p")
  vim.fn.setreg("+", filepath)
  print("Copied: " .. filepath)
end, { desc = "Copy current file path to clipboard" })

-- cd to current buffer's directory
vim.keymap.set("n", "<Leader>g", function()
  local dir = vim.fn.expand("%:p:h")
  vim.cmd("cd " .. dir)
  print("Changed dir: " .. dir)
end, { desc = "Change to current file's directory", silent = true })

-- Startify custom header (with recent files + a quote)
vim.g.startify_custom_header = vim.fn.map(
  vim.fn.split(vim.fn.system("fortune /Users/jm3/.dotfiles/fortunes"), "\n"),
  '"   " .. v:val'
)
table.insert(vim.g.startify_custom_header, "")
table.insert(vim.g.startify_custom_header, "")

-- Startify skiplist
vim.g.startify_skiplist = {
  "COMMIT_EDITMSG",
  vim.env.HOME .. "/Not Backed Up/*",
  vim.env.HOME .. "/.dotfiles/dots/.vim/plugged/.*/doc",
}

-- Startify auto-update
vim.g.startify_update_oldfiles = 1

-- Startify shortcut
map("n", "<Leader>S", ":Startify<CR>", { silent = true })

-- Edit file under cursor in new tab
map("n", "<Leader>ef", ":tabe <cfile><CR>")
