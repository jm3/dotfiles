-- Gist clipboard copy command for macOS
vim.g.gist_clip_command = "pbcopy"

local map = vim.keymap.set

-- Sort selected block
map("n", "<Leader>s", "!}sort -f<CR>")

-- Make line an HTML list item
map("n", "L", "^i<li><Esc>$a</li><Esc>")

-- Make line a HTML link
map("n", "<Leader>a", '0i<a href="<Esc>$a"></a><Esc>hhhi')

-- Insert row of '=' or '-'
map("n", "-", 'o<Esc>24i-<Esc>')
map("n", "=", 'o<Esc>24i=<Esc>')

-- Comment out blocks (any language)
map("n", "<Leader>c", "gcip<CR>")

-- Disable auto comment-next-line behavior
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

-- Re-wrap current block
map("n", "f", "!} fmt -w 72<CR>")

-- Pretty-print JSON block (Python required)
map("n", "<Leader>j", "ggVG!python3 -m json.tool<CR><CR>")

-- Pretty-print HTML block (HTML Tidy required)
map("n", "<Leader>h", "!tidy -q --show-warnings no<CR><CR>")

-- Copy whole buffer to clipboard
map("n", "C", "1GyG:1,$!pbcopy<CR>PGdd1G")

-- Viminfo configuration
vim.opt.viminfo = "%,'100,/100,:999,@100,f0"

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

-- Trigger listing
map("n", "<Leader>d", ":!~/bin/unversioned/d<CR>")

-- Commify list (space-separated to comma-separated)
map("n", ",C", ":%s/ /,/g<CR>")

-- Copy current file path to clipboard
map("n", "<Leader>r", ':let @" = expand("%")<CR>')

-- Change directory to current file's directory
map("n", "<Leader>g", ":cd %:p:h<CR>", { silent = true })

-- Startify custom header (display a fortune)
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

-- Title-case selected text (crazy macro)
map("n", "<Leader>Tc", [[:S/\<$begin:math:text$\\W$end:math:text$$begin:math:text$\\W*$end:math:text$\>/\U\1\L\2/G<CR>:nohlsearch<CR>]], { silent = true })