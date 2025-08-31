vim.pack.add({
  { src = "https://github.com/L3MON4D3/LuaSnip" },
})

local ls = require("luasnip")
require("luasnip.loaders.from_lua").load({ paths = "./snippets/" })

ls.setup({ enable_autosnippets = true })

vim.keymap.set({ "i" }, "<C-e>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })
