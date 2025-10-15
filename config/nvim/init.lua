require("vim-options")
require("lsp-config")

require("user.keymaps")

-- plugins
require("plugins.catppuccin")
require("plugins.nord")
require("plugins.oil")
require("plugins.treesitter")
require("plugins.auto-session")
require("plugins.mini")
require("plugins.snacks")
require("plugins.gitsigns")
require("plugins.debugging")
require("plugins.todo-comments")
require("plugins.snippets")
require("plugins.copilot")

require("plugins.blink")

-- require("plugins.tmux-navigator")
require("plugins.smart-splits")

vim.keymap.set("n", "<leader>pu", function() vim.pack.update() end, { desc = "Update packages" })

vim.cmd.colorscheme("catppuccin-frappe")
