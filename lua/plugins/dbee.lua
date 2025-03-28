local dbSecrets = require("work.dbSecrets")

local function getLocalConnectionString(name)
	return string.format(
		"jdbc:sqlserver://127.0.0.1:1433;database=%s;databaseName=%s;initialCatalog=%s;user=%s;password=%s;trustServerCertificate=true;",
		name,
		name,
		name,
		dbSecrets.localUser,
		dbSecrets.localPassword
	)
end

return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},

	build = function()
		vim.notify(getLocalConnectionString("hilma"))
		require("dbee").install()
	end,
	config = function()
		require("dbee").setup({
			sources = {
				require("dbee.sources").MemorySource:new({
					{
						id = "local-hilma",
						name = "LOCAL-HILMA",
						type = "sqlserver",
						url = getLocalConnectionString("hilma"),
					},
					{
						id = "local-espd",
						name = "LOCAL-ESPD",
						type = "sqlserver",
						url = getLocalConnectionString("espd"),
					},
					{
						id = "local-tendering",
						name = "LOCAL-TENDERING",
						type = "sqlserver",
						url = getLocalConnectionString("tendering"),
					},
				}),
			},
		})
	end,
}
