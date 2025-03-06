return {
	'folke/noice.nvim',
	event = 'VeryLazy',
	opts = {
		lsp = {
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = false,
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false,
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	},
	dependencies = {
		'MunifTanjim/nui.nvim',
	},
	config = function()
		require('noice').setup {
			views = {
				cmdline_popup = {
					position = {
						row = '40%',
						col = '50%',
					},
					border = { style = "none", padding = { 1, 1 } },
					size = {
						width = '60',
						height = 'auto',
					},
					win_options = {
						winhighlight = { Normal = 'NormalFloat', FloatBorder = 'NormalFloat' },
					}
				},
			},
		}
	end,
}
