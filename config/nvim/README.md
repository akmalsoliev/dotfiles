# Neovim Configuration Readme

This repository contains my personal Neovim configuration, tailored to my
preferences and workflow. Below is a brief overview of key features and how to
set it up.

This config is heavily influenced by [kickstart](https://github.com/nvim-lua/kickstart.nvim.git)

## Features

### **Plugins**: Utilizes popular plugins to enhance Neovim's functionality, including:
  - aerial: a code outline window for skimming and quick navigation
  - blink-cmp: a modern completion engine with fuzzy matching and better UI
  - colorscheme-catppuccin: a soothing pastel color scheme for enhanced visual experience
  - conform: a formatting solution to get consistent code styles
  - dab: debug Adapter Protocol client implementation for Neovim
  - gitignore: a plugin to manage .gitignore files efficiently
  - gitsigns: git integration for Neovim to show git change signs and perform git actions
  - leap: an advanced navigation plugin for jumping to any location in the text efficiently
  - lualine: a responsive statusline written in Lua with a variety of configurations
  - mason: easily install and manage LSP servers, linters, and formatters
  - mini: a minimal and fast collection of Lua modules for Neovim
  - minuet: AI code completion using local Ollama models
  - nvim-scrollbar: a customizable scrollbar plugin for Neovim
  - nvim-treesitter: a better syntax highlighting and code parsing using Tree-sitter
  - oil: an improved file explorer as a buffer in Neovim
  - rainbow_csv: a highlighter for CSV and TSV files to enhance readability
  - smear-cursor: enhanced cursor animation for better visibility
  - snacks: a collection of useful utilities and enhancements for Neovim
  - todo-comments: highlight and manage TODO comments within your code
  - which-key: a keybinding helper for discovering key mappings in Neovim

- **Appearance**: Consistent and visually pleasing color scheme and status line setup.
![Screenshot](./screenshot.png)

## Setup
The configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

For AI completion features, this setup uses:
- minuet-ai.nvim connected to Ollama for local AI code completion
- blink.cmp for modern code completion with fuzzy matching

## Performance
The configuration optimizes Neovim's startup time by:
- Lazy-loading plugins when possible
- Disabling unnecessary built-in plugins

## Feedback

If you have any suggestions, feedback, or encounter any issues with the configuration, feel free to open an issue or submit a pull request. Your contributions are welcome!

Happy coding! 🚀