vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesActionRename",
	callback = function(event)
		Snacks.rename.on_rename_file(event.data.from, event.data.to)
	end,
})

return {
	"folke/snacks.nvim",
	dependencies = { "natecraddock/workspaces.nvim" },
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = { enabled = true },
		notifier = {
			enabled = true,
			filter = function(notification)
				if notification.msg:match("You pressed .- key too soon!") or (notification.msg == "No information available") then
					return false
				end
				return true
			end

		},
		rename = { enabled = true },
		input = { enabled = true },
		statuscolumn = { enabled = true },
		explorer = { enabled = true },

		-- bigfile = {
		-- 	enabled = true,
		-- 	size = 15 * 1024 * 1024, -- 15MB
		-- },
		picker = {
			enabled = true,

			formatters = {
				file = {
					filename_first = false, -- display filename before the file path
					truncate = 900, -- truncate the file path to (roughly) this length
					filename_only = false, -- only show the filename
					icon_width = 2, -- width of the icon (in characters)
					git_status_hl = true, -- use the git status highlight group for the filename
				},
			},
			sources = {
				projects = {
					dev = { "~/HilmaAll/src", "~/HilmaAll/src/hilma-tendering", "~/HilmaAll/src/Hilma", "~/HilmaAll/src/espd", "~/.config", "~/HilmaAll" },
					patterns = {
						".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile",
						"**.csproj", "**.sln", "Cargo.toml", "go.mod", "init.lua", ".gitignore",
						"build.gradle", "build.gradle.kts", "pom.xml", "LICENSE", ".order" },
				},

				grep = {
					buffers = false,
				},
				buffers = {
					current = false
				}
			}
		},

	},

	keys = {
		{ "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
	}
}
