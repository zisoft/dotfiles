return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = {
            "node_modules",
            "build",
            "src/external",
            ".git/",
            ".cache/",
            ".DS_Store",
            "po/",
          },
        },

        pickers = {
          find_files = {
            hidden = true,
            no_ignore = true,
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
