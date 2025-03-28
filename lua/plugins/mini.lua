--{name, setupOptions?}
local modules = {
	{ "ai" },
	{ "comment" },
	{ "pairs" },
	{ "surround", { mappings = { update_n_lines = "sl" } } },
	{ "bracketed" },
	{ "files" },
	{ "jump" },
	{
		"jump2d",
		{
			view = { n_steps_ahead = 0 },
			mappings = { start_jumping = "<leader><CR>" },
		},
	},
	{ "sessions" },
	{ "cursorword" },
	{ "icons" },
	-- { "snippets" },
	-- { "statusline" },
}
return {
	"echasnovski/mini.nvim",
	version = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		for _, module in ipairs(modules) do
			require("mini." .. module[1]).setup(module[2])
		end
	end,
}
