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
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
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
						row = 5,
						col = '50%',
					},
					size = {
						width = 'auto',
						height = 'auto',
					},
				},
				popupmenu = {
					relative = 'editor',
					position = {
						row = 8,
						col = '50%',
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = 'rounded',
						padding = { 0, 1 },
					},
					win_options = {
						-- winhighlight = { Normal = 'Normal', FloatBorder = 'NoiceCmdlinePopupBorder' },
					},
				},
			},
		}
	end,
}
