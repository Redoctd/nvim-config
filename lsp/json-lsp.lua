return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  root_markers = { 'package.json' },
  settings = {
    single_file_support = true,
  }
}
