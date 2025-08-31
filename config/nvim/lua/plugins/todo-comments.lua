vim.pack.add({
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("todo-comments").setup()

vim.keymap.set("n", "<leader>st", function() Snacks.picker.todo_comments() end, { desc = "Todo comments" })
