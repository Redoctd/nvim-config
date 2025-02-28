return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'
    conform.setup {
      formatters_by_ft = {
        xml = { "xmlformatter" },
        kotlin = { "ktfmt" },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        vue = { 'prettier' },
        tailwind = { 'rustywind' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
        rust = { 'rustfmt' },
        go = { 'goimports', 'gofmt' },
        ['_'] = { 'trim_whitespace' }
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 2000,
      }
    }
  end,
}
