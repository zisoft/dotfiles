return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    indent = { enabled = true, animate = { enabled = false } },
    image = { enabled = true },
    lazygit = { enabled = true, win = { position = "float" } },
    notifier = { enabled = true },
    terminal = { enabled = true, win = { position = "right" } },

    styles = {
      notification = { wo = { wrap = true }, },
      notification_history = { wo = { wrap = true }, },
    },
  },

  keys = {
    -- lazygit
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "LazyGit",
    },

    -- notifier
    {
      mode = "n",
      "<leader>nh",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification history",
    },

    -- terminal
    {
      "<C-T>",
      function()
        Snacks.terminal.open()
      end,
      desc = "Terminal",
    },
    { mode = "t", "<C-h>", "<Cmd>wincmd h<CR>", desc = "Terminal" },
    { mode = "t", "<C-j>", "<Cmd>wincmd j<CR>", desc = "Terminal" },
    { mode = "t", "<C-k>", "<Cmd>wincmd k<CR>", desc = "Terminal" },
    { mode = "t", "<C-l>", "<Cmd>wincmd l<CR>", desc = "Terminal" },
  },
}
