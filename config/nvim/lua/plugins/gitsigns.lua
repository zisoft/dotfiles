return {
	"lewis6991/gitsigns.nvim",
  lazy = false,
  config = true,
	keys = {
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Gitsigns preview hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Gitsigns reset hunk" },
		{ "<leader>gb", "<cmd>Gitsigns blame<CR>", desc = "Gitsigns blame" },
		{ "<leader>hp", "<cmd>Gitsigns prev_hunk<CR>", desc = "Gitsigns previous hunk" },
		{ "<leader>hn", "<cmd>Gitsigns next_hunk<CR>", desc = "Gitsigns next hunk" },
	},
}
