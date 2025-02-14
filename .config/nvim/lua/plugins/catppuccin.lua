return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			styles = {
				comments = { "italic" },
				conditionals = {},
			},
			integrations = {
        blink_cmp = true,
        mason = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
