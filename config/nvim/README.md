# Neovim Configuration Readme

This repository contains my personal Neovim configuration, tailored to my
preferences and workflow. Below is a brief overview of key features and how to
set it up.

This config is heavily influenced by [kickstart](https://github.com/nvim-lua/kickstart.nvim.git)

## Features

- **Plugins**: Utilizes popular plugins to enhance Neovim's functionality, including:
  - `vim-airline` for status line
  - `nerdtree` for file navigation
  - `coc.nvim` for language server integration
  - `fzf` for fuzzy file searching
  - `vim-surround` for easy manipulation of surroundings
  - `vim-commentary` for commenting code
  - and more!
- **Mappings**: Custom key mappings to streamline common tasks and improve productivity.
- **Appearance**: Consistent and visually pleasing color scheme and status line setup.

## Installation

1. **Clone Repository**: Clone this repository to your local machine.

 ```
 git clone https://github.com/yourusername/neovim-config.git ~/.config/nvim
 ```

2. **Install Plugins**: Open Neovim and run the command `:PlugInstall` to install all the required plugins.

3. **Language Servers**: If using `coc.nvim`, ensure you have the necessary language servers installed for your preferred programming languages. You can do this by referring to the `coc-settings.json` file and installing the required language servers using `:CocInstall`.

4. **Customization**: Feel free to customize any settings or mappings in the `init.vim` file to better suit your preferences and workflow.

5. **Enjoy**: Open Neovim and start coding with your new setup!

## Feedback

If you have any suggestions, feedback, or encounter any issues with the configuration, feel free to open an issue or submit a pull request. Your contributions are welcome!

Happy coding! 🚀
