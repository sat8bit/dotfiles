# Completion
autoload -Uz compinit
compinit

# Prompt
if [[ -f "${HOME}/.zsh/git-prompt.sh" ]]; then
  source "${HOME}/.zsh/git-prompt.sh"
fi

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt prompt_subst
PS1='[%F{green}%m%f][%F{blue}%~%f][%F{red}$(__git_ps1 "%s")%f]
$ '

# History
export HISTFILE="${HOME}/.zhistory"
export HISTSIZE=1000
export SAVEHIST=100000

setopt extended_history
setopt hist_expand
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history
setopt share_history

# Key bindings
bindkey -e
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# Completion menu
setopt noautomenu
setopt nomenucomplete

# SSH agent
if [[ -z "${SSH_AUTH_SOCK}" ]]; then
  if [[ -e "${HOME}/.ssh-sock" ]]; then
    export SSH_AUTH_SOCK="${HOME}/.ssh-sock"
  else
    eval "$(ssh-agent -a "${HOME}/.ssh-sock")"
    ssh-add
  fi
fi

# Editor
export EDITOR=vim
export LESSCHARSET=utf-8

# PATH
path+=("${HOME}/bin")

if command -v brew >/dev/null 2>&1; then
  path+=("$(brew --prefix)/bin")
fi

# Go
export GOPATH="${HOME}/Works"
export GOPRIVATE=github.com/manda-bz
path+=("${GOPATH}/bin")

typeset -U path PATH
export PATH

# Functions
function g() {
  local selected
  selected="$(ghq list | fzf)"
  [[ -n "${selected}" ]] || return 0

  cd "$(ghq root)/${selected}" || return
}

# Local overrides (e.g. work machine specific settings)
if [[ -f "${HOME}/.zshrc.local" ]]; then
  source "${HOME}/.zshrc.local"
fi
