return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    indent = { enabled = true, animate = { enabled = false } },
    image = { enabled = true },
    lazygit = { enabled = true, win = { position = "float" } },
    notifier = { enabled = true },
    picker = { enabled = true },
    terminal = { enabled = true, win = { position = "right" } },

    styles = {
      notification = { wo = { wrap = true } },
      notification_history = { wo = { wrap = true } },
    },
  },

  keys = {
    { "<leader>n", function() Snacks.picker.notifications({ layout = "ivy_split", }) end, desc = "Notification History" },

    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

    -- search
    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
    { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>sh", function() Snacks.picker.help({ layout = "ivy_split" }) end, desc = "Help Pages" },
    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },

    -- lazygit
    { "<leader>lg", function() Snacks.lazygit() end, desc = "LazyGit", },

    -- terminal
    { "<C-T>", function() Snacks.terminal.open() end, desc = "Terminal", },
    { mode = "t", "<C-h>", "<Cmd>wincmd h<CR>", desc = "Terminal" },
    { mode = "t", "<C-j>", "<Cmd>wincmd j<CR>", desc = "Terminal" },
    { mode = "t", "<C-k>", "<Cmd>wincmd k<CR>", desc = "Terminal" },
    { mode = "t", "<C-l>", "<Cmd>wincmd l<CR>", desc = "Terminal" },
  },
}
