vim.api.nvim_create_user_command('Rename', 'lua vim.lsp.buf.rename()', {})
vim.api.nvim_create_user_command('RR', ':w | !cargo run', {})
