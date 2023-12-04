vim.api.nvim_exec([[
  autocmd FileType json %!jq
]], false)
