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
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      rust = { "rustfmt" },
      bash = { "beautysh" },
      json = { "fixjson" },
      typescript = { "prettier" },
      dockerfile = { "dockerls" },
      compose = {
        "docker_compose_language_service",
        file_patterns = { "*compose*.yaml" }, -- Match any file with "compose" in the name
      },
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
