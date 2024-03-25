-- Lazygit Implementation
vim.api.nvim_create_user_command(
  'Lazygit',
  function()
    local Terminal = require("FTerm")
    local lazygit = Terminal:new {
      cmd = "lazygit",
      hidden = true,
      dimensions = {
        border = "none",
        width = 1,
        height = 1,
      },
      on_open = function(_)
        vim.cmd "startinsert!"
      end,
      on_close = function(_) end,
      count = 99,
    }
    lazygit:toggle()
  end,
  { bang = true }
)

return {
  "numToStr/FTerm.nvim",
  lazy = false,
  border = 'double',
  dimensions  = {
    height = 0.9,
    width = 0.9,
  },
  keys = {
    { "<C-N>", '<CMD>lua require("FTerm").toggle()<CR>', mode = "n", desc = "Toggle FTerm" },
    { "<C-N>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t", desc = "Toggle FTerm" },
  }
}
