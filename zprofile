# Mark as loaded so non-login shells can source this exactly once.
export ZPROFILE_LOADED=1

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

# fzf: show list below prompt
export FZF_DEFAULT_OPTS="--layout=reverse"
export FZF_CTRL_T_OPTS="--layout=reverse"
export FZF_ALT_C_OPTS="--layout=reverse"
export FZF_COMPLETION_OPTS="--layout=reverse"

typeset -U path PATH
export PATH

# mise
eval "$(mise activate zsh)"

# Local overrides (e.g. work machine specific settings)
if [[ -f "${HOME}/.zprofile.local" ]]; then
  source "${HOME}/.zprofile.local"
fi
