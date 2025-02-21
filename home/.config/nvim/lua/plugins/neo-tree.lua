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
}
