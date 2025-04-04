return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},

	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			{ "MattiasMTS/cmp-dbee", dependencies = { "kndndrj/nvim-dbee" }, ft = "sql", opts = {} },
		},
		version = "*",

		---@module 'blink.cmp'
		---@diagnostic disable-next-line: undefined-doc-name
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			keymap = { preset = "super-tab" },

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "buffer", "snippets" },
				per_filetype = {
					sql = { "dbee", "buffer", "lsp" },
				},

				providers = {
					dbee = {
						name = "cmp-dbee",
						module = "blink.compat.source",
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
