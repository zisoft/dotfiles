vim.pack.add({
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
})

-- Reusable function to register keymaps in different contexts
local function set_keymaps()
  vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>TmuxNavigateRight<cr>")

  print("keymaps set")

end

-- Register once globally
set_keymaps()

-- Re-register for terminal buffers to prevent literal command injection
vim.api.nvim_create_autocmd("TermOpen", {
  callback = set_keymaps,
})
