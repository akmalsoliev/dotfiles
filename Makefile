SHELL := /bin/bash

install_brew: # Install all brew casks and formulas
	xargs brew install < brew_programs_list.txt

set_config: # Copy config to home directory
	cp -rf .config/ ~/.config/
	cp -f .tmux.conf ~/.tmux.conf
