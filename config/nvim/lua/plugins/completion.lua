return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
	version = "*",
	lazy = false,

	config = function()
		require("blink.cmp").setup({
			keymap = {
				preset = "super-tab",
			},
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

		-- load snippets
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").load({ paths = "./snippets" })
	end,
}
