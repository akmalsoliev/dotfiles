vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.number = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "79"

vim.g.mapleader = ' '

-- Setting fish as default shell
vim.opt.shell = "/opt/homebrew/bin/fish"

-- Removing case sensitivity
vim.opt.ignorecase = true

-- Break line after 80 characters
vim.opt.tw=79

-- New addition in Neovim 9 splitting the buffer on screen
vim.opt.spk="cursor"
