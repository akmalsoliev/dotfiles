local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'pyright',
  'pyre',
  'bashls',
  'docker_compose_language_service',
  'dockerls',
  'rust_analyzer',
})

-- ON HOLD!
-- Setup for python
-- require'lspconfig'.pylsp.setup{
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           maxLineLength = 79,
--           indentSize = 2 
--         }, 
--         pylint = {
--           enable = true
--         }
--       }
--     }
--   }
-- }

require'lspconfig'.pyre.setup{}

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
