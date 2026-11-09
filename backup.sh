#!/bin/bash

# Configuration
BACKUP_DIR="$HOME/backups"
LOG_FILE="$HOME/backup.log"
RETENTION_DAYS=7
folder="$1"

if [ -z "$1" ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi


current_date=$(date '+%Y-%m-%d %H:%M:%S')
folder_name=$(basename "$folder")
timestamp=$(date '+%H%M%S')
backup_file="$BACKUP_DIR/$folder_name-$(date '+%Y-%m-%d')-$timestamp.tar.gz"

# Ensure backup destination directory exists
mkdir -p "$BACKUP_DIR"

if [ -d "$folder" ]; then
  tar -czf "$backup_file" "$folder"
  if [ $? -eq 0 ]; then
    echo "$current_date - $folder - successful" >> "$LOG_FILE"
    echo "Backup is ready: $backup_file"
  else
    echo "$current_date - $folder - failed" >> "$LOG_FILE"
    echo "Backup failed"
    exit 1
  fi
else
  echo "Folder not found: $folder"
  exit 1
fi

# Retention Policy: Delete archives older than 7 days
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +$RETENTION_DAYS -delete
echo "$current_date - Retention purge executed (files >$RETENTION_DAYS days: removed)" >> "$LOG_FILE"

