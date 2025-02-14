return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"folke/lazydev.nvim",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		-- require("lazydev").setup({
		--   library = { "nvim-dap-ui" },
		-- })

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
	end,
}
