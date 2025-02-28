if vim.fn.getcwd() == "/Users/mario/src/darktable" then
  vim.cmd("set makeprg=ninja\\ install\\ -C\\ ./build")

  vim.keymap.set("n", "<leader>mk", "<cmd>make<CR>", { desc = "call make command" })
  vim.keymap.set("n", "<leader>db", "<cmd>!../debug_build.sh<CR>", { desc = "darktable debug build" })
end
