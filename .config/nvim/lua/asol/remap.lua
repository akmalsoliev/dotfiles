vim.g.mapleader = " "

-- Bufferline shortcuts
vim.keymap.set("n", "<leader>n", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<leader>p", vim.cmd.BufferLineCyclePrev)
vim.keymap.set("n", "<leader>b", vim.cmd.BufferLinePick)

-- Line movement, in view mode only!
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Search in the middle 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserve the paste
vim.keymap.set("x", "<leader>P", [["_dP]])

-- Save to buffer 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Will be used to remap the `:` to `;` <- my pinky hurts
vim.keymap.set("n", ";", ":")

-- Clear searcher
vim.keymap.set("n", "<leader>c", ":noh<CR>", { silent = true })

-- Spell check on
vim.keymap.set("n", "<leader>sp", ":set spell<CR>", { silent = true })
-- Word suggestion
vim.keymap.set("n", "<leader>sg", "z=", { silent = true })

-- nvim-tree toggle
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- remapping escape
vim.keymap.set({"i", "c", "v", "x"}, "<C-c>", "<Esc>", {noremap = true, silent = true})

-- aerial toggle
vim.keymap.set('n', '<leader>a', ':AerialToggle<CR>')

-- FTerm keybinding terminal
vim.keymap.set('n', '<C-N>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-N>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
