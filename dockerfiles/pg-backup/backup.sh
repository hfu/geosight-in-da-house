#!/bin/bash
set -e

# Environment variables from kartoza/pg-backup
POSTGRES_HOST=${POSTGRES_HOST:-db}
POSTGRES_PORT=${POSTGRES_PORT:-5432}
POSTGRES_USER=${POSTGRES_USER:-docker}
POSTGRES_PASS=${POSTGRES_PASS:-docker}
POSTGRES_DBNAME=${POSTGRES_DBNAME:-django}
DUMPPREFIX=${DUMPPREFIX:-PG_backup}
DBLIST=${DBLIST:-$POSTGRES_DBNAME}

# Function to perform backup
perform_backup() {
    local dbname=$1
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local filename="${DUMPPREFIX}_${dbname}_${timestamp}.dump"
    
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting backup of database: ${dbname}"
    
    PGPASSWORD="${POSTGRES_PASS}" pg_dump \
        -h "${POSTGRES_HOST}" \
        -p "${POSTGRES_PORT}" \
        -U "${POSTGRES_USER}" \
        -d "${dbname}" \
        -Fc \
        -f "/backups/${filename}"
    
    if [ $? -eq 0 ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup completed: ${filename}"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup failed for database: ${dbname}"
        exit 1
    fi
}

# Backup all databases in DBLIST
IFS=',' read -ra DBS <<< "$DBLIST"
for db in "${DBS[@]}"; do
    db=$(echo "$db" | xargs)
    perform_backup "$db"
done

# Clean up old backups (configurable retention period, default: 30 days)
BACKUP_RETENTION_DAYS="${BACKUP_RETENTION_DAYS:-30}"
find /backups -name "${DUMPPREFIX}_*.dump" -mtime +${BACKUP_RETENTION_DAYS} -delete 2>/dev/null || true

echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup process completed"
