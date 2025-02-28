local function addListeners(dap, dapui)
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open({ reset = true })
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

local function setKeyBinds(dap, dapui)
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<F5>", dap.continue, vim.tbl_extend("force", { desc = "DAP Continue" }, opts))
	vim.keymap.set("n", "<F10>", dap.step_over, vim.tbl_extend("force", { desc = "DAP Step Over" }, opts))
	vim.keymap.set("n", "<F11>", dap.step_into, vim.tbl_extend("force", { desc = "DAP Step Into" }, opts))
	vim.keymap.set("n", "<F12>", dap.step_out, vim.tbl_extend("force", { desc = "DAP Step Out" }, opts))
	vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint,
		vim.tbl_extend("force", { desc = "Toggle Breakpoint" }, opts))
	vim.keymap.set("n", "leaderde", dapui.eval, vim.tbl_extend("force", { desc = "DAP eval " }, opts))
	vim.keymap.set("n", "<F7>", dapui.toggle, vim.tbl_extend("force", { desc = "Toggle DAP UI" }, opts))
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			opts = require 'debugger.ui_opts',
			dependencies = { "nvim-neotest/nvim-nio" },
		},
		{ "theHamsta/nvim-dap-virtual-text", opts = {} },
		{
			"jay-babu/mason-nvim-dap.nvim",
			opts = { automatic_installation = true },
		},
	},
	event = "VeryLazy",
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		addListeners(dap, dapui)
		setKeyBinds(dap, dapui)

		dap.adapters = require('debugger.adapters')
		dap.configurations = require('debugger.configs')
	end,

}
