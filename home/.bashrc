source ~/.git-prompt.sh

export PS1='\[\e[32;1m\][\t]\[\e[0m\] \u@\[\e[36;1m\]\h\[\e[0m\] \W$(__git_ps1 " (%s)")\$ '

alias ls="ls -G"
alias la="ls -Glah"
alias less="less -R"
alias grep="gre= --color=always"

export SVN_EDITOR="vim"

