#!/bin/bash
#finall.sh

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
