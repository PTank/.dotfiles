#!/bin/bash
##################################
# AUTHOR:   p-tank
# FILE:     install.sh
# CREATED:  15:47:44 16/08/2013
# MODIFIED: 17:54:27 16/08/2013
##################################

DIR=~/.dotfiles/
FILE=1
install=(
	.vimrc
	.bashrc
	)
if	[ ! -d "$DIR"backups ]
then
	mkdir "$DIR"backups
fi

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
		if [ -d ~/$name ]
		then
			diff -Naur ~/$name $DIR$name
		elif [ -e ~/$name ]
		then
			cmp ~/$name $DIR$name
		else
			ln -s $DIR$name ~/$name
			FILE=0
		fi	
		if [ $? = 0 ] && [ $FILE != 0 ]
		then
			echo -e "\033[33m$name are same\033[0m"
		elif [ -e ~/$name ] && [ $FILE != 0 ]
		then
			echo -e "\033[33mYour old $name are move to backups\033[0m"
			mv ~/$name $DIRbackups/
			ln -s $DIR$name ~/$name
		fi
	done
	if [ ! -d ~/.vim ]; then mkdir -p ~/.vim ;fi
	if [ ! -d ~/.vim/bundle ]; then mkdir -p ~/.vim/bundle ;fi
	if [ ! -e ~/.vim/bundle/Vundle.vim ]
	then
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		vim +BundleInstall +qall!
	fi
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
