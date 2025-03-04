local formatters = {
  "csharpier",
  "clang-format",
  "prettier",
  "ktfmt",
  "jq",
  "xmlformatter",
  "gofumpt",
  "goimports",
  "rustywind",
  -- "trim_whitespace",
}

local function getUniqueLinters(lintersByLang)
  local unique_linters = {}
  local seen = {}

  for _, linters in pairs(lintersByLang) do
    for _, linter in ipairs(linters) do
      if not seen[linter] then
        seen[linter] = true
        table.insert(unique_linters, linter)
      end
    end
  end

  return unique_linters
end

local helpers = {}
helpers.lintersByLanguage = {
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
}


function helpers.getConfiguredLspNames()
  local lsp_path = vim.fn.stdpath("config") .. "/lsp/"
  local handle = vim.loop.fs_scandir(lsp_path)
  local lsps = {}

  if handle then
    while true do
      local name, t = vim.loop.fs_scandir_next(handle)
      if not name then break end

      if t == nil or name:match("%.lua$") then
        local cleanedName = string.gsub(name, '.lua', "")
        table.insert(lsps, cleanedName)
      end
    end
  end

  return lsps
end

function helpers.getAutoInstalledTools()
  return vim.tbl_flatten({
    formatters,
    helpers.getConfiguredLspNames(),
    getUniqueLinters(helpers.lintersByLanguage)
  })
end

function helpers.enableLsps()
  vim.lsp.config('*', { root_markers = { '.git' } })
  vim.lsp.enable(helpers.getConfiguredLspNames())
end

return helpers
