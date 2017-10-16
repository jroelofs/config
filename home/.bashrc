source ~/.git-prompt.sh

export PS1='\[\e[37;1m\][\t]\[\e[0m\] `if [ $? = 0 ]; then echo "\[\e[0;32m\]✔\[\e[0m\]"; else echo "\[\e[0;31m\]✘\[\e[0m\]"; fi` \u@\[\e[36;1m\]\h\[\e[0m\] \W\[\e[00m\]\$ '
#export PS1='\[\e[37;1m\][\t]\[\e[0m\] `if [ $? = 0 ]; then echo "\[\e[0;32m\]✔\[\e[0m\]"; else echo "\[\e[0;31m\]✘\[\e[0m\]"; fi` \u@\[\e[36;1m\]\h\[\e[0m\] \W`[[ $(git status 2> /dev/null | head -n4 | tail -n1) != "Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] || echo "\[\e[32m\]"`$(__git_ps1 " (%s)")\[\e[00m\]\$ '

export GREP_COLORS="ms=01;36:mc=01;31:sl=:cx=:fn=37:ln=32:bn=32:se=36"

alias ls="ls -G"
alias la="ls -Glah"
alias less="less -R"
alias grep="grep --color=always --exclude-dir=\".svn\""
alias svndiff="svn diff --diff-cmd=diff -x -U999"
alias llview='view -c "set filetype=llvm"'

export EDITOR="vim"
export SVN_EDITOR="vim"

# MacPorts Bash shell command completion
#if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
#    . /opt/local/share/git-core/git-prompt.sh
#fi


# Shared command history
#export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export PATH=$PATH:/opt/local//Library/Frameworks/Python.framework/Versions/3.6/bin
alias mgit="trezor-agent -v jroelofs@build1-trusty-cs.mentor -- git"

