SHELL := /bin/bash

backup_brew: # Backup all brew applications
	if [ -f brew_programs_list.txt ]; then \
		rm brew_programs_list.txt; \
		fi
	touch brew_programs_list.txt 
	brew list --formula >> brew_programs_list.txt
	brew list --cask >> brew_programs_list.txt

install_brew: # Install all brew casks and formulas
	xargs brew install < brew_programs_list.txt

set_config: # Copy config to home directory
	cp -rf config/ ~/.config/
	cp -f .tmux.conf ~/.tmux.conf
