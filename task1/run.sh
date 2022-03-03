#!/bin/bash

intput_folder=0
extension=0
backup_folder=0
backup_arch=0



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
    backup_arch=$2
esac

case $3 in

  --input_folder)
    input_folder=$4
    ;;

  --extension)
    extension=$4
    ;;

  --backup_folder)
    backup_folder=$4
    ;;
    
    --backup_archive_name)
    backup_arch=$3
esac

case $5 in

  --input_folder)
    input_folder=$6
    ;;

  --extension)
    extension=$6
    ;;

  --backup_folder)
    backup_folder=$6
    ;;
    
    --backup_archive_name)
    backup_arch=$6
esac

case $7 in

  --input_folder)
    input_folder=$8
    ;;

  --extension)
    extension=$8
    ;;

  --backup_folder)
    backup_folder=$8
    ;;
    
    --backup_archive_name)
    backup_arch=$8
esac

#echo "$input_folder $extension $backup_folder $backup_arch"


mkdir $backup_folder
find $input_folder -name "*.$extension" -exec cp {} "$backup_folder" \; 
tar -zcf $backup_arch "$backup_folder"
echo "done"
