# Dotfiles README

Welcome to my personalized dotfiles repository. It contains your configurations for `Neovim`, `tmux`, `ghostty` and `fish`, as well as a list of `brew` applications I use.

## Structure

Here is the basic structure of the repository:

```plaintext
.
├── Makefile
├── README.md
├── brew_programs_list.txt
└── config
    ├── fish
    ├── ghostty
    ├── nvim
    ├── stylua
    ├── tmux
    └── zsh
```

## How to 

Use This repository leverages a Makefile for various backup and setup
tasks. Below are the commands you can use:

### Backup 

1. Backup 

`make backup`

This command is a high-level target that invokes three other
backup targets: `backup_config` and `backup_brew`. It's utilized for
performing a full backup operation with just a single command.

2. Backup Config 

`make backup_config`

This command backs up the specified configuration directories.

3. Backup Brew 

`make backup_brew`

This command backs up the list of installed brew applications.

### Restore 

1. Restore 

`make restore`

This command is a high-level target that invokes two other restore targets:
`restore_config` and `restore_brew`. It's utilized for performing a full restore
operation with just a single command.

2. Restore Config 

`make restore_config`

This command restores the configuration directories from the
backup.

3. Restore Brew 

`make restore_brew`

This command restores the brew applications from the backup list.

## Prerequisites

- **Homebrew**: Used for managing software packages on macOS. Ensure you have
Homebrew installed for the brew commands to work.

## Note

- It is important to periodically update the backup files in this repository to
keep your configurations and brew packages list up to date.  
- Ensure you review
the `brew_programs_list.txt` file and the configurations in the `config`
directory before using the setup commands, especially when setting up a new
machine.  
- Any custom changes or additional configurations you wish to backup
should be manually added to the appropriate directories or files.

## Contributing

Feel free to fork this repository and adapt the make commands and configurations
to suit your personal setup needs. Contributions and improvements to the script
are welcome.
