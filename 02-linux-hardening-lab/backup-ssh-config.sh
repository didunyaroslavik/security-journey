#!/bin/bash
# Backs up /etc/ssh/ into a timestamped, compressed archive

SOURCE_DIR="/etc/ssh"
BACKUP_DIR="$HOME/backups"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/ssh-backup-$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"
sudo tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

echo "Backup saved to $BACKUP_FILE"