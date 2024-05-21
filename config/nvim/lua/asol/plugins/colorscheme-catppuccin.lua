return {
  "catppuccin/nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
  },
  config = function()
    -- This code runs after the plugin is loaded
    vim.cmd.colorscheme("catppuccin")
  end
}
