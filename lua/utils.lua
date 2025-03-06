local M = {}
function M.BindKeyTableNormalMode(binds)
  for _, bind in ipairs(binds) do
    local keys, command, desc = unpack(bind)
    vim.keymap.set("n", keys, command, { desc = desc, noremap = true, silent = true })
  end
end

function M.log(object)
  vim.notify(vim.inspect(object))
end

return M
