return {
  "saghen/blink.cmp",
  version = "1.*",

  config = function()
    require("blink.cmp").setup({
      keymap = { preset = "default" },

      cmdline = {
        completion = {
          menu = { auto_show = true },
        },
        keymap = {
          preset = "super-tab",
        },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    })

  end,
}
