#!/bin/bash

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

if curl -f http://127.0.0.1:8000/; then
    STATUS="Success"
else
    STATUS="Failure"    
fi
OUTPUT='{"name":"Nginx-server","time":"'${TIMESTAMP}'","status":"'${STATUS}'"}' 
echo "$OUTPUT"
#todo::send the output to dashbord
