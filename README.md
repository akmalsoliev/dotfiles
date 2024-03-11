# Dotfiles README

Welcome to my personalized dotfiles repository. It contains your configurations for `Neovim` and `tmux`, as well as a list of `brew` applications I use.

NOTE: This is still WIP.

## Structure

Here is the basic structure of the repository:

```
.
├── Makefile                # Contains commands for backing up and setting up environments
├── brew_programs_list.txt  # A list of installed brew packages
└── config                  # Directory containing configuration files
    ├── fish                # Fish shell configurations
    ├── nvim                # Neovim configurations
    └── tmux.conf           # TMUX configuration file
```

## How to Use

This repository leverages a `Makefile` for various backup and setup tasks. 
Below are the commands you can use:

### Backup

1. **Backup Brew Applications**

   ```bash
   make backup_brew
   ```
   This command backs up all installed brew formulae and casks to `brew_programs_list.txt`.

2. **Backup Neovim Configuration**

   ```bash
   make backup_neovim
   ```
   Backs up your `nvim` configuration from your home directory into the `config/nvim` directory of this repository.

3. **Backup TMUX Configuration**

   ```bash
   make backup_tmux
   ```
   Copies your `.tmux.conf` file from your home directory to the `config` directory in this repository for backup.

### Setup

1. **Setup Brew Packages**

   ```bash
   make set_brew
   ```
   Installs the brew packages listed in `brew_programs_list.txt`.

2. **Setup Neovim Configuration**

   ```bash
   make set_neovim
   ```
   Copies the `nvim` configuration from this repository to your home directory. 

3. **Setup TMUX Configuration**

   ```bash
   make set_tmux
   ```
   Copies the `tmux.conf` file to your home directory to apply the TMUX configuration.

## Prerequisites

- **Homebrew**: Used for managing software packages on macOS. Ensure you have Homebrew installed for the brew commands to work.
- **Neovim**: A highly configurable Vim-based text editor. This is required for the Neovim backup and setup.
- **TMUX**: A terminal multiplexer. You should have TMUX installed for TMUX configuration backup and setup.

## Note

- It is important to periodically update the backup files in this repository to keep your configurations and brew packages list up to date.
- Ensure you review the `brew_programs_list.txt` file and the configurations in the `config` directory before using the setup commands, especially when setting up a new machine.
- Any custom changes or additional configurations you wish to backup should be manually added to the appropriate directories or files.

## Contributing

Feel free to fork this repository and adapt the make commands and configurations to suit your personal setup needs. Contributions and improvements to the script are welcome.
