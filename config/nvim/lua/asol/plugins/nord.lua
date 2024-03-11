return {
  'shaunsingh/nord.nvim',
  priority = 1000,
  opts = {
    nord_contrast = false,
    nord_disable_background = true,
    nord_bold = false,
  },
  config = function()
    require('nord').set()
  end
}
