vim.pack.add({
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  auto_install = true,
  ensure_installed = {
    "clangd",
    "cssls",
    "html",
    "lua_ls",
    "yamlls",
  }
})

require("mason-tool-installer").setup({
  auto_update = true,
  ensure_installed = {
    "eslint_d",
    "prettier",
    "pylint",
    "stylelint",
    "stylua",
  }
})
