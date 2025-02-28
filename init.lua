require 'options'
require 'config.lazy'
require 'diagnostics'

require 'user_commands'
require 'keybinds'

require 'lsp-helpers'.enableLsps()

vim.api.nvim_set_hl(0, 'StatusLine', { fg = 'orange' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'orange' })
vim.api.nvim_set_hl(0, 'MarkSignNumHL', { fg = '' })

-- vim: ts=2 sts=2 sw=2 et
