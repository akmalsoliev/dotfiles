# Dotfiles

Personal macOS dotfiles for terminal and editor setup, with a small `Makefile`
workflow for backing up and restoring configuration.

## What Is Included

- `Brewfile` for Homebrew packages and apps
- `bun_global_applications.txt` for globally installed Bun packages
- `config/alacritty` for terminal configuration
- `config/fish` for shell configuration, functions, completions, and theme
- `config/nvim` for Neovim configuration
- `config/prettier` for Prettier settings
- `config/stylua` for Stylua settings
- `config/tmux` for tmux configuration

Neovim-specific notes live in `./config/nvim/README.md`.

## Repository Structure

```text
.
├── Brewfile
├── Makefile
├── README.md
├── bun_global_applications.txt
└── config
    ├── alacritty
    ├── fish
    ├── nvim
    ├── prettier
    ├── stylua
    └── tmux
```

## Makefile Commands

Use `make help` to list available targets.

### Backup

1. Full backup

   ```bash
   make backup
   ```

   Runs `backup_config`, `backup_brew`, and `backup_bun`.

2. Config backup

   ```bash
   make backup_config
   ```

   Copies these directories from `~/.config` into this repo when they exist:
   `stylua`, `fish`, `tmux`, `prettier`, and `alacritty`.

3. Homebrew backup

   ```bash
   make backup_brew
   ```

   Regenerates `Brewfile` with `brew bundle dump --force`.

4. Bun backup

   ```bash
   make backup_bun
   ```

   Saves globally installed Bun packages to `bun_global_applications.txt`.

### Restore

1. Full restore

   ```bash
   make restore
   ```

   Runs `restore_config` and `restore_brew`.

2. Config restore

   ```bash
   make restore_config
   ```

   Restores these directories into `~/.config`: `nvim`, `stylua`, `fish`,
   `tmux`, `prettier`, and `alacritty`.

3. Homebrew restore

   ```bash
   make restore_brew
   ```

   Installs packages from `Brewfile` with `brew bundle install`.

4. Bun restore

   ```bash
   make restore_bun
   ```

   Reinstalls global Bun packages listed in `bun_global_applications.txt`.

## Prerequisites

- `git`
- `make`
- `brew` for Homebrew package restore and backup
- `bun` for Bun global package backup and restore
- A terminal with Nerd Font support for parts of the shell and editor UI

## Notes

- `backup_config` does not back up `nvim`; Neovim is tracked directly in this
  repository.
- `restore` currently restores config and Homebrew packages. Bun restore is
  available separately via `make restore_bun`.
