# Non-login shells do not read ~/.zprofile, so load it here once.
if [[ -z "${ZPROFILE_LOADED}" && -f "${HOME}/.zprofile" ]]; then
  source "${HOME}/.zprofile"
fi

# Completion
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit

# Prompt
export STARSHIP_CONFIG="${HOME}/.starship.toml"
eval "$(starship init zsh)"

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
