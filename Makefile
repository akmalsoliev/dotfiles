SHELL := /bin/bash
BACKUP_CONFIG_DIRS := stylua fish tmux prettier alacritty
RESTORE_CONFIG_DIRS := nvim stylua fish tmux prettier alacritty

help: # Print help on Makefile
	@grep '^[^.#]\+:\s\+.*#' Makefile | \
	sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "\033[93m"`\1`printf "\033[0m"`	\3 [\2]/" | \
	expand -t20

backup: # Full Backup
	$(MAKE) backup_config
	$(MAKE) backup_brew
	$(MAKE) backup_bun

backup_config: #Back up specified files in .config
	@for dir in $(BACKUP_CONFIG_DIRS); do \
		if [ -d "$(HOME)/.config/$$dir" ]; then \
		echo "Backing up $$dir..."; \
		rm -rf "config/$$dir/" && \
		cp -r "$(HOME)/.config/$$dir/" "config/$$dir/" && \
		echo "Successful $$dir backup"; \
		else \
		echo "Failed to backup $$dir - directory does not exist"; \
		fi \
		done

backup_brew: # Backup all brew applications
	brew bundle dump --force

backup_bun: # Backup all globally installed Bun applications
	NO_COLOR=1 bun pm ls -g | tail -n +2 | \
	sed 's/^[^a-zA-Z@]*//' > bun_global_applications.txt

restore: # Full restore
	$(MAKE) restore_config
	$(MAKE) restore_brew

restore_config: # Restore all /.config files
	@for dir in $(RESTORE_CONFIG_DIRS); do \
		if [ -d "config/$$dir" ]; then \
		echo "Restoring $$dir..."; \
		cp -rf "config/$$dir/" "$(HOME)/.config/$$dir/" && \
		echo "Successful restore of $$dir"; \
		else \
		echo "Backup of $$dir not found"; \
		fi \
		done

restore_brew: # Restore all brew installs
	brew bundle install

restore_bun: # Reinstall all Bun global applications
	cat bun_global_applications.txt | XARGS bun add -g
