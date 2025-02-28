local M = {}

M.coreclr = {
  type = "executable",
  command = "/usr/local/netcoredbg",
  args = { "--interpreter=vscode" },
}


return M
