return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = "/Users/mario/.vscode/extensions/ms-vscode.cpptools-1.22.11-darwin-x64/debugAdapters/bin/OpenDebugAD7",
    }

    dap.configurations.cpp = {
      {
        name = "darktable master",
        type = "cppdbg",
        request = "launch",
        program = "${workspaceFolder}/build/macosx/bin/darktable",
        cwd = "${workspaceFolder}",
        args = {
          "--cachedir",
          "/Users/mario/src/darktable_test_data/cache",
          "--configdir",
          "/Users/mario/src/darktable_test_data/config",
          "-d",
          "common",
        },
        stopAtEntry = false,
        externalConsole = false,
        MIMode = "lldb",
        setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "enable pretty printing",
            ignoreFailures = false,
          },
        },
      },
      {
        name = "darktable develop",
        type = "cppdbg",
        request = "launch",
        program = "${workspaceFolder}/build/macosx/bin/darktable",
        cwd = "${workspaceFolder}",
        args = {
          "--cachedir",
          "/Users/mario/src/darktable_test_data2/cache",
          "--configdir",
          "/Users/mario/src/darktable_test_data2/config",
          "-d",
          "common",
        },
        stopAtEntry = false,
        externalConsole = false,
        MIMode = "lldb",
        setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "enable pretty printing",
            ignoreFailures = false,
          },
        },
      },
    }

    dap.configurations.c = dap.configurations.cpp

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<F5>", dap.continue, {})
    vim.keymap.set("n", "<F10>", dap.step_over, {})
    vim.keymap.set("n", "<F11>", dap.step_into, {})
    vim.keymap.set("n", "<F12>", dap.step_out, {})
    vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, {})
  end,
}
