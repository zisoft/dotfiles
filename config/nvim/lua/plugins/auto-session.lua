return {
  "rmagatti/auto-session",
  lazy = false,

  opts = {
    suppressed_dirs = {},
    auto_save = false,
    auto_restore = false,

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
          vim.keymap.set("n", "<leader>mk", "<cmd>make<CR>", { desc = "call make command" })
          vim.keymap.set("n", "<leader>db", "<cmd>!../debug_build.sh<CR>", { desc = "darktable debug build" })
        end
      end,
    },
  },

  keys = {
    { "<leader>ls", "<cmd>AutoSession search<cr>", desc = "Session search" },
    { "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Save session" },
    { "<leader>sr", "<cmd>AutoSession restore<cr>", desc = "Restore session" },
  },
}
