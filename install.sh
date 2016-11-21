#! /bin/bash
source $DIR/settings.sh
source $DIR/srcs/packages/main.sh
DIALOG=${DIALOG=dialog}

fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
trap "rm -f $fichtemp" 0 1 2 5 15

function menu () {
$DIALOG --clear --title "DOTFILE INSTALLATION" \
		--menu "menu :" 20 51 4 \
		"all" ""\
		"install packages" ""\
		"install standard" ""\
		"extras"  "" 2> $fichtemp
valret=$?
choice=`cat $fichtemp`
}
while [ 1 ]
do
	menu
	case $valret in
	0)		case $choice in
			"all") echo '"$choice"';;
			"install packages") install_packages_standards;;
			"extras") echo '"not yet"';;
			esac;;
	1) 		break;;
	255) 	break;;
	esac
done
clear
