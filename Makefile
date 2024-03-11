SHELL := /bin/bash

backup_brew: # Backup all brew applications
	if [ -f brew_programs_list.txt ]; then \
		rm brew_programs_list.txt; \
		fi
	touch brew_programs_list.txt 
	brew list --formula >> brew_programs_list.txt
	brew list --cask >> brew_programs_list.txt

backup_neovim: # Backup Neovim
	if [ -d $(HOME)/.config/nvim ]; then \
		rm -rf config/nvim/ && \
		cp -r $(HOME)/.config/nvim/ config/nvim/ && \
		echo "Successful Neovim backup"; \
	else \
		echo "Failed Neovim backup"; \
	fi

backup_tmux: # Backup TMUX Config
	if [ -f $(HOME)/.tmux.conf ]; then \
		[ -f config/tmux.conf ] && rm config/tmux.conf; \
		cp $(HOME)/.tmux.conf config/tmux.conf && \
		echo "Successful TMUX backup"; \
	else \
		echo "Failed TMUX backup"; \
	fi

set_brew: # Setup Brew
	xargs brew install < brew_programs_list.txt

set_neovim: # Setup Neovim Config
	cp -rf config/nvim/ $(HOME)/.config/nvim/

set_tmux: # Setup Neovim Config
	cp -f config/tmux.conf $(HOME)/.tmux.conf
