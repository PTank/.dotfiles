# Alias like I like 
alias ll='ls -lsGa';
alias maou='cat -e';
alias xclip='xclip -selection c';

# quick gcc flag
alias c='gcc -Wall -Werror -Wextra'
alias c++='g++ -Wall -Werror -Wextra'

export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh


export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_HIDE_IF_PWD_IGNORED=1
export GIT_MERGE_AUTOEDIT=no
 
export PS1='\[\e[0;36m\][\A] \u@\h:\[\e[0m\e[0;32m\]\W\[\e[1;33m\]$(__git_ps1 " (%s) ")\[\e[0;37m\] \$\[\e[0m\] '


