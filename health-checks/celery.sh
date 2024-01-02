#!/bin/bash

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
PROJECT_NAME="project"  

# Check the Celery status using inspect ping
if celery -A "${PROJECT_NAME}" inspect ping; then
    STATUS="Success"
else
    STATUS="Failure"
fi

OUTPUT='{"name":"Celery","time":"'${TIMESTAMP}'","status":"'${STATUS}'"}'
echo "$OUTPUT"
