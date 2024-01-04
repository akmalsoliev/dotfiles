-- Load the colorscheme
require('nord').set()

local highlights = require("nord").bufferline.highlights({
    italic = true,
    bold = true,
    fill = "#181c24"
})

require("bufferline").setup{
    options={
        diagnostics = "nvim_lsp",
        color_icons = true,
        separator_style = "thin",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory"
          }
        },
    },
    highlights = highlights,
}

-- Lualine addition
require("lualine").setup({
    theme = 'nord',
})

-- nord setup
vim.g.nord_contrast = true
vim.g.nord_disable_background = true
vim.g.nord_bold = false

--Lua:
vim.cmd[[colorscheme nord]]
