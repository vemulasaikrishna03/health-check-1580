#!/bin/bash


TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")


PG_ISREADY=$(command -v pg_isready)

if [ -x "$PG_ISREADY" ]; then
    if "$PG_ISREADY" -q -h localhost -p 5432; then
        STATUS="Success"
    else
        STATUS="Failure"
    fi
else
    STATUS="Failure"
fi

OUTPUT='{"name":"postgres-Sql","time":"'${TIMESTAMP}'","status":"'${STATUS}'"}'
echo "$OUTPUT"


