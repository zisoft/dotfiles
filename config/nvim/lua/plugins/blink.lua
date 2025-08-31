vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    -- ["<C-y>"] = { "select_and_accept" },
    -- ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    -- ["<C-n>"] = { "select_next", "fallback_to_mappings" },
    -- ["<C-k>"] = { "snippet_forward", "fallback" },
  },

  cmdline = {
    keymap = { preset = "super-tab" },
    completion = {
      menu = { auto_show = true, },
    },
  },

  appearance = { nerd_font_variant = "mono" },

  snippets = { preset = "luasnip" },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  }
})

