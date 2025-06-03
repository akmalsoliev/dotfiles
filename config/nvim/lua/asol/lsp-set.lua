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

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    -- Add the keymap for formatting (buffer-local)
    vim.keymap.set('n', '<leader>fo', function()
      vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 1000 })
    end, { buffer = bufnr, desc = "LSP: Format buffer" })

    -- Auto-format ("lint") on save.
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
