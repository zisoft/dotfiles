return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  opts = {
    animate = {
      enabled = false,
    },
    options = {
      left = { size = 0.3 },
      bottom = { size = 0.25 },
    },
    left = {
      { ft = "dapui_scopes", size = { height = 0.45 }, title = " Scopes" },
      { ft = "dapui_watches", size = { height = 0.15 }, collapsed = true, title = " Watches" },
      { ft = "dapui_stacks", size = { height = 0.25 }, title = " Stacks" },
      { ft = "dapui_breakpoints", size = { height = 0.15 }, title = " Breakpoints" },
    },
    bottom = {
      { ft = "dapui_console", size = { width = 0.3 }, title = " Debug Console" },
      { ft = "dap-repl", size = { width = 0.7 }, title = " Debug REPL" },
    },
  },
}
