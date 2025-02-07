return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	opts = {
		close_if_last_window = true,
		sort_case_insensitive = true,
		filesystem = {
			filtered_items = {
				hide_gitignored = false,
			},
		},
		sources = {
			"filesystem",
			"buffers",
			"document_symbols",
		},
	},

	keys = {
		{ "<C-n>", ":Neotree filesystem reveal left<CR>", desc = "Neotree" },
		{ "<leader>tc", ":Neotree close<CR>", desc = "Neotree" },
		{ "<leader>tb", ":Neotree buffers<CR>", desc = "Neotree" },
		{ "<leader>to", ":Neotree document_symbols<CR>", desc = "Neotree" },
	},
}
