DOTFILES := vimrc zshrc gitconfig tmux.conf zsh

.PHONY: configure
configure: $(addprefix deploy-,$(DOTFILES))

.PHONY: $(addprefix deploy-,$(DOTFILES))
$(addprefix deploy-,$(DOTFILES)): deploy-%:
	rm -rf "$(HOME)/.$*"
	cp -R "$*" "$(HOME)/.$*"
