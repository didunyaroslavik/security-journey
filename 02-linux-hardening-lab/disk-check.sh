#!/bin/bash

THRESHOLD=80

echo "Checking disk usage ..."

USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "WARNING! Disk usage is more than ${THRESHOLD}%"
else
    echo "Disk usage is not greater than ${THRESHOLD}%"
fi