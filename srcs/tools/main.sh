#! /bin/bash

BACKUP="$DIR/backup"
if	[ ! -d "$BACKUP" ]
then
	mkdir "$BACKUP"
fi

function back_it () {
	file=$1
	file_to_test=$2
	
}
