return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "typescript",
    "vue",
  },
  root_markers = { "package.json" },
  settings = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue", "javascriptreact", "typescriptreact" },
      },
    },
  },
}

-- clangd
-- csharp-language-server csharp_ls
-- css-lsp cssls
-- gopls
-- html-lsp html
-- json-lsp jsonls
-- kotlin-language-server kotlin_language_server
-- lua-language-server lua_ls
-- rust-analyzer rust_analyzer
-- tailwindcss-language-server tailwindcss
-- templ
-- typescript-language-server ts_ls
-- vetur-vls vuels
-- vue-language-server volar
-- zls
