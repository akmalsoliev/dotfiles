-- General Function for a full screen application

local function term_app(
  app_name -- name of a cmd applicaiton, i.e. `brew`, `lazygit` and others.
)
  local first_letter = string.upper(string.sub(app_name, 1, 1))
  local user_command = first_letter .. string.sub(app_name, 2, -1)
  vim.api.nvim_create_user_command(user_command, function()
    local Terminal = require("FTerm")
    local lazygit = Terminal:new({
      cmd = app_name,
      hidden = true,
      dimensions = {
        border = "none",
        width = 1,
        height = 1,
      },
      on_open = function(_)
        vim.cmd("startinsert!")
      end,
      on_close = function(_) end,
      count = 99,
    })
    lazygit:toggle()
  end, { bang = true })
end

term_app("lazygit")
term_app("glow")

return {
  "numToStr/FTerm.nvim",
  lazy = false,
  border = "double",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
  keys = {
    { "<C-N>", '<CMD>lua require("FTerm").toggle()<CR>', mode = "n", desc = "Toggle FTerm" },
    { "<C-N>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t", desc = "Toggle FTerm" },
    { "<leader>lg", "<CMD>Lazygit<CR>", mode = "n", desc = "[L]azy [G]it" },
    { "<leader>gl", "<CMD>Glow<CR>", mode = "n", desc = "[g][l]ow" },
  },
}
