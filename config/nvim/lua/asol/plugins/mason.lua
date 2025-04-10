local mason_config = require("asol.mason-set")

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = mason_config,
      auto_update = true,
      run_on_start = true,
      run_on_config = true,
    })
  end,
}
