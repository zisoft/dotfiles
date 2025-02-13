return {
  "saghen/blink.cmp",
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    signature = { enabled = true },
    keymap = { preset = 'enter' },
    appearance = {
      use_nvim_cmp_as_default = true,
    },
  },
}
