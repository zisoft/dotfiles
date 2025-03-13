return {
	"lewis6991/gitsigns.nvim",
  lazy = false,
  config = true,
	keys = {
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Gitsigns preview hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Gitsigns reset hunk" },
		{ "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "Gitsigns blame" },
		{ "<leader>hp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Gitsigns previous hunk" },
		{ "<leader>hn", "<cmd>Gitsigns next_hunk<cr>", desc = "Gitsigns next hunk" },
	},
}
