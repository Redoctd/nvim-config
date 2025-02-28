return {
	'm4xshen/hardtime.nvim',
	config = true,
	opts = {
		disabled_keys = {
			["<Up>"] = {},
			["<Down>"] = {},
			["<Left>"] = {},
			["<Right>"] = {},
		},
		restricted_keys = {
			["<Up>"] = { "n", "x" },
			["<Down>"] = { "n", "x" },
			["<Left>"] = { "n", "x" },
			["<Right>"] = { "n", "x" },
		}
	}
}
