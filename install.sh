#!/bin/bash
##################################
# AUTHOR:   p-tank
# FILE:     install.sh
# CREATED:  15:47:44 16/08/2013
# MODIFIED: 17:54:27 16/08/2013
##################################

DIR=~/.dotfiles/
install=(
	.vim
	.vimrc
	.bashrc
	)
echo -e "\033[32mWelcome to my dotfile install\033[0m"
echo -e "\033[32m
1 - All
2 - Install files
3 - Install packages
4 - exit\033[0m"
read -p 'Make your choice: ' data
if [ $data = 1 ]
then
	echo -e "\033[32mInstalling all\033[0m" 
	./pkgs_install.sh
	if [ $? = 1 ]
	then
		exit 1
	fi
	data=2
fi
if [ $data = 2 ]
then
	for name in ${install[@]}
	do
		echo -e "\033[32mCopy $name to Home\033[0m"
		cmp ~/$name $DIR$name
		if [ -d $name ]
		then
			diff -Naur ~/$name $DIR$name
		fi	
		if [ $? = 0 ]
		then
			echo -e "\033[33m$name are same\033[0m"

		elif [ -e ~/$name ]
		then
			echo -e "\033[33mYour old $name are move to backups\033[0m"
			mv ~/$name backups/
			ln -s $DIR$name ~/$name
		else
			ln -s $DIR$name ~/$name
		fi
	done
fi
if [ $data = 3 ]
then
	echo -e "\033[32mInstalling all\033[0m" 
	./pkgs_install.sh
	if [ $? = 1 ]
	then
		exit 1
	fi
fi
echo -e "\033[32mInstall was completed\033[0m"
source ~/.bashrc
exit 0
