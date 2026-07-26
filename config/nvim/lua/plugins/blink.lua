vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  { src = 'https://github.com/saghen/blink.pairs', version = vim.version.range('*') },
})

-- completion
local cmp = require('blink.cmp')
cmp.build():pwait()

cmp.setup({

  keymap = {
    preset = "default",
  },

  cmdline = {
    keymap = { preset = "super-tab" },
    completion = {
      menu = { auto_show = true, },
    },
  },

  completion = {
    accept = {
      -- auto_brackets = { enabled = false },
    },
  },

  appearance = { nerd_font_variant = "mono" },

  snippets = { preset = "luasnip" },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  }
})

-- pairs
local pairs = require('blink.pairs')
pairs.build():pwait(60000)

pairs.setup()
