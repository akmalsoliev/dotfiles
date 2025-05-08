--  _       _____ _____
-- | |     / ____|  __ \
-- | |    | (___ | |__) |
-- | |     \___ \|  ___/
-- | |____ ____) | |
-- |______|_____/|_|

local configDir = vim.fn.stdpath("config")
local lspFiles = vim.fn.glob(configDir .. "/lsp/*.lua")
local lspSplitFiles = vim.split(lspFiles, "\n")

for _, files in pairs(lspSplitFiles) do
  local fileName = files:match("([^/\\]+)%.lua$")
  vim.lsp.enable(fileName)
end
