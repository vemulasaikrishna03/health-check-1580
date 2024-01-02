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


PGHOST="localhost"
PGPORT="5432"
PGUSER="postgres"
PGDATABASE="template1"


Checking database connection

psql -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE -tAc "SELECT 1" >/dev/null 2>&1
if [ $? -eq 0 ]; then
   STATUS="Success"
else
    STATUS="Failure"    
fi

OUTPUT='{"name":"Database-Connection for postgres-Sql","time":"'${TIMESTAMP}'","status":"'${STATUS}'"}'
echo "$OUTPUT"


Check active connections
echo "Checking active connections..."
psql -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE -tAc "SELECT count(*) FROM pg_stat_activity;" 

Check disk space usage
echo "Checking disk space usage..."
df -h $PGDATA 
