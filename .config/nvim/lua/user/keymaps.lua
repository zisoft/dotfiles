-- general
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear hilight on search with <Esc> in normal mode"})
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", { desc = "Exit terminal mode" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope [f]ind [f]iles" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope [l]ive [g]rep" })
vim.keymap.set("n", "<leader>ls", builtin.buffers, { desc = "Telescope [l]ist [b]uffers" })
vim.keymap.set("n", "<leader>bm", builtin.marks, { desc = "Telescope ([b]ook) [m]arks" })
vim.keymap.set("n", "<leader>?", builtin.keymaps, { desc = "Telescope keymaps" })

-- gitsigns
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns [p]review hunk" })
vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Gitsigns [r]eset hunk" })

-- neotree
vim.keymap.set("n", "<leader>tf", "<cmd>Neotree filesystem reveal left<CR>", { desc = "Neo[t]ree [f]ilesystem" })
vim.keymap.set("n", "<leader>tc", "<cmd>Neotree close<CR>", { desc = "Neo[t]ree [c]lose" })
vim.keymap.set("n", "<leader>tb", "<cmd>Neotree buffers<CR>", { desc = "Neo[t]ree [b]uffers" })
vim.keymap.set("n", "<leader>to", "<cmd>Neotree document_symbols<CR>", { desc = "Neo[t]ree document symbols ([o]utline)" })
vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<CR>", { desc = "Neo[t]ree [t]oggle" })

-- lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Lsp: lsp Hover" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Lsp: Goto declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Lsp: Goto definition" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp: Code action" })
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Lsp: Format buffer" })

-- debugging
local dap = require("dap")
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debugger continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debugger step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debugger step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debugger step out" })
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint" })
vim.keymap.set("n", "<leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Debugger set logpoint" })

local dapui = require("dapui")
vim.keymap.set("n", "<C-i>", dapui.eval, { desc = "Debugger eval variable" })
vim.keymap.set("n", "<leader>cd", dapui.close, { desc = "Debugger close debugger" })

-- tmux navigator
vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux NavigateLeft" })
vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux NavigateRight" })
vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux NavigateUp" })
vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux NavigateRight" })
vim.keymap.set("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Tmux pNavigatePrevious" })

-- LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Oil: Open parent directory" })

