return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = {
    styles = {
      transparency = true,
    }
  },
  config = function()
    vim.cmd.colorscheme 'rose-pine'
  end
}
