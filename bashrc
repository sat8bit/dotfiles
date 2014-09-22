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

alias scr="screen -R"
