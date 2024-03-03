local lsp = require('lsp-zero')
local lsp_config = require('lspconfig')

lsp.preset('recommended')

-- Languages
local install_languages = require('lsp_set.install_languages')
lsp.ensure_installed(install_languages)

-- CMP
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local _ = lsp.defaults.cmp_mappings({
  ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<esc>'] = cmp.mapping.close(),
  ['<C-h>'] = cmp.mapping.complete(),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<CR'] = nil,
})

-- Fix vim script autocompletion
cmp.setup {
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }
}

-- Should fix cmp completion size issue
local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 20
local MIN_LABEL_WIDTH = 20
table.insert(cmp, {
  format = function(entry, vim_item)
    local label = vim_item.abbr
    local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
    if truncated_label ~= label then
      vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
    elseif string.len(label) < MIN_LABEL_WIDTH then
      local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
      vim_item.abbr = label .. padding
    end
    return vim_item
  end,
})

-- Rust 
local on_attach = function(client)
    require'completion'.on_attach(client)
end

local rust_set = require('lsp_set.rust_set')
lsp_config.rust_analyzer.setup({
    on_attach=on_attach,
    settings = rust_set
})

-- Python
require('lspconfig').ruff_lsp.setup {}

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}

-- Fix Undefined global 'vim'
lsp_config.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

-- Keymaps
lsp.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = true}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set({"n", "i"}, "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<C-H>", function() vim.lsp.buf.document_highlight() end, opts)
end)

local cmp_set = require('lsp_set.cmp_set')
lsp.setup_nvim_cmp(cmp_set)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
