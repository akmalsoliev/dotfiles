-- return {
--   "folke/noice.nvim",
--   dependencies = {
--     "MunifTanjim/nui.nvim",
--   },
--   event = "VeryLazy",
--   opts = function()
--     local enable_conceal = false          -- Hide command text if true
--     return {
--       -- Disable every other noice feature
--       messages = { enabled = false },
--       lsp = {
--         hover = { enabled = false },
--         signature = { enabled = false },
--         progress = { enabled = false },
--         message = { enabled = false },
--         smart_move = { enabled = false },
--       },
--     }
--   end
-- }