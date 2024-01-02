#!/bin/bash

CELERY_BEAT_PID_FILE="celery-beat.pid"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Check if PID file exists
if [ -e "$CELERY_BEAT_PID_FILE" ]; then
    STATUS="Success"

else
    STATUS="Failure"
    
fi
OUTPUT='{"name":"Celery-beat","time":"'${TIMESTAMP}'","status":"'${STATUS}'"}'
echo "$OUTPUT"