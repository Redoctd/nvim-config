return {
  'sainnhe/gruvbox-material',
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_transparent_background = 0
    vim.g.gruvbox_material_ui_contrast = 'high'
    vim.g.gruvbox_material_foreground = 'mix'
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_visual = 'reverse'
    vim.g.gruvbox_material_menu_selection_background = 'orange'
    vim.g.gruvbox_material_inlay_hints_background = 'dim'

    vim.g.gruvbox_material_colors_override = {
      -- Base backgrounds
      bg0 = { '#000001', '16' },  -- Pure black
      bg1 = { '#080808', '232' }, -- Slightly lighter
      bg2 = { '#101010', '233' }, -- Base background
      bg3 = { '#181818', '234' }, -- Slightly lighter
      bg4 = { '#202020', '235' }, -- Even lighter
      bg5 = { '#282828', '236' }, -- Lightest background

      -- Interface elements
      bg_statusline1 = { '#101010', '233' },
      bg_statusline2 = { '#181818', '234' },
      bg_statusline3 = { '#202020', '235' },
      bg_current_word = { '#181818', '234' },

      -- Visual modes
      bg_visual_green = { '#1a2a1a', '22' },
      bg_visual_red = { '#2a1a1a', '52' },
      bg_visual_blue = { '#1a2a2a', '17' },
      bg_visual_yellow = { '#2a200a', '94' },

      -- Diff backgrounds
      bg_diff_green = { '#0a200a', '22' },
      bg_diff_red = { '#200a0a', '52' },
      bg_diff_blue = { '#0a1a20', '17' }
    }

    vim.cmd.colorscheme 'gruvbox-material'
  end,

}
