vim.pack.add({
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
})

vim.keymap.set("n", "<c-h>", "<cmd><c-u>TmuxNavigateLeft<cr>", { desc = "Tmux navigate left" })
vim.keymap.set("n", "<c-j>", "<cmd><c-u>TmuxNavigateDown<cr>", { desc = "Tmux navigate down" })
vim.keymap.set("n", "<c-k>", "<cmd><c-u>TmuxNavigateUp<cr>", { desc = "Tmux navigate up" })
vim.keymap.set("n", "<c-l>", "<cmd><c-u>TmuxNavigateRight<cr>", { desc = "Tmux navigate right" })
