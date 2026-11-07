#!/bin/bash

echo "Which folder?"
read folder

current_date=$(date '+%Y-%m-%d')
backup_file="$folder-$current_date.tar.gz"

if [ -d "$folder" ]; then
  tar -czf "$backup_file" "$folder"
  if [ $? -eq 0 ]; then
    echo "$current_date - $folder - successful" >> backup.log
    echo "Backup is ready: $backup_file"
  else
    echo "$current_date - $folder - failed" >> backup.log
    echo "Backup failed"
    exit 1
  fi
else
  echo "Folder not found: $folder"
  exit 1
fi


