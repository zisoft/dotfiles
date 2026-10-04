vim.pack.add({
  "https://github.com/mrjones2014/smart-splits.nvim",
  'https://github.com/smart-splits-nvim/backend-ghostty'
})

require("smart-splits").setup({
  default_amount = 3,
  at_edge = "stop",
})

require('ghostty-smart-splits').setup({
  key_table = 'nvim'
})

-- moving between splits
vim.keymap.set({'n', 't'}, '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set({'n', 't'}, '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set({'n', 't'}, '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set({'n', 't'}, '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set({'n', 't'}, '<C-\\>', require('smart-splits').move_cursor_previous)

-- resizing splits
vim.keymap.set({'n', 't'}, '<M-h>', require('smart-splits').resize_left)
vim.keymap.set({'n', 't'}, '<M-j>', require('smart-splits').resize_down)
vim.keymap.set({'n', 't'}, '<M-k>', require('smart-splits').resize_up)
vim.keymap.set({'n', 't'}, '<M-l>', require('smart-splits').resize_right)

