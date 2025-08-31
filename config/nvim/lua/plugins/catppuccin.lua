vim.pack.add({ "https://github.com/catppuccin/nvim" })

require("catppuccin").setup({
  flavour = "frappe",
  styles = {
    comments = { "italic" },
    conditionals = {},
    misc = {},
  },
  integrations = {
    blink_cmp = true,
    mason = true,
  },
})

vim.cmd.colorscheme("catppuccin")
