return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "scopes",      size = 0.65 },
            { id = "breakpoints", size = 0.10 },
            { id = "stacks",      size = 0.15 },
            { id = "watches",     size = 0.10 },
          },
          position = "left",
          size = 60,
        },
        {
          elements = {
            { id = "repl",    size = 0.5 },
            { id = "console", size = 0.5 },
          },
          position = "bottom",
          size = 10,
        },
      },
    })

    require("nvim-dap-virtual-text").setup({
      highlight_changed_variables = true,
      show_stop_reason = true,
    })

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = "/Users/mario/.local/share/nvim/mason/bin/OpenDebugAD7",
    }

    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#c6d0f5", bg = "#506373" })

    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "♦️", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapLogPoint", linehl = "DapStopped", numhl = "" })

    dap.defaults.fallback.exception_breakpoints = { "raised", "uncaught" }

    dap.listeners.before.attach.dapui_config = function()
      dap.set_exception_breakpoints({ "raised", "uncaught" })
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dap.set_exception_breakpoints({ "raised", "uncaught" })
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.defaults.fallback.exception_breakpoints = { "uncaught", "raised" }

    -- keymaps
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debugger continue" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debugger step over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debugger step into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debugger step out" })
    vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint" })
    vim.keymap.set("n", "<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "Debugger set logpoint" })

    vim.keymap.set("n", "<C-i>", dapui.eval, { desc = "Debugger eval variable" })
    vim.keymap.set("n", "<leader>cd", dapui.close, { desc = "Debugger close debugger" })
  end,
}
