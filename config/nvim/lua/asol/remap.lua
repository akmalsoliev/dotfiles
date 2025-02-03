--  _____
-- |  __ \
-- | |__) |___ _ __ ___   __ _ _ __
-- |  _  // _ \ '_ ` _ \ / _` | '_ \
-- | | \ \  __/ | | | | | (_| | |_) |
-- |_|  \_\___|_| |_| |_|\__,_| .__/
--                            | |
--                            |_|

-- All modes available in Neovim
local allModes = { "n", "i", "v", "c", "s", "o", "x" }

-- Will be used to remap the `:` to `;`
vim.keymap.set("n", ";", ":", { desc = "Remapped command mode" })

-- Line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Search in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserve the paste
vim.keymap.set("x", "<leader>P", [["_dP]], {
  silent = true,
  desc = "[P]reserve paste",
})

-- Clear searcher
vim.keymap.set("n", "<leader>C", ":noh<CR>", {
  silent = true,
  desc = "[C]lear search",
})

-- Word suggestion
vim.keymap.set("n", "<leader>sg", "z=", {
  silent = true,
  desc = "Word [S]u[g]gestion",
})

-- remapping escape
vim.keymap.set(allModes, "<C-c>", "<Esc>", { silent = true })

-- Exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {
  desc = "Exit terminal mode",
})
