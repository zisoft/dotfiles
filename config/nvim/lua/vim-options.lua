vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.filetype = "on"
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.signcolumn = "yes:1"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.relativenumber = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- vim.opt.winborder = "rounded"

-- Add noselect to completeopt, otherwise autocompletion is annoying
vim.opt.completeopt="menuone,noselect,popup"

-- diagnostics
vim.diagnostic.config({ virtual_text = true })
