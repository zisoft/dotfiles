-- Swift-specific settings
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.wrap = false

-- Disable conflicting indent settings
vim.opt_local.cindent = false
vim.opt_local.smartindent = false
vim.opt_local.autoindent = true

-- Use Treesitter for indentation
vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Fallback: Map = to LSP formatting for Swift
vim.keymap.set('n', '=', function()
  vim.lsp.buf.format({ async = false })
end, { buffer = true, desc = 'Format with LSP' })

vim.keymap.set('v', '=', function()
  vim.lsp.buf.format({ async = false })
end, { buffer = true, desc = 'Format selection with LSP' })
