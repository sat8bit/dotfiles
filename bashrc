# global bash configuration
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# alias bash configuration
if [ -f ${HOME}/.bash_alias ]; then
    . ${HOME}/.bash_alias
fi

# ssh-agent
if [ -z $SSH_AUTH_SOCK ] ;then
  if [ -e $HOME/.ssh-sock ] ; then
    export SSH_AUTH_SOCK=$HOME/.ssh-sock
  else
    eval `ssh-agent -a $HOME/.ssh-sock`
    ssh-add
  fi
fi

# colors
export CLICOLOR=1

# git
export EDITOR=vim
export LESSCHARSET=utf-8

# nvm
if [ -s ~/.nvm/nvm.sh ];then
    source ~/.nvm/nvm.sh
fi

# path
export PATH=$PATH:$HOME/bin

# go settings
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# gcloud settings on brew
export PATH=$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/

# prompt
PROMPT_COMMAND="[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt"
