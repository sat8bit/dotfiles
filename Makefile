DOTFILES := vimrc zprofile zshrc gitconfig tmux.conf zsh starship.toml

.PHONY: configure
configure: $(addprefix deploy-,$(DOTFILES))

.PHONY: $(addprefix deploy-,$(DOTFILES))
$(addprefix deploy-,$(DOTFILES)): deploy-%:
	cp -R "$*" "$(HOME)/.$*"
