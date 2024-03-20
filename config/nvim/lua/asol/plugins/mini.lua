return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup({
      mappings = {
        add = '<leader>msa', -- Add surrounding in Normal and Visual modes
        delete = '<leader>msd', -- Delete surrounding
        find = '<leader>msf', -- Find surrounding (to the right)
        find_left = '<leader>msF', -- Find surrounding (to the left)
        highlight = '<leader>msh', -- Highlight surrounding
        replace = '<leader>msr', -- Replace surrounding
        update_n_lines = '<leader>msn', -- Update `n_lines`
        suffix_last = '', -- Suffix to search with "prev" method
        suffix_next = '', -- Suffix to search with "next" method
      }
    })
  end,
}
