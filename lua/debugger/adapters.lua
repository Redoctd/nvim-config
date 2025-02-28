local M = {}

M.coreclr = {
  type = "executable",
  -- command = "/usr/local/netcoredbg",
  command = "netcoredbg",
  args = { "--interpreter=vscode" },
}


return M
