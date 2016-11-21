#! /bin/bash

function list_standard_apps () {
	apps=(`ls "$DIR/apps/standards"`)
	echo "${apps[@]}"
}

function install_box () {
	dialog --title "Install" \
			--infobox "$1" 7 70
	$1 2>/dev/null
}

function install_app () {
	if [ $1 ]
	then
		app=($1)
		dir=$DIR/apps/extras
	else
		app=($(list_standard_apps))
		dir=$DIR/apps/standards
	fi
	for app in ${apps[@]}
	do
		install_packages_extra $dir/$app
		install_box $dir/$app/app.sh
	done
}
