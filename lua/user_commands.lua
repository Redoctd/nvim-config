vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldmethod = 'expr'
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})

vim.api.nvim_create_autocmd('LspDetach', { command = 'setl foldexpr<' })
-- Toggle for formatting on save
local function toggle_autoformat(args)
  if args.bang then
    vim.b.disable_autoformat = not vim.b.disable_autoformat
    if vim.b.disable_autoformat == true then
      vim.notify 'Disabled Formatting for buffer.'
    else
      vim.notify 'Enabled Formatting for buffer.'
    end
  else
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    if vim.g.disable_autoformat == true then
      vim.notify 'Disabled Formatting.'
    else
      vim.notify 'Enabled Formatting.'
    end
  end
end

vim.api.nvim_create_user_command('ToggleFormatting', toggle_autoformat, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})


-- Briefly highlight selection when yanking
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
