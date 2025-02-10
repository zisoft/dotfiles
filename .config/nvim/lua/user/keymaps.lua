-- general
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Hide search mark" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>ls", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>bm", builtin.marks, { desc = "Telescope marks" })

-- gitsigns
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns preview hunk" })
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns reset hunk" })

-- neotree
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Neotree filesystem" })
vim.keymap.set("n", "<leader>tc", ":Neotree close<CR>", { desc = "Neotree close" })
vim.keymap.set("n", "<leader>tb", ":Neotree buffers<CR>", { desc = "Neotree buffers" })
vim.keymap.set("n", "<leader>to", ":Neotree document_symbols<CR>", { desc = "Neotree document symbols" })

