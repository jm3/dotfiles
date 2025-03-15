-- === Core Neovim Options ===

-- Backup directories (optional, if using swap/backup files)
vim.opt.directory = { "~/.vim/backups//", "~/.tmp/", "~/tmp/", ".tmp/" }

-- Buffer and editing behavior
vim.opt.hidden = true
vim.opt.history = 10000
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Timeout settings for key mappings
vim.opt.timeout = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 10

-- Command-line completion
vim.opt.wildchar = 9 -- Tab key
vim.opt.wildmenu = true
vim.opt.wildmode = { "list", "longest" }
vim.opt.wildignore = {
  "*alias", "*.alfredworkflow", "*.gem", "*.gif", "*.jpg", "*.mov", "*.mp4",
  "*.pdf", "*.png", "*.psd", "*.ttf", "*.webloc",
  "*.zip", "*.gz",
  ".git", "*/.bundle/*", "*.swp", "*~", "._*", "tmp", "vendor", "log"
}

-- Line wrapping behavior (cursor wraps to next/prev line)
vim.opt.whichwrap = "b,<,>,h,l"

-- === File management: Undo, Swap, Backups ===

-- Disable swap files to avoid annoying "file already open" prompts
vim.opt.swapfile = false

-- Disable backup and write-backup files (optional, for cleanliness)
vim.opt.backup = false
vim.opt.writebackup = false

-- Enable persistent undo and set undo directory
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"

-- === Autocommands and Special Filetype Behavior ===

-- Crontab fix (no backup when editing crontab)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "crontab",
  command = "setlocal nobackup nowritebackup",
})

-- === Plugin-Related Globals (MRU, netrw) ===

-- MRU settings (if still using MRU.vim)
vim.g.MRU_File = os.getenv("HOME") .. "/.vim/recent-files.vim"
vim.g.MRU_Max_Entries = 100

-- netrw temporary directory
vim.g.netrw_home = "/tmp/"

-- === Modeline and Filetype Plugins ===

-- Allow per-file modelines
vim.opt.modeline = true
vim.opt.modelines = 2

-- Enable filetype plugins (optional in Neovim, but safe to include)
vim.cmd("filetype plugin on")
