return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup({

			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.65,
						},
						{
							id = "breakpoints",
							size = 0.10,
						},
						{
							id = "stacks",
							size = 0.15,
						},
						{
							id = "watches",
							size = 0.10,
						},
					},
					position = "left",
					size = 40,
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "console",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 10,
				},
			},
		})

		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/Users/mario/.local/share/nvim/mason/bin/OpenDebugAD7",
		}

    vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapLogPoint', {text='♦️', texthl='', linehl='', numhl=''})

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
    vim.keymap.set("n", "<leader>cd", dapui.close, {})
	end,
}
