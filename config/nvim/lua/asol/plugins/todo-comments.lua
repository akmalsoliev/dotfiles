return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { signs = false },
  search = {
    pattern = {
      [[\b(KEYWORDS):]],
      [[\b(KEYWORDS)\s*\(@[^)]+\):]],
    },
  },
}
