local registerProjectDapConfigs = require 'debugger.helpers'.registerProjectDapConfigs
local M = {}


local function insertHilmaProjects(targetTable)
  local defaultDotnetVersion = "8.0"

  local basePath = "/Users/tuukka/HilmaAll/src/"
  local hilmaProjects = {
    { relativePath = "Hilma/Hilma.Api" },
    { relativePath = "Hilma/ResourceExporter" },
  }

  for _, project in ipairs(hilmaProjects) do
    local relativePath = project.relativePath
    local exeName = relativePath:match("([^/]+)$") -- Get the last part of the path (project name)
    local dotnetVersion = project.dotnetVersion or defaultDotnetVersion


    local projectConfig = {
      project = basePath .. relativePath,
      exePath = basePath .. relativePath .. "/bin/Debug/net" .. dotnetVersion .. "/" .. exeName .. ".dll",
      name = exeName
    }

    table.insert(targetTable, projectConfig)
  end
end

-- c#
local csProjects = {}
insertHilmaProjects(csProjects)



M.cs = {}
registerProjectDapConfigs(csProjects, M.cs, "csharp")


return M
