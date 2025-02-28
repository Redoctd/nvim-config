return {
  server_configs = {
    xmlformatter = { 'xml' },

    kotlin_language_server = { 'kotlin', 'kt' },
    gopls = { filetypes = { 'go', 'templ' } },
    templ = { filetypes = { 'templ' } },
    rust_analyzer = { check = { command = 'clippy' } },
    volar = { filetypes = { 'vue' } },
    vuels = { filetypes = { 'vue' } },
    html = { filetypes = { 'html', 'templ' } },
    tailwindcss = { filetypes = { 'html', 'vue' } },
    clangd = { filetypes = { 'c', 'h', 'c++', 'cpp', 'hpp' }, capabilities = { offsetEncoding = 'utf-8' } },
    -- omnisharp = { filetypes = { 'cs', 'csharp', 'c#' } },
    csharp_ls = { filetypes = { 'cs', 'csharp', 'c#' } },

    jsonls = { filetypes = { 'json' } },
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
}
