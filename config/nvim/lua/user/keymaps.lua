-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")

-- general
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear hilight on search with <Esc> in normal mode" })
vim.keymap.set("n", "<leader>mk", "<cmd>make<CR>", { desc = "call make command" })
