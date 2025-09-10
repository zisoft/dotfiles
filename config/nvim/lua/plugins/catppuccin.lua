vim.pack.add({ "https://github.com/catppuccin/nvim" })

require("catppuccin").setup({
  styles = {
    conditionals = {},
    misc = {},
  },
  integrations = {
    blink_cmp = true,
    mason = true,
  },
})
