#!/bin/bash
#finall.sh

backup_output=$1
# getting information
 echo enter path
 read backup_path
 echo enter type of file
 read file_type
 
 # path validation 
 
 if [ ! -d "$backup_path" ]; then
 
 	echo path is not valid
 	exit 1
 fi
 
 # clear backup.conf
 > backup.conf
 
 # search file
 find "$backup_path" -type f -name "*$file_type" >> backup.conf
 
 echo DONE
 

