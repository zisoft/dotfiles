-- general
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear hilight on search with <Esc> in normal mode"})
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", { desc = "Exit terminal mode" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Telescope find word under cursor" })
vim.keymap.set("n", "<leader>ls", builtin.buffers, { desc = "Telescope list buffers" })
vim.keymap.set("n", "<leader>bm", builtin.marks, { desc = "Telescope (book) marks" })
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Telescope document symbols" })
vim.keymap.set("n", "<leader>?", builtin.keymaps, { desc = "Telescope keymaps" })

-- gitsigns
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns preview hunk" })
vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Gitsigns reset hunk" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<CR>", { desc = "Gitsigns blame" })
vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Gitsigns previous hunk" })
vim.keymap.set("n", "<leader>hn", "<cmd>Gitsigns next_hunk<CR>", { desc = "Gitsigns next hunk" })

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
vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Tmux NavigateLeft" })
vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Tmux NavigateRight" })
vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Tmux NavigateUp" })
vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Tmux NavigateRight" })
vim.keymap.set("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<CR>", { desc = "Tmux pNavigatePrevious" })

-- LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Oil: Open parent directory" })

-- todo-comments
vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<CR>", { desc = "Show Todo comments" })

-- neoclip
vim.keymap.set("n", "<leader>cb", "<cmd>Telescope neoclip<cr>", { desc = "neoclip Clipboard Manager" })

-- harpooon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon list" })
vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = "Navigate to file at posistion 1" })
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = "Navigate to file at posistion 2" })
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = "Navigate to file at posistion 3" })
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = "Navigate to file at posistion 4" })

