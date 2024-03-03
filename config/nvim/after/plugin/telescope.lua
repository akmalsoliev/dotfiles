local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>s', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<esc>"] = actions.close,
			},
		},
	},
})
