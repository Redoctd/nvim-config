local pickers = require 'custom_pickers'

local function cmdWrap(action)
  return "<CMD>" .. action .. "<CR>"
end

local maps = {
  n = {
    -- Cursor centering
    { 'n',          'nzz' },
    { 'N',          'Nzz' },
    { '*',          '*zz' },
    { '#',          '#zz' },
    { 'g*',         'g*zz' },
    { 'g#',         'g#zz' },
    { '<Up>',       'kzz' },
    { '<Down>',     'jzz' },
    { '<Left>',     'hzz' },
    { '<Right>',    'lzz' },
    { '<C-u>',      '<C-u>zz' },
    { '<C-d>',      '<C-d>zz' },

    -- Fix word wrap
    { 'k',          "v:count == 0 ? 'gk' : 'k'" },
    { 'j',          "v:count == 0 ? 'gj' : 'j'" },

    -- Diagnostics
    { '[d',         vim.diagnostic.goto_prev,        'Go to previous diagnostic message' },
    { ']d',         vim.diagnostic.goto_next,        'Go to next diagnostic message' },
    { '<leader>d',  vim.diagnostic.open_float,       'Open floating diagnostic message' },
    { '<leader>lq', vim.diagnostic.setloclist,       'Open diagnostics list' },

    -- File & Window Management
    { '<leader>e',  cmdWrap("lua MiniFiles.open()"), 'Open file explorer' },
    { '<leader>w',  cmdWrap("w"),                    'Write' },
    { '<leader>W',  cmdWrap("noautocmd w"),          'Write w/o formatting' },
    { '<leader>h',  cmdWrap("noh"),                  'Clear highlights' },
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
    { '<C-m>',      cmdWrap("Markview splitToggle") },


    -- Marks
    { '<leader>gm', cmdWrap("MarksListBuf"),         'List buffer marks' },
    { '<leader>gM', cmdWrap("MarksListGlobal"),      'List global marks' },

    -- Misc
    { '<leader>tf', cmdWrap("ToggleFormatting"),     "Toggle formatting" },
    { '<leader>tt', cmdWrap("Trouble diagnostics"),  'Toggle trouble' },

    -- LSP
    { '<leader>D',  vim.diagnostic.setloclist,       'Set diagnostic loclist' },

    {

      'grh',
      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
      'Toggle inlays'
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
