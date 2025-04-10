return { -- Autoformat
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>fo",
      '<CMD>lua require("conform").format({ timeout_ms = 3000 })<CR>',
      mode = { "n", "v" },
      desc = "Format file",
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
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      rust = { "rustfmt" },
      json = { "fixjson" },
      ["*"] = { "trim_whitespace" },
    },
  },
  formatters = {
    stylua = {
      args = { "--config-path", "~/.config/stylua/stylua.toml" },
    },
    rustfmt = {
      autosave = 1,
    },
  },
}
