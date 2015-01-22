# ssh-agent
if [ -z $SSH_AUTH_SOCK ] ;then
  if [ -e $HOME/.ssh-sock ] ; then
    export SSH_AUTH_SOCK=$HOME/.ssh-sock
  else
    eval `ssh-agent -a $HOME/.ssh-sock`
    ssh-add
  fi
fi

# bash
export PS1="\h:\w\n\u\$ "
export PATH=$PATH:$HOME/bin

# git
export EDITOR=vim
export LESSCHARSET=utf-8

# nvm
if [ -s ~/.nvm/nvm.sh ];then
    source ~/.nvm/nvm.sh
fi

alias scr="screen -R"
export PATH=$PATH:$HOME/bin
