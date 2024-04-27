# Dotfiles README

Welcome to my personalized dotfiles repository. It contains your configurations for `Neovim` and `tmux`, as well as a list of `brew` applications I use.

## Structure

Here is the basic structure of the repository:

```
.
├── Makefile
├── README.md
├── brew_programs_list.txt
└── config
    ├── fish
    ├── goto
    ├── nvim
    ├── stylua
    └── tmux.conf
```

## How to Use

This repository leverages a `Makefile` for various backup and setup tasks. 
Below are the commands you can use:

### Backup

1. **Backup**
  ```bash
  make backup
  ```
  This command is a high-level target that invokes three other backup targets:
  backup_config, backup_brew, and backup_tmux. It's utilized for performing a full
  backup operation with just a single command.

2. **Backup Config Listed Directories**
  ```bash
  make backup_config
  ```
  This target iterates over directories specified in the variable CONFIG_DIRS,
  checks if these directories exist in the user's .config directory, backs them up
  by copying to a config directory within the current project, and reports the
  success or failure of each backup operation.

3. **Backup Brew Applications**
  ```bash
  make backup_brew
  ```
  This command backs up all installed brew formulae and casks to
  `brew_programs_list.txt`.

4. **Backup TMUX Configuration**
  ```bash
  make backup_tmux
  ```
  Copies your `.tmux.conf` file from your home directory to the `config`
  directory in this repository for backup.

### Restore Commands
 
1. **Restore** 
  ```bash
  make restore
  ```
  This target allows for a full restoration operation by invoking the three
  restore targets: restore_config, restore_brew, and restore_tmux. It is used to
  restore previously backed up configuration and applications.

2. **Restore Config Listed Directories**
  ```bash
  make restore_config
  ```
  Iterates through the directories within the config directory and restores them
  into the user's .config directory, reporting the success or failure of each
  operation.

3. **Restore Brew Applications**
  ```bash
  make restore_brew
  ```
  Restores the Brew applications by reading the brew_programs_list.txt file,
  which contains the list of Brew formulas and casks to be installed. This command
  simplifies reinstalling Brew applications after a system refresh or setup.

2. **Restore TMUX Configuration**
  ```bash
  make restore_tmux
  ```
  Restores the TMUX configuration by copying the backed-up .tmux.conf file from
  the config directory to the user's home directory, overwriting any existing
  .tmux.conf file.

## Prerequisites

- **Homebrew**: Used for managing software packages on macOS. Ensure you have
  Homebrew installed for the brew commands to work.

## Note

- It is important to periodically update the backup files in this repository to
  keep your configurations and brew packages list up to date.
- Ensure you review the `brew_programs_list.txt` file and the configurations in
  the `config` directory before using the setup commands, especially when
  setting up a new machine.
- Any custom changes or additional configurations you wish to backup should be
  manually added to the appropriate directories or files.

## Contributing

Feel free to fork this repository and adapt the make commands and configurations
to suit your personal setup needs. Contributions and improvements to the script
are welcome.
