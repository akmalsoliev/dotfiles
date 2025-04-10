return {
  "milanglacier/minuet-ai.nvim",
  config = function()
    require("minuet").setup({
      virtualtext = {
        auto_trigger_ft = { "*" },
        keymap = {
          -- accept whole completion
          accept = "<A-A>",
          -- accept one line
          accept_line = "<A-a>",
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          accept_n_lines = "<A-z>",
          -- Cycle to prev completion item, or manually invoke completion
          prev = "<A-[>",
          -- Cycle to next completion item, or manually invoke completion
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
      provider = "openai_fim_compatible",
      n_completions = 1,
      context_window = 512,
      request_timeout = 10,
      provider_options = {
        openai_fim_compatible = {
          api_key = "TERM",
          name = "Ollama",
          end_point = "http://localhost:11434/v1/completions",
          model = "qwen2.5-coder:latest",
          optional = {
            max_tokens = 20,
            top_p = 0.9,
          },
        },
      },
    })
  end,
}
