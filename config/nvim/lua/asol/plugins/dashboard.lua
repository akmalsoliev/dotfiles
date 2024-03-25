local banner = {
  '  /$$$$$$        /$$                                                 /$$   ',
  ' /$$__  $$      | $$                                                | $$   ',
  '| $$  \\ $$      | $$   /$$       /$$$$$$/$$$$         /$$$$$$       | $$  ',
  '| $$$$$$$$      | $$  /$$/      | $$_  $$_  $$       |____  $$      | $$   ',
  '| $$__  $$      | $$$$$$/       | $$ \\ $$ \\ $$        /$$$$$$$      | $$ ',
  '| $$  | $$      | $$_  $$       | $$ | $$ | $$       /$$__  $$      | $$   ',
  '| $$  | $$      | $$ \\  $$      | $$ | $$ | $$      |  $$$$$$$      | $$  ',
  '|__/  |__/      |__/  \\__/      |__/ |__/ |__/       \\_______/      |__/ ',
  '                                                                           ',
}

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = "hyper",
      config = {
        header = banner,
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
