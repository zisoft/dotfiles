vim.pack.add({
  "https://github.com/mrjones2014/smart-splits.nvim",
  'https://github.com/smart-splits-nvim/backend-ghostty'
})

require("smart-splits").setup({
  mux = {
    backend = "smart-splits-backend-ghostty",
  },
  move = {
    at_edge = "stop",
  }
})

local splits = require("smart-splits")

-- moving between splits
vim.keymap.set({'n', 't'}, '<C-h>', splits.move_cursor_left)
vim.keymap.set({'n', 't'}, '<C-j>', splits.move_cursor_down)
vim.keymap.set({'n', 't'}, '<C-k>', splits.move_cursor_up)
vim.keymap.set({'n', 't'}, '<C-l>', splits.move_cursor_right)

-- resizing splits
vim.keymap.set({'n', 't'}, '<M-h>', splits.resize_left)
vim.keymap.set({'n', 't'}, '<M-j>', splits.resize_down)
vim.keymap.set({'n', 't'}, '<M-k>', splits.resize_up)
vim.keymap.set({'n', 't'}, '<M-l>', splits.resize_right)

