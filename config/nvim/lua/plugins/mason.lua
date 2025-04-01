return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      auto_install = true,
      ensure_installed = {
        "clangd",
        "cssls",
        "html",
        "lua_ls",
        "yamlls",
      },
    })

    mason_tool_installer.setup({
      auto_update = true,
      ensure_installed = {
        "black",
        "eslint_d",
        "isort",
        "prettier",
        "pylint",
        "stylelint",
        "stylua",
      },
    })
  end,
}
