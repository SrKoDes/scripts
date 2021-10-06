#This is a script to backup a user's data on a Ubuntu Linux OS. This script can potentially take two arguemnts. ./backupsh (username) (destination folder)



#!/bin/bash

# This bash script is used to backup a user's home directory to /tmp/.

if [ -z $1 ]; then
        user=$(whoami)
else
        if [ ! -d "/home/$1" ]; then
                echo "Requested $1 user home directory doesn't exist."
                exit 1
        fi
        user=$1
fi

if [ -z $2 ]; then
        output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz
else
        if [ ! -d "$2" ]; then
                echo "Requested $2 directory doesn't exist."
		exit 1
        fi
        output=$2/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz
fi

input=/home/$user

# The function total_files reports a total number of files for a given directory. 
function total_files {
        find $1 -type f | wc -l
}

# The function total_directories reports a total number of directories
# for a given directory. 
function total_directories {
        find $1 -type d | wc -l
}

#This function reports the number of directories for a given archive
function total_archived_directories {
        tar -tzf $1 | grep  /$ | wc -l
}

#This function reports the number of files for a given archive
function total_archived_files {
        tar -tzf $1 | grep -v /$ | wc -l
}

tar -czf $output $input 2> /dev/null

src_files=$( total_files $input )
src_directories=$( total_directories $input )

arch_files=$( total_archived_files $output )
arch_directories=$( total_archived_directories $output )

echo "Files to be included: $src_files"
echo "Directories to be included: $src_directories"
echo "Files archived: $arch_files"
echo "Directories archived: $arch_directories"

if [ $src_files -le $arch_files ]; then
        echo "Backup of $input completed!"
        echo "Details about the output backup file:"
        ls -l $output
else
        echo "Backup of $input failed!"
fi

