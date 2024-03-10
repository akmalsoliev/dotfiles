return {
  'shaunsingh/nord.nvim',
  opts = {
    nord_contrast = true,
    nord_disable_background = true,
    nord_bold = true,
  },
  config = function() -- This is the function that runs, AFTER loading
    require('nord').set()
  end
}
