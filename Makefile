.PHONY: install

install:
	@ln -sf $(PWD)/.gitconfig $(HOME)/.gitconfig
	@ln -sf $(PWD)/.vimrc $(HOME)/.vimrc

	@mkdir -p $(HOME)/.bin
	@ln -sf $(PWD)/bin/xg $(HOME)/.bin/xg
	@ln -sf $(PWD)/bin/xm $(HOME)/.bin/xm

	@mkdir -p "$(HOME)/Library/Application Support/Code/User"
	@ln -sf $(PWD)/vscode/keybindings.json "$(HOME)/Library/Application Support/Code/User/keybindings.json"
	@ln -sf $(PWD)/vscode/settings.json "$(HOME)/Library/Application Support/Code/User/settings.json"

	@echo $(PWD)/.zshrc
