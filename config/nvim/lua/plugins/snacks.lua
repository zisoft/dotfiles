---@diagnostic disable: undefined-global
vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  indent = { enabled = true, animate = { enabled = false } },
  lazygit = { enabled = true, win = { position = "float" } },
  notifier = { enabled = true },
  -- terminal = { enabled = true, win = { position = "right" } },

  statuscolumn = {
    enabled = true,
    folds = { open = true, },
  },

  picker = { enabled = true, },

  styles = {
    notification = { wo = { wrap = true } },
    notification_history = { width = 0.8, wo = { wrap = true } },
  },

})

vim.keymap.set("n", "<leader>n", function() Snacks.notifier.show_history() end, { desc = "Notification History" })

-- find
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep({ exclude = { "*.po" } }) end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })

-- search
vim.keymap.set("n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
vim.keymap.set("n", '<leader>s/', function() Snacks.picker.search_history() end, { desc = "Search History" })
vim.keymap.set("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>so", function() Snacks.picker.lsp_symbols() end, { desc = "LSP symbols" })

-- gh cli
vim.keymap.set("n", "<leader>ghi", function() Snacks.picker.gh_issue() end, { desc = "GitHub Issues (open)" })
vim.keymap.set("n", "<leader>ghI", function() Snacks.picker.gh_issue({ state = "all" }) end, { desc = "GitHub Issues (all)" })
vim.keymap.set("n", "<leader>ghp", function() Snacks.picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" })
vim.keymap.set("n", "<leader>ghP", function() Snacks.picker.gh_pr({ state = "all" }) end, { desc = "GitHub Pull Requests (all)" })

 -- lazygit
vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit() end, { desc = "LazyGit" })

-- terminal
-- vim.keymap.set("n", "<C-T>", function() Snacks.terminal.open() end, { desc = "Terminal" })
-- vim.keymap.set("t", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Terminal" })
-- vim.keymap.set("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Terminal" })
-- vim.keymap.set("t", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Terminal" })
-- vim.keymap.set("t", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Terminal" })
