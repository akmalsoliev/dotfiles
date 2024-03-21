return { -- Autoformat
  "stevearc/conform.nvim",
  formatters = {
    stylelua = {
      indent_width = 2
    }
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "[F]ormat file",
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_format" },
      bash = { "beautysh" },
      sql = { "sql_formatter" },
      json = { "prettier" },
      ["*"] = { "trim_whitespace" },
    },
  },
}
