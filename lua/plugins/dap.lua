-- If we're on mac we need to load netcoredbg plugin
local function macSetup()
	local arch = require("jit").arch

	if arch == "arm64" then
		return {
			"Cliffback/netcoredbg-macOS-arm64.nvim",
			dependencies = { "mfussenegger/nvim-dap" },
			config = function()
				require('netcoredbg-macOS-arm64').setup(require('dap'))
			end
		}
	end
	return nil
end

return {

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"igorlfs/nvim-dap-view",
				opts = {
					winbar = {
						default_section = "repl",
					},
					windows = {
						height = 50,
						terminal = {
							-- 'left'|'right': Terminal position in layout
							position = "right",
							hide = {},
							start_hidden = false,
						},
					}
				}
			},
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
			{
				"jay-babu/mason-nvim-dap.nvim",
				opts = { automatic_installation = true },
			},
			macSetup()
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
		end,
	},
}
