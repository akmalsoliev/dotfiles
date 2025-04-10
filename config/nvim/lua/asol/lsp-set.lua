vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("CustomLspConfig", { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf, noremap = true, silent = true }
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gt", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", "Go to Definition in a split")

    map("[d", vim.diagnostic.goto_prev, "Go to previous [D]iagnostic message")
    map("]d", vim.diagnostic.goto_next, "Go to next [D]iagnostic message")
    map("<leader>e", vim.diagnostic.open_float, "Show diagnostic [E]rror messages")
    map("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

    -- Rename the variable under your cursor
    --  Most Language Servers support renaming across files, etc.
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap
    map("K", vim.lsp.buf.hover, "Hover Documentation")

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
