local helpers = {}

local function runBuild(path, type)
  local cmds = {
    csharp = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
  }

  vim.notify("Running build:\n" .. cmds[type])

  local f = os.execute(cmds[type])
  if f == 0 then
    vim.notify('\nBuild: ✔️ ')
  else
    vim.notify('\nBuild: ❌ (code: ' .. f .. ')')
  end
end

function helpers.getProjectConfig(projectConf, templateKey)
  local projectConfigTemplates = {
    -- csharp = {
    --   type = "coreclr",
    --   request = "launch",
    --   name = "Launch " .. projectConf.name,
    --   program = projectConf.exePath,
    --   -- program = function()
    --   --   runBuild(projectConf.projectPath, "csharp")
    --   --   vim.notify("Executing: " .. projectConf.exePath)
    --   --   return projectConf.exePath
    --   -- end,
    --   args = {},
    --   cwd = projectConf.projectPath,
    --   env = {
    --     ASPNETCORE_ENVIRONMENT = "Development",
    --     -- ASPNETCORE_URLS = "<https://localhost:5001>;<http://localhost:5000>"
    --   },
    --   console = 'integratedTerminal',
    -- },
    --
  }

  return projectConfigTemplates[templateKey]
end

function helpers.registerProjectDapConfigs(projectConfs, targetTable, templateKey)
  for _, projectConf in ipairs(projectConfs) do
    table.insert(targetTable, helpers.getProjectConfig(projectConf, templateKey))
  end
end

return helpers
