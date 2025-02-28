local registerProjectDapConfigs = require 'debugger.helpers'.registerProjectDapConfigs
local M = {}


local function insertWorkProjects(targetTable)
  local defaultDotnetVersion = "8.0"
  local pathConfigs = require 'work.dapConfigs'

  for _, config in ipairs(pathConfigs) do
    local basePath = config.basePath

    for _, project in ipairs(config.projects) do
      local relativePath = project.relativePath
      local exeName = relativePath:match("([^/]+)$")
      local dotnetVersion = project.dotnetVersion or defaultDotnetVersion

      local projectConfig = {
        project = basePath .. relativePath,
        exePath = basePath .. relativePath .. "/bin/Debug/net" .. dotnetVersion .. "/" .. exeName .. ".dll",
        name = exeName
      }

      table.insert(targetTable, projectConfig)
    end
  end
end

-- c# project configurations
local csProjects = {}
insertWorkProjects(csProjects)

M.cs = {}
registerProjectDapConfigs(csProjects, M.cs, "csharp")


return M
