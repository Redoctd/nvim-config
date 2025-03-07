-- overseer.lua
return {
	"stevearc/overseer.nvim",
	opts = {},
	config = function()
		local home = vim.fn.expand('~')
		require("overseer").setup()

		-- Task to build the project in the current directory
		require("overseer").register_template({
			name = "Build C# Project",
			builder = function()
				return {
					cmd = { "dotnet" },
					args = { "build" },
					cwd = vim.fn.getcwd(),
				}
			end,
		})


		-- name = "Restart Aspire",
		require("overseer").register_template(require('work.overeer_templates.aspire'))
	end,
}
