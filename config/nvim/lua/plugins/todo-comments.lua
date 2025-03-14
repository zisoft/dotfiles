return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
  keys = {
    { "<leader>td", "<cmd>TodoTelescope<CR>", desc = "Show Todo comments" },
  },
}
