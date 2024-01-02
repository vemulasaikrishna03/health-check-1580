#!/bin/bash

response=$(redis-cli ping)

if [ "$response" == "PONG" ]; then
    STATUS="Success"
else
    STATUS="Failure"
fi

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
OUTPUT='{"name":"redis","time":"'${TIMESTAMP}'","status":"'${STATUS}'"}'
echo "$OUTPUT"
