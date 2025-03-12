return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  opts = {
    view_options = {
      case_insensitive = true,
    },
    float = {
      padding = 2,
      max_width = 0.8,
      max_height = 0.8,
    },
  },
  keys = {
    { "-", "<cmd>Oil --float<cr>", desc = "Oil: Open parent directory" },
  },
}
