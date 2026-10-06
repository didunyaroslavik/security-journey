#!/bin/bash
# Finds invalid SSH login attempts and warns about repeat offenders

LOGFILE="/var/log/auth.log"
THRESHOLD=2

echo "Checking for invalid SSH login attempts..."

grep "Invalid user" "$LOGFILE" | awk '{print $8}' | sort | uniq -c | while read count ip; do
    echo "$ip attempted $count time(s)"
    if [ "$count" -gt "$THRESHOLD" ]; then
        echo " -> WARNING: $ip exceeds the threshold of $THRESHOLD attempts!"
    fi
done