return {
	{
		'kdheepak/lazygit.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},
	{ 'FabijanZulj/blame.nvim',    config = true },
	{ 'akinsho/git-conflict.nvim', config = true, version = "*" },
	{ 'sindrets/diffview.nvim',    config = true },
	{ 'lewis6991/gitsigns.nvim',   config = true },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		opts = {
			console_timeout = 0,
			auto_close_console = false,
		},
		config = true
	}
}
