return {
  cmd = { 'vue-language-server', '--stdio', '--log-level', '4', '--log-file', '/tmp/volar.log' },
  filetypes = { 'vue' },
  root_markers = { 'package.json' },
}
