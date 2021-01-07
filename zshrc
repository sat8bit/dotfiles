autoload -U compinit
compinit

# load git-prompt.sh
if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
       source ${HOME}/.zsh/git-prompt.sh
fi



# promptを独自で変更
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST
PS1='[%F{green}%m%f][%F{blue}%~%f][%F{red}$(__git_ps1 "%s")%f]
$ '

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zhistory
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# historyを共有
setopt share_history
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history
# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
# bash っぽい補完にしたい
setopt noautomenu
setopt nomenucomplete

# ssh-agent
if [ -z $SSH_AUTH_SOCK ] ;then
  if [ -e $HOME/.ssh-sock ] ; then
    export SSH_AUTH_SOCK=$HOME/.ssh-sock
  else
    eval `ssh-agent -a $HOME/.ssh-sock`
    ssh-add
  fi
fi

# git
export EDITOR=vim
export LESSCHARSET=utf-8

# path
export PATH=$PATH:$HOME/bin

# go settings
export GOPATH=$HOME/Works
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin
export GOPRIVATE=github.com/manda-bz

# gcloud settings on brew
export PATH=$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/

# aliases
alias g='cd $(ghq root)/$(ghq list | peco)'
alias ke="kubectl -n prod exec -it \$(kubectl -n prod get pods | grep Running | awk '{print \$1}' | peco) /bin/sh"
alias km="kubectl -n prod port-forward \$(kubectl get pods -n prod -l name=mysql | grep mysql | awk '{print \$1}') 3306"
alias de="docker exec -it \$(docker ps | peco | awk '{print \$1}') /bin/sh"
alias v='vim $(ghq root)/$(ghq list | peco)'

