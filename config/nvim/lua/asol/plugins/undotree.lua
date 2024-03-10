return {
  'mbbill/undotree',
  event = 'VimEnter',
  keys = {
    {
      "<leader>u",
      vim.cmd.UndotreeToggle,
      desc = "[U]ndooTree Toggle",
      mode = "n"
    },
  }
}
