local M = {}

local function getAdapterPath(name)
  local home = vim.fn.expand("~")
  return home .. "/.local/share/nvim/mason/bin/" .. name
end


return M
