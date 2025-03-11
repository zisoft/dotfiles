return {
	"kdheepak/lazygit.nvim",
	lazy = false,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
	end,
}
