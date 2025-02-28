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
		notifier = { enabled = true },
		rename = { enabled = true },
		statuscolumn = { enabled = true },
		projects = { enabled = true },
		input = { enabled = true },

		bigfile = {
			enabled = true,
			size = 15 * 1024 * 1024, -- 15MB
		},
		picker = {
			enabled = true,

			projects = {
				dev = { "~/HilmaAll/src", "~/HilmaAll/src/hilma-tendering", "~/HilmaAll/src/Hilma", "~/HilmaAll/src/espd", "~/.config", "~/HilmaAll" },
				patterns = {
					".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile",
					".csproj", ".sln", "Cargo.toml", "go.mod", "init.lua", ".gitignore",
					"build.gradle", "build.gradle.kts", "pom.xml", "LICENSE", ".order" },
			},
			buffers = {
				current = false
			}
		},
	},

	keys = {
		{ "<leader>?",       function() Snacks.picker.recent() end,                                  desc = "Find recently opened files" },
		{ "<leader><space>", function() Snacks.picker.buffers() end,                                 desc = "Find existing buffers" },
		{ "<leader>f",       function() Snacks.picker.files() end,                                   desc = "Search files" },
		{ "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Search current word",       mode = { "n", "x" } },
		{ "<leader>st",      function() Snacks.picker.grep() end,                                    desc = "Search text" },
		{ "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Search diagnostics" },
		{ "<leader>sbd",     function() Snacks.picker.diagnostics_buffer() end,                      desc = "Search buffer diagnostics" },
		{ "<leader>sh",      function() Snacks.picker.search_history() end,                          desc = "Search history" },
		{ "<leader>sr",      function() Snacks.picker.resume() end,                                  desc = "Search resume" },
		{ "<leader>sc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Search config files" },
		{ "<leader>gw",      function() Snacks.picker.projects() end,                                desc = "Search workspaces" },
		{ "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
		{ '<leader>nh',      function() Snacks.notifier.show_history() end,                          desc = 'Show Notifications' },



		{ "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
		{ "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
		{ "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
		{ "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },

		-- Grep
		{ '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
		{ "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
		{ "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
		{ "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
		{ "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
		{ "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
		{ "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
		{ "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },


		{ "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
		{ "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
		{ "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word",  mode = { "n", "x" } },

		-- Git integrations
		{ "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
		{ "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
		{ "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
		{ "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
		{ "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },

		-- LSP
		{ "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
		{ "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
		{ "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                      desc = "References" },
		{ "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
		{ "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
		{ "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
		{ "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
		-- Directory-based search mappings
		{
			"<leader>dst",
			function()
				local dir = vim.fn.input("Directory to grep: ", "", "dir")
				Snacks.picker.grep({ cwd = dir })
			end,
			desc = "Grep in directory"
		},
		{
			"<leader>df",
			function()
				local dir = vim.fn.input("Directory to find files: ", "", "dir")
				Snacks.picker.files({ cwd = dir })
			end,
			desc = "Find files in directory"
		},
	}
}
