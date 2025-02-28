return {
  'navarasu/onedark.nvim',
  config = function()
    require('onedark').setup {
      style = 'deep',
      transparent = true, -- Show/hide background
    }
    require('onedark')
  end
}
