return {
  "catppuccin/nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  name = "catppuccin",
  priority = 1000,
  opts = {
    term_colors = true,
    transparent_background = true,
  },
  config = function(_, opts)
    -- This code runs after the plugin is loaded
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end
}
