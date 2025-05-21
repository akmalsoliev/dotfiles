# Dotfiles

Welcome to my personalized dotfiles repository. It contains configurations for
`Neovim`, `tmux`, `fish`, and `stylua`, as well as a Brewfile for managing
applications.

## Structure

Here is the structure of the repository:

```plaintext
.
├── Brewfile
├── Makefile
├── README.md
└── config
    ├── fish
    ├── nvim
    ├── stylua
    └── tmux
```

For Neovim README.md, check: ./config/nvim/README.md

## How to Use

This repository leverages a Makefile for various backup and setup tasks:

### Backup

1. Full Backup

    ```bash
    make backup
    ```

    Performs a complete backup by running both `backup_config` and `backup_brew`.

2. Backup Config

    ```bash
    make backup_config
    ```

    Backs up the specified configuration directories.

3. Backup Brew

    ```bash
    make backup_brew
    ```

    Creates/updates a Brewfile of installed applications using `brew bundle dump`.

### Restore

1. Full Restore

    ```bash
    make restore
    ```

    Performs a complete restore by running both `restore_config` and `restore_brew`.

2. Restore Config

    ```bash
    make restore_config
    ```

    Restores the configuration directories from the backup.

3. Restore Brew

    ```bash
    make restore_brew
    ```

    Installs applications from the Brewfile using `brew bundle install`.

## Prerequisites

- **Homebrew**: Required for managing software packages on macOS. Make sure
it's installed for the brew commands to work.
- **Git**: Required for version control and plugin management.
- **Terminal with Nerd Font support**: Recommended for proper icon display in Neovim.

## Recent Changes

- Moved to `brew bundle dump` for better Homebrew package management
- Updated Neovim configuration with new key mappings and plugin settings
- Added `snacks.nvim` with dashboard functionality for Neovim
- Added DAP (Debug Adapter Protocol) support for Python and Lua
- Improved LSP configurations, particularly for Python development

## Contributing

Feel free to fork this repository and adapt the commands and configurations to
suit your personal setup needs. Contributions and improvements are welcome.
