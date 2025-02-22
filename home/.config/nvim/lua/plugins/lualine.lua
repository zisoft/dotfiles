return {
	"nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			theme = "catppuccin",
      globalstatus = true,
		},
		sections = {
			lualine_b = {
				"branch",
        "diff",
			},
			lualine_c = {
				{
					"filename",
					path = 4,
				},
				-- "buffers",
			},
			lualine_x = {
				"encoding",
				{
					"fileformat",
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "LF",
					},
				},
				"filetype",
			},
		},
	},
}
