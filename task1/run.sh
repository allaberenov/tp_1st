#!/bin/bash

intput_folder=0
extension=0
backup_folder=0
backup_arch=0


while (( $# )); do

	echo $1
	case $1 in
	  --input_folder)
	  input_folder=$2
	    	;;

	  --extension)
	  extension=$2
		;;

	  --backup_folder)
	  backup_folder=$2
	    	;;
    
	  --backup_archive_name)
	  backup_archive=$2
	esac
	shift
	shift
done;

cp -r /$input_folder/ $backup_folder/
find $backup_folder -type f -not -name "*.$extension" -exec sudo rmz {} \;
find $input_folder -type d -empty -delete
tar -zcf $backup_archive "$backup_folder"
echo "done"
