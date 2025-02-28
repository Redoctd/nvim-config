local lspHelpers = require 'lsp-helpers'
return {
  "williamboman/mason.nvim",
  config = true,
  dependencies = {
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = lspHelpers.getAutoInstalledTools(),
        integrations = {
          ['mason-lspconfig'] = false,
          ['mason-null-ls'] = false,
        }
      }
    }
  }
}
