return {

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "igorlfs/nvim-dap-view",           opts = {} },
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
			{
				"jay-babu/mason-nvim-dap.nvim",
				opts = { automatic_installation = true },
			},
		},
		event = "VeryLazy",
		config = function()
			local dap = require("dap")

			local function openScopes()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes, { border = "rounded" })
			end
			local binds = {
				{ "<F5>",        dap.continue,                                     "DAP continue" },
				{ "<F10>",       dap.step_over,                                    "DAP Step Over" },
				{ "<F11>",       dap.step_into,                                    "DAP Step Into" },
				{ "<F12>",       dap.step_out,                                     "DAP Step Out" },
				{ "<leader>b",   dap.toggle_breakpoint,                            "DAP Breakpoint" },
				{ "<leader>de",  function() require("dap.ui.widgets").hover() end, "DAP Eval" },
				{ "<F7>",        function() vim.cmd('DapViewToggle') end,          "DAP View Toggle" },
				{ "<leader>dvv", openScopes,                                       "DAP Toggle Var View" },
			}

			local utils = require 'utils'
			utils.BindKeyTableNormalMode(binds)

			dap.adapters = require('debugger.adapters')
			dap.configurations = require('debugger.configs')

			require 'utils'.log(dap)
		end,
	},
	{
		{
			"Cliffback/netcoredbg-macOS-arm64.nvim",
			dependencies = { "mfussenegger/nvim-dap" },
			config = function()
				require('netcoredbg-macOS-arm64').setup(require('dap'))
			end
		}
	}
}
