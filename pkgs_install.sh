#!/bin/bash
##################################
# AUTHOR:   p-tank
# FILE:     pkgs_install.sh
# CREATED:  15:06:12 16/08/2013
# MODIFIED: 15:06:12 16/08/2013
##################################

packages=(
	vim
	tig
	terminator
	weechat
	curl
	python
	python3
	python-pip
	libsdl1.2debian
	libjpeg8 libjpeg8-dev
	python-dev libjpeg-dev libfreetype6-dev zlib1g-dev
	)
if [ $EUID -ne 0 ]
then
	echo -e "\033[31mYou must be root\033[0m" 1>&2
	exit 1
fi
echo -e "\033[32mChecking UPTDATE ..\033[0m"
apt-get update
echo -e "\033[32mStart install packages\033[0m"
for name in ${packages[@]}
do 
	echo -e "\033[32mInstalling: $name\033[0m"
	apt-get install $name
done
	echo -e "\033[32mAll packages was installed"
exit 0
