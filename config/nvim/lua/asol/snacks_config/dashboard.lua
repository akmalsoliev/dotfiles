return {
  enabled = true,
  preset = {
    ---@type snacks.dashboard.Item[]
    keys = {
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      {
        icon = " ",
        key = "c",
        desc = "Config",
        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
      },
      { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      {
        key = "u",
        icon = "󰊳 ",
        desc = "Update",
        action = function()
          vim.cmd("Lazy update")
          vim.cmd("MasonToolsUpdate")
          vim.fn.system("uv tool upgrade --all")
          print("Updating")
        end,
      },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
  },
}
