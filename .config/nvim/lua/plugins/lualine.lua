return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
      },
      sections = {
        lualine_b = {
          "branch"
        },
        lualine_c = {
          {
            "filename",
            path = 4,
          },
          -- "buffers",
        },
        lualine_x = {
          "encoding",
          {
            "fileformat",
            symbols = {
              unix = "LF",
              dos = "CRLF",
              mac = "LF",
            },
          },
          "filetype",
        },
      },
    })
  end,
}
