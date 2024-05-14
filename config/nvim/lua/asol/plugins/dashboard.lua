return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        week_header = {
          enable = true,
        },
        center = {
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "New File",
            group = "Label",
            action = [[ene | startinser]],
            key = "n",
          },
          {
            desc = " Apps",
            group = "DiagnosticHint",
            action = "Lazy",
            key = "a",
          },
          {
            desc = " Mason",
            group = "DiagnosticHint",
            action = "Mason",
            key = "m",
          },
          {
            desc = "󰊳 Update",
            group = "@property",
            action = function()
              vim.cmd("Lazy update")
              vim.cmd("MasonToolsUpdate")
            end,
            key = "u"
          },
        },
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
