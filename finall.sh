#!/bin/bash
#finall.sh

backup_output=$1
if [ ! -d "$backup_output" ]; then
	echo"creating dir..."
	mkdir -p "$backup_output"
fi

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

#generate backup file name with date and time 
timestamp=$(date "+%Y-%m-%d_%H-%M-%S")
backup_filename="backup_$timestamp.tar.gz"
backup_full_path="$backup_output/$backup_filename"
log_file="$backup_output/backup.log"

# start time
start_time=$(date +%s)

if  tar -czf "$backup_full_path" -T backup.conf;then
	#end time
	end_time=$(date +%s)
	duration=$((end_time - start_time))
	
	#calculating backup file size
	backup_size=$(du -h "$backup_full_path" | cut -f1)
	echo "[$(date '+%Y-%m-%d %H:%N:%S')] backing up successfuly done: $backup_filename | size: $backup_size | duration: ${duration}s" >> "$log_file"
	echo backing up successfuly done
	echo bakcup log saved
else
		echo "[$(date '+%Y-%m-%d %H:%N:%S')] error executing backup operation $backup_path " >> "$loge_file"
		echo error executing backup operation
		exit 1
fi
