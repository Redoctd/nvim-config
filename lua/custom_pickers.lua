local pickers = {}

function pickers.search_config_files()
  require('snacks.picker').find_files({ cwd = vim.fn.stdpath('~/.config/nvim') })
end

function pickers.search_workspaces()
  require('snacks.picker').find_files({ cwd = vim.fn.stdpath('data') .. '/workspaces' })
end

function pickers.grep_in_dir()
  require('snacks.picker').live_grep({ cwd = vim.fn.expand('%:p:h') })
end

function pickers.find_files_in_dir()
  require('snacks.picker').find_files({ cwd = vim.fn.expand('%:p:h') })
end

return pickers
