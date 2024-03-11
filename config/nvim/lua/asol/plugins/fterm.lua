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
