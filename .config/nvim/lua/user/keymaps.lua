-- general
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear hilight on search with <Esc> in normal mode"})

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>ls", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>bm", builtin.marks, { desc = "Telescope marks" })

-- gitsigns
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns preview hunk" })
vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Gitsigns reset hunk" })

-- neotree
vim.keymap.set("n", "<C-n>", "<cmd>Neotree filesystem reveal left<CR>", { desc = "Neotree filesystem" })
vim.keymap.set("n", "<leader>tc", "<cmd>Neotree close<CR>", { desc = "Neotree close" })
vim.keymap.set("n", "<leader>tb", "<cmd>Neotree buffers<CR>", { desc = "Neotree buffers" })
vim.keymap.set("n", "<leader>to", "<cmd>Neotree document_symbols<CR>", { desc = "Neotree document symbols" })

-- completions
local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true, desc = "Snippet expand" })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true, desc = "Snippet next" })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true, desc = "Snippet previous" })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true, desc = "Snippet choice" })

-- lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Lsp: lsp Hover" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Lsp: Goto declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Lsp: Goto definition" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp: Code action" })
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Lsp: Format buffer" })

-- debugging
local dap = require("dap")
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debugger continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debugging step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debugging step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debugging step out" })
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Debugging toggle breakpoint" })
vim.keymap.set("n", "<leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Debugging set logpoint" })

local dapui = require("dapui")
vim.keymap.set("n", "<C-i>", dapui.eval, { desc = "Debugging eval variable" })
vim.keymap.set("n", "<leader>cd", dapui.close, { desc = "Debugging close debugger" })

-- tmux navigator
vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "TmuxNavigateLeft" })
vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "TmuxNavigateRight" })
vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "TmuxNavigateUp" })
vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "TmuxNavigateRight" })
vim.keymap.set("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "TmuxNavigatePrevious" })

-- LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
