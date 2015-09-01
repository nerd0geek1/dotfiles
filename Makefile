DOTFILES = .vimrc .zshrc

deploy:
	@echo 'Copyright (c) 2013-2015 nerd0geek1 All Rights Reserved.'
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
