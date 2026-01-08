vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
  layouts = {
    {
      position = "left",
      size = 50,
      elements = {
        { id = "scopes",      size = 0.55, },
        { id = "stacks",      size = 0.15, },
        { id = "watches",     size = 0.15, },
        { id = "breakpoints", size = 0.15, },
      },
    },
    {
      position = "bottom",
      size = 12,
      elements = {
        { id = "repl", size = 1.0, },
        -- { id = "console", size = 0.3, },  -- console is useless as all output goes to REPL
      },
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

vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = "#c6d0f5", bg = "#506373" })

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "♦️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapLogPoint", linehl = "DapStopped", numhl = "DapStopped" })

-- command '.hd' (hexdump) for REPL
-- usage: .hd <variable> <len>
-- <len> is optional and defaults to 4 (number of 16 byte rows)
local repl = require("dap.repl")
repl.commands = vim.tbl_extend("force", repl.commands, {
  custom_commands = {
    [".hd"] = function(text)
      local params = vim.split(text, " ")
      local addr = params[1]
      local len = params[2]
      len = 16 * (len or 4)
      dap.repl.execute("memory read -c " .. len .. " " .. addr)
    end,
  },
})

-- keymaps
vim.keymap.set("n", "<leader>r", dap.continue, { desc = "Debugger run/continue" })
vim.keymap.set("n", "<Down>", dap.step_over, { desc = "Debugger step over" })
vim.keymap.set("n", "<Right>", dap.step_into, { desc = "Debugger step into" })
vim.keymap.set("n", "<Left>", dap.step_out, { desc = "Debugger step out" })
vim.keymap.set("n", "<leader>t", dap.terminate, { desc = "Debugger terminate" })
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint" })
vim.keymap.set("n", "<leader>lp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Debugger set logpoint" })

vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "Debugger close debugger" })
vim.keymap.set("n", "<leader>di", dapui.eval, { desc = "Debugger eval variable" })
