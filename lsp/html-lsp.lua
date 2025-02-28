return {
  cmd = { 'vscode-html-language-server', '--stdio' },
  root_markers = { 'package.json' },
  filetypes = { 'html', 'templ' },
}
-- default_config = {
--   cmd = { 'vscode-html-language-server', '--stdio' },
--   root_dir = util.root_pattern('package.json', '.git'),
--   single_file_support = true,
--   settings = {},
--   init_options = {
--     provideFormatter = true,
--     embeddedLanguages = { css = true, javascript = true },
--     configurationSection = { 'html', 'css', 'javascript' },
--   },
-- },
