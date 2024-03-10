return {
  'shaunsingh/nord.nvim',
  opts = {
    nord_contrast = false,
    nord_disable_background = true,
    nord_bold = false,
  },
  config = function() -- This is the function that runs, AFTER loading
    require('nord').set()
  end
}
