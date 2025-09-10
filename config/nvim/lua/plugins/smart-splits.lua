vim.pack.add({ "https://github.com/mrjones2014/smart-splits.nvim" })

local smart_splits = require("smart-splits")

smart_splits.setup({ })

vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left)
vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down)
vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up)
vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right)

vim.keymap.set('n', '<C-M-h>', smart_splits.resize_left)
vim.keymap.set('n', '<C-M-j>', smart_splits.resize_down)
vim.keymap.set('n', '<C-M-k>', smart_splits.resize_up)
vim.keymap.set('n', '<C-M-l>', smart_splits.resize_right)

