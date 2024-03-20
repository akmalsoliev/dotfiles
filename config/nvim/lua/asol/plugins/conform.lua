return { -- Autoformat
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "[F]ormat file",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff" },
      bash = { "beautysh" },
      sql = { "sql_formatter" },
      json = { "prettier" },
      ["*"] = { "trim_whitespace", "codespell" },
    },
  },
}
