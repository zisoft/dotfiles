return {
  "echasnovski/mini.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  version = false,
  lazy = false,

  config = function()
    require("mini.ai").setup()
    require("mini.surround").setup()
    require("mini.pairs").setup()
    -- require("mini.sessions").setup({
    --   hooks = {
    --     post = {
    --       read = function()
    --         if vim.fn.getcwd() == "/Users/mario/src/darktable" then
    --           -- darktable session
    --           vim.cmd("set makeprg=ninja\\ install\\ -C\\ ./build")
    --           vim.keymap.set("n", "<leader>mk", "<cmd>make<CR>", { desc = "call make command" })
    --           vim.keymap.set("n", "<leader>db", "<cmd>!../debug_build.sh<CR>", { desc = "darktable debug build" })
    --           require("snacks").notify("darktable")
    --         end
    --       end,
    --     },
    --   },
    -- })
  end,

  keys = {
    -- mini.sessions
    -- { "<leader>ls", "<Cmd>lua MiniSessions.select('read')<CR>", desc = "List sessions" },
    -- {
    --   "<leader>ss",
    --   function()
    --     -- get last path component for the session name
    --     local Path = require("plenary.path")
    --     local cwd = Path:new(vim.fn["getcwd"]())
    --     local parts = cwd:_split()
    --     local session_name = parts[#parts]
    --     require("mini.sessions").write(session_name)
    --   end,
    --   desc = "Save session",
    -- },
  },
}
