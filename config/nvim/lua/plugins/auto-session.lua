return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		suppressed_dirs = {},
		auto_save = false,
		auto_restore = false,
		session_lens = {
			load_on_setup = true,
			previewer = false,
			mappings = {
				-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
				delete_session = { "i", "<C-D>" },
				alternate_session = { "i", "<C-S>" },
				copy_session = { "i", "<C-Y>" },
			},
			-- Can also set some Telescope picker options
			-- For all options, see: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
			theme_conf = {
				border = true,
				-- layout_config = {
				--   width = 0.8, -- Can set width and height as percent of window
				--   height = 0.5,
				-- },
			},
		},
	},

	config = function()
		require("auto-session").setup({
			post_restore_cmds = {
				function()
					if vim.fn.getcwd() == "/Users/mario/src/darktable" then
						vim.cmd("set makeprg=ninja\\ install\\ -C\\ ./build")

						vim.keymap.set("n", "<leader>mk", "<cmd>make<CR>", { desc = "call make command" })
						vim.keymap.set(
							"n",
							"<leader>db",
							"<cmd>!../debug_build.sh<CR>",
							{ desc = "darktable debug build" }
						)
					else
						vim.keymap.del("n", "<leader>mk")
						vim.keymap.del("n", "<leader>db")
					end
				end,
			},
		})
	end,

	keys = {
		{ "<leader>ls", "<cmd>SessionSearch<cr>", desc = "Session search" },
		{ "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save session" },
		{ "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore session" },
	},
}
