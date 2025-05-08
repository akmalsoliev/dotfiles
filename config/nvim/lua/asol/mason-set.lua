local masonConfig = {
  "basedpyright", --python
  "ruff", -- python
  "lua-language-server", -- lua
  "stylua", -- lua
  "rust-analyzer", --rust
  "fixjson", -- json
  "terraform-ls", --terraform
}

require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = masonConfig,
  auto_update = true,
  run_on_start = true,
  run_on_config = true,
})

