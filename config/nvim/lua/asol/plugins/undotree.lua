return {
  'mbbill/undotree',
  event = 'VimEnter',
  keys = {
    {
      "<leader>ut",
      vim.cmd.UndotreeToggle,
      desc = "[U]ndooTree Toggle",
      mode = "n"
    },
  }
}
