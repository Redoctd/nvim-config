return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    'lua',
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
  },
  settings = {
    Lua = {
      hint = { enable = true },
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
      },
      completion = { callSnippet = "Replace" },
    },
  },
}
