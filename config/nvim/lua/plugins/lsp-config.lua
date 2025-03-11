return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		lazy = false,
		opts = {
			servers = {
				lua_ls = {},
				clangd = {
					cmd = {
						"clangd",
						"--offset-encoding=utf-16",
					},
				},
			},
		},

		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Lsp: lsp Hover" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Lsp: Goto declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Lsp: Goto definition" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp: Code action" })
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Lsp: Format buffer" })
		end,
	},
}
