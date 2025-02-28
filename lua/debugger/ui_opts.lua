return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "nvim-neotest/nvim-nio" },
  opts = {
    icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
    layouts = {
      {
        elements = { {
          id = "scopes",
          size = 0.40
        }, {
          id = "breakpoints",
          size = 0.20
        }, {
          id = "stacks",
          size = 0.20
        }, {
          id = "watches",
          size = 0.20
        } },
        position = "left",
        size = 90
      }, {
      elements = { {
        id = "repl",
        size = 0.5
      }, {
        id = "console",
        size = 0.5
      } },
      position = "bottom",
      size = 40
    } },
  }
}
