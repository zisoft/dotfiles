vim.pack.add({
  { src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("CopilotChat").setup({
  model = 'gpt-4.1', -- AI model to use
  temperature = 0.1, -- Lower = focused, higher = creative
  {
    window = {
      layout = 'float',
      width = 80,         -- Fixed width in columns
      height = 20,        -- Fixed height in rows
      border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
      title = '🤖 AI Assistant',
      zindex = 100,       -- Ensure window stays on top
    },

    headers = {
      user = '👤 You',
      assistant = '🤖 Copilot',
      tool = '🔧 Tool',
    },

    separator = '━━',
    auto_fold = true, -- Automatically folds non-assistant messages
  },

  auto_insert_mode = true, -- Enter insert mode when opening
})

vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<cr>", { desc = "Copilot Chat" })
vim.keymap.set("n", "<leader>cr", "<cmd>CopilotChatReset<cr>", { desc = "Copilot Chat Reset" })

