vim.pack.add({"https://github.com/lewis6991/gitsigns.nvim"})

vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns preview hunk" })
vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>",   { desc = "Gitsigns reset hunk" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<CR>",        { desc = "Gitsigns blame" })
vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns prev_hunk<CR>",    { desc = "Gitsigns previous hunk" })
vim.keymap.set("n", "<leader>hn", "<cmd>Gitsigns next_hunk<CR>",    { desc = "Gitsigns next hunk" })

