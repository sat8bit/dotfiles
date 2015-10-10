# global bash configuration
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
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

# prompt
PROMPT_COMMAND="[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt"
