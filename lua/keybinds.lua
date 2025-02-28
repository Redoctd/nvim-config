local function cmdWrap(action)
  return "<CMD>" .. action .. "<CR>"
end

local maps = {
  n = {
    -- -- Cursor centering
    -- { 'n',          'nzz' },
    -- { 'N',          'Nzz' },
    -- { '*',          '*zz' },
    -- { '#',          '#zz' },
    -- { 'g*',         'g*zz' },
    -- { 'g#',         'g#zz' },
    -- { '<Up>',       'kzz' },
    -- { '<Down>',     'jzz' },
    -- { '<Left>',     'hzz' },
    -- { '<Right>',    'lzz' },
    -- { '<C-u>',      '<C-u>zz' },
    -- { '<C-d>',      '<C-d>zz' },
    --
    -- Fix word wrap
    { 'k',          "v:count == 0 ? 'gk' : 'k'" },
    { 'j',          "v:count == 0 ? 'gj' : 'j'" },

    -- Diagnostics
    { '<leader>d',  vim.diagnostic.open_float,                'Open floating diagnostic message' },
    { '<leader>lq', vim.diagnostic.setloclist,                'Open diagnostics list' },

    -- File & Window Management
    { '<leader>e',  cmdWrap("lua MiniFiles.open()"),          'Open file explorer' },
    { '<leader>w',  cmdWrap("w"),                             'Write' },
    { '<leader>W',  cmdWrap("noautocmd w"),                   'Write w/o formatting' },
    { '<leader>h',  cmdWrap("noh"),                           'Clear highlights' },
    { '<leader>q',  cmdWrap("q") },
    { '<leader>gg', cmdWrap("LazyGit") },
    { '<leader>gb', cmdWrap("BlameToggle") },
    { '<S-l>',      cmdWrap("bn") },
    { '<S-h>',      cmdWrap("bp") },
    { '<leader>c',  cmdWrap("bd") },
    { '<leader>ws', cmdWrap("vsplit") },

    -- Window Navigation
    { '<C-l>',      cmdWrap("wincmd l") },
    { '<C-h>',      cmdWrap("wincmd h") },
    { '<C-k>',      cmdWrap("wincmd k") },
    { '<C-j>',      cmdWrap("wincmd j") },

    -- Markdown
    { '<leader>la', function() vim.lsp.buf.code_action() end, 'Lsp actions' },
    { '<leader>rn', function() vim.lsp.buf.rename() end,      'Rename' },


    -- Marks
    { '<leader>gm', cmdWrap("MarksListBuf"),                  'List buffer marks' },
    { '<leader>gM', cmdWrap("MarksListGlobal"),               'List global marks' },

    -- Misc
    { '<leader>tf', cmdWrap("ToggleFormatting"),              "Toggle formatting" },
    { '<leader>tt', cmdWrap("Trouble diagnostics"),           'Toggle trouble' },

    -- LSP
    { '<leader>D',  vim.diagnostic.setloclist,                'Set diagnostic loclist' },

    {
      'grh',
      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
      'Toggle inlays'
    },

    { "<leader>?",       function() Snacks.picker.recent() end,                                  "Find recently opened files" },
    { "<leader><space>", function() Snacks.picker.buffers() end,                                 "Find existing buffers" },
    { "<leader>f",       function() Snacks.picker.files() end,                                   "Search files" },
    { "<leader>st",      function() Snacks.picker.grep() end,                                    "Search text" },
    { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             "Search diagnostics" },
    { "<leader>sbd",     function() Snacks.picker.diagnostics_buffer() end,                      "Search buffer diagnostics" },
    { "<leader>sh",      function() Snacks.picker.search_history() end,                          "Search history" },
    { "<leader>sr",      function() Snacks.picker.resume() end,                                  "Search resume" },
    { "<leader>sc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, "Search config files" },
    { "<leader>gw",      function() Snacks.picker.projects() end,                                "Search workspaces" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                         "Command History" },
    { '<leader>nh',      function() Snacks.notifier.show_history() end,                          'Show Notifications' },



    { "<leader>/",       function() Snacks.picker.grep() end,                                    "Grep" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                         "Command History" },
    { "<leader>n",       function() Snacks.picker.notifications() end,                           "Notification History" },
    { "<leader>E",       function() Snacks.explorer() end,                                       "File Explorer" },

    -- Grep
    { '<leader>s"',      function() Snacks.picker.registers() end,                               "Registers" },
    { "<leader>sj",      function() Snacks.picker.jumps() end,                                   "Jumps" },
    { "<leader>sl",      function() Snacks.picker.loclist() end,                                 "Location List" },
    { "<leader>sm",      function() Snacks.picker.marks() end,                                   "Marks" },
    { "<leader>sM",      function() Snacks.picker.man() end,                                     "Man Pages" },
    { "<leader>sp",      function() Snacks.picker.lazy() end,                                    "Search for Plugin Spec" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,                                  "Quickfix List" },
    { "<leader>su",      function() Snacks.picker.undo() end,                                    "Undo History" },


    { "<leader>sb",      function() Snacks.picker.lines() end,                                   "Buffer Lines" },
    { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            "Grep Open Buffers" },

    -- Git integrations
    { "<leader>gb",      function() Snacks.picker.git_branches() end,                            "Git Branches" },
    { "<leader>gl",      function() Snacks.picker.git_log() end,                                 "Git Log" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,                              "Git Status" },
    { "<leader>gS",      function() Snacks.picker.git_stash() end,                               "Git Stash" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,                                "Git Diff (Hunks)" },

    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,                         "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,                        "Goto Declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,                          "References" },
    { "gI",              function() Snacks.picker.lsp_implementations() end,                     "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    "Goto T[y]pe Definition" },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             "LSP Symbols" },
    { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   "LSP Workspace Symbols" },
    -- Directory-based search mappings
    {
      "<leader>dst",
      function()
        local dir = vim.fn.input("Directory to grep: ", "", "dir")
        Snacks.picker.grep({ cwd = dir })
      end,
      "Grep in directory"
    },
    {
      "<leader>df",
      function()
        local dir = vim.fn.input("Directory to find files: ", "", "dir")
        Snacks.picker.files({ cwd = dir })
      end,
      "Find files in directory"
    },
  },
  v = {
    -- dont leave visual mode on indent
    { '<', '<gv' },
    { '>', '>gv' }
  }
}

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Apply mappings
for mode, binds in pairs(maps) do
  for _, bind in ipairs(binds) do
    local keys, command, desc = unpack(bind)
    vim.keymap.set(mode, keys, command, { desc = desc, noremap = true, silent = true })
  end
end
