return {
	'nvim-lualine/lualine.nvim',
	config = true,
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		sections = {
			lualine_c = {
				{
					"filename",
					path = 1,
				}


			},
			lualine_x = { 'filetype' },
			lualine_y = {},
		}
	}
}
