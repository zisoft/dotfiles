return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      styles = {
        comments = { "italic" },
        conditionals = {},
      },
      integrations = {
        blink_cmp = true,
        mason = true,
        indent_blankline = {
          scope_color = "surface2",
        },
      },
      vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#737994" }),
      vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#737994" }),
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
