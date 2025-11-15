vim.pack.add({ "https://github.com/rmagatti/auto-session" })

require("auto-session").setup({
  auto_save = false,
  auto_restore = false,
  lazy_support = false,
  suppressed_dirs = {},

  session_lens = {
    load_on_setup = false,
    previewer = false,
    mappings = {
      delete_session = { { "n", "i" }, "<C-x>" },
    },

    picker_opts = {
      preset = "select",
      preview = false,
      layout = {
        width = 0.5,
        height = 0.4,
      },
    },
  },

  post_restore_cmds = {
    function()
      if vim.fn.getcwd() == "/Users/mario/src/darktable" then
        vim.cmd("set makeprg=ninja\\ install\\ -C\\ ./build")
        vim.keymap.set("n", "<leader>db", "<cmd>!../debug_build.sh<CR>", { desc = "darktable debug build" })
      end
    end,
  },

})

vim.keymap.set("n", "<leader>ls", "<cmd>AutoSession search<cr>", { desc = "Session search" })
vim.keymap.set("n", "<leader>ss", "<cmd>AutoSession save<cr>", { desc = "Session save" })
vim.keymap.set("n", "<leader>sr", "<cmd>AutoSession restore<cr>", { desc = "Session restore" })
