# Alias like I like 
alias ll='ls -lsGa';
alias maou='cat -e';
# quick gcc flag
alias comp='gcc -Wall -Werror -Wextra'

export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
export ANDROID_SDK_HOME=~/.android
