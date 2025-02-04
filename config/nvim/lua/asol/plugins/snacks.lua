local snacks_config = require("asol.snacks_config")
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = snacks_config.dashboard,
    dim = { enabled = true },
    git = { enabled = true },
    indent = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    toggle = { enabled = true },
    words = { enabled = true },
    notifier = snacks_config.notifier,
    notify = { enabled = true },
  },
  keys = snacks_config.keys,
  init = snacks_config.configuration,
}
