return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  opts = {
    close_if_last_window = true
  },

  keys = {
    { "<C-n>", ":Neotree filesystem reveal <CR>", desc = "Neotree" },
    { "<leader>tt", ":Neotree toggle<CR>", desc = "Neotree" }
  }
}

