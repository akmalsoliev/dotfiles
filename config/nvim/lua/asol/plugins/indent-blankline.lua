return {
  "lukas-reineke/indent-blankline.nvim",
  config = function ()
    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"
    vim.opt.listchars:append "eol:↴"

    local highlight = {
      "Red",
      "Orange",
      "Yellow",
      "Green",
      "Purple"
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "Red", { fg = "#BF616A" })
      vim.api.nvim_set_hl(0, "Orange", { fg = "#D08770" })
      vim.api.nvim_set_hl(0, "Yellow", { fg = "#EBCB8B" })
      vim.api.nvim_set_hl(0, "Green", { fg = "#A3BE8C" })
      vim.api.nvim_set_hl(0, "Purple", { fg = "#B48EAD" })
    end)

    require('ibl').setup {
      indent = { highlight = highlight },
      exclude = { filetypes = {'dashboard'} }
    }
  end
}
