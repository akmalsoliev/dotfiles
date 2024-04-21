SHELL := /bin/bash
CONFIG_DIRS := nvim goto fish

help: # Print help on Makefile
	@grep '^[^.#]\+:\s\+.*#' Makefile | \
	sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "\033[93m"`\1`printf "\033[0m"`	\3 [\2]/" | \
	expand -t20

backup: # Full Backup
	$(MAKE) backup_config
	$(MAKE) backup_brew
	$(MAKE) backup_tmux

backup_config: #Back up specified files in .config
	@for dir in $(CONFIG_DIRS); do \
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
	if [ -f brew_programs_list.txt ]; then \
		rm brew_programs_list.txt; \
		fi
	touch brew_programs_list.txt 
	brew list --formula >> brew_programs_list.txt
	brew list --cask >> brew_programs_list.txt

backup_tmux: # Backup TMUX Config
	if [ -f $(HOME)/.tmux.conf ]; then \
		[ -f config/tmux.conf ] && rm config/tmux.conf; \
		cp $(HOME)/.tmux.conf config/tmux.conf && \
		echo "Successful TMUX backup"; \
	else \
		echo "Failed TMUX backup"; \
	fi

restore: # Full restore
	$(MAKE) restore_config
	$(MAKE) restore_brew
	$(MAKE) restore_tmux

restore_config: # Restore all /.config files
	@for dir in $(CONFIG_DIRS); do \
		if [ -d "config/$$dir" ]; then \
		echo "Restoring $$dir..."; \
		cp -rf "config/$$dir/" "$(HOME)/.config/$$dir/" && \
		echo "Successful restore of $$dir"; \
		else \
		echo "Backup of $$dir not found"; \
		fi \
		done

restore_brew: # Restore all brew installs
	xargs brew install < brew_programs_list.txt

restore_tmux: # Restore .tmux.conf file
	cp -f config/tmux.conf $(HOME)/.tmux.conf
