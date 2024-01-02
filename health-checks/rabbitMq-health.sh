#!/bin/bash

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

if curl -f http://localhost:5672; then
    STATUS="Success"
else
    STATUS="Failure"    
fi
OUTPUT='{"name":"rabbtMq","time":"'${TIMESTAMP}'","status":"'${STATUS}'"}' 
echo "$OUTPUT"
#todo::send the output to dashbord
