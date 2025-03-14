--{name, setupOptions?}
local modules = {
	{ "ai" },
	{ "comment" },
	{ "pairs" },
	{ "surround" },
	{ "bracketed" },
	{ "files" },
	{ "jump" },
	{ "jump2d",    { view = { dim = true, n_steps_ahead = 99 } } },
	{ "sessions" },
	{ "cursorword" },
	{ "icons" },
	-- { "snippets" },
	-- { "statusline" },
}
return {
	'echasnovski/mini.nvim',
	version = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		for _, module in ipairs(modules) do
			require('mini.' .. module[1]).setup(module[2])
		end
	end
}
