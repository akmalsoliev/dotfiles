return { -- Autoformat
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>f",
      '<CMD>lua require("conform").format({ timeout_ms = 3000 })<CR>',
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
      rust = { "rustfmt" },
      bash = { "beautysh" },
      sql = { "sql_formatter" },
      json = { "prettier" },
      ["*"] = { "trim_whitespace" },
    },
  },
  formatters = {
    stylelua = {
      indent_width = 2
    }
  },
}
