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
            { id = "scopes", size = 0.65 },
            { id = "breakpoints", size = 0.10 },
            { id = "stacks", size = 0.15 },
            { id = "watches", size = 0.10 },
          },
          position = "left",
          size = 60,
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
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

    dap.adapters.lldb = {
      name = "lldb",
      type = "executable",
      command = "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap",
    }

    dap.configurations.cpp = {
      {
        name = "darktable",
        type = "lldb",
        request = "launch",
        program = "${workspaceFolder}/build/macosx/bin/darktable",
        args = {
          "--configdir",
          "/Users/mario/src/darktable_test_data/config",
          "--cachedir",
          "/Users/mario/src/darktable_test_data/cache",
          "-d",
          "common",
        },
        cwd = "${workspaceFolder}",
        stopAtEntry = false,

        -- Add setupCommands for exception breakpoints
        setupCommands = {
          {
            text = "-break-exception-catch",
            description = "Catch all exceptions",
            ignoreFailures = false,
          },
        },
      },

      {
        name = "darktable CLI",
        type = "lldb",
        request = "launch",
        program = "${workspaceFolder}/build/macosx/bin/darktable-cli",
        args = {
          "/Users/mario/TestPics/",
          "/Users/mario",
          "--core",
          "--configdir",
          "/Users/mario/src/darktable_test_data/config",
          "--cachedir",
          "/Users/mario/src/darktable_test_data/cache",
          "-d",
          "common",
        },
        cwd = "${workspaceFolder}",
        stopAtEntry = false,

        -- Add setupCommands for exception breakpoints
        setupCommands = {
          {
            text = "-break-exception-catch",
            description = "Catch all exceptions",
            ignoreFailures = false,
          },
        },
      },
    }

    dap.configurations.c = dap.configurations.cpp

    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#c6d0f5", bg = "#506373" })

    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "♦️", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapLogPoint", linehl = "DapStopped", numhl = "" })

    dap.listeners.before.attach.dapui_config = function()
      dap.set_exception_breakpoints({ "always" })
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dap.set_exception_breakpoints({ "always" })
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    local repl = require("dap.repl")
    repl.commands = vim.tbl_extend("force", repl.commands, {
      custom_commands = {
        [".hexdump"] = function(text)
          dap.repl.execute("`memory read -c 64 " .. text)
        end,
      },
    })

    -- keymaps
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debugger run/continue" })
    vim.keymap.set("n", "<Down>", dap.step_over, { desc = "Debugger step over" })
    vim.keymap.set("n", "<Right>", dap.step_into, { desc = "Debugger step into" })
    vim.keymap.set("n", "<Left>", dap.step_out, { desc = "Debugger step out" })
    vim.keymap.set("n", "<F12>", dap.terminate, { desc = "Debugger terminate session" })
    vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint" })
    vim.keymap.set("n", "<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "Debugger set logpoint" })

    vim.keymap.set("n", "<C-i>", dapui.eval, { desc = "Debugger eval variable" })
    vim.keymap.set("n", "<leader>cd", dapui.close, { desc = "Debugger close debugger" })
  end,
}
