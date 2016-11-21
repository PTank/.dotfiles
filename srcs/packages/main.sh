#! /bin/bash

function update () {
	sudo $PACKAGES_UPDATE
}

function upgrade () {
	sudo $PACKAGES_UPGRADE
}

function get_packages_list () {
	dir=$1
	list_all_packages=()

	files=(`find $dir -name packages.sh`)
	for file in ${files[@]}
	do
			source $file
			list_all_packages=(${list_all_packages[@]} ${packages[@]})
	done
	echo ${list_all_packages[@]}
}

function packages_standards () {
	result=($(get_packages_list "$DIR/packages.sh")
			$(get_packages_list "$DIR/apps/standards")) 
	echo ${result[@]}
}

function gauge_view () {
	packages=($1)
	if [ ${#packages[@]} -eq 0 ]
	then
		len=1
	else
		len=${#packages[@]}
	fi
	let "ratio=100/$len"
	echo "${packages[@]}"
	counter=0
	(
		for p in ${packages[@]}
		do
			echo "$counter"
			echo "XXX"
			echo "package(s): $p"
			echo "XXX"
			$PACKAGES_INSTALL $p 2>/dev/null
			((counter+=$ratio))
		done
	) | dialog --title "PACKAGES INSTALLATION" --gauge "Please wait" 7 70 0
}

function install_packages_standards () {
	# main function for standard install
	if $UPDATE
	then
		update
	fi
	if $UPGRADE
	then
		upgrade
	fi
	p=($(packages_standards))
	gauge_view "`echo "${p[@]}"`"
}

function install_packages_extra () {
	extra=($(get_packages_list $1))
	gauge_view "`echo "${extra[@]}"`"
}
