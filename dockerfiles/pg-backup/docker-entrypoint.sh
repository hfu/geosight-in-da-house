#!/bin/bash
set -e

# Set backup schedule from environment variable (default: daily at 2 AM)
BACKUP_CRON_SCHEDULE="${BACKUP_CRON_SCHEDULE:-0 2 * * *}"

echo "Starting PostgreSQL backup service..."
echo "Backup schedule: ${BACKUP_CRON_SCHEDULE}"
echo "Database: ${POSTGRES_DBNAME:-django}"
echo "Host: ${POSTGRES_HOST:-db}"
echo "User: ${POSTGRES_USER:-docker}"

# Create log file
touch /var/log/backup.log

# Setup cron job with configurable schedule
echo "${BACKUP_CRON_SCHEDULE} /backup.sh >> /var/log/backup.log 2>&1" > /etc/crontabs/root

# Wait for database to be ready before performing initial backup
echo "Waiting for database to be ready..."
MAX_ATTEMPTS=24  # 2 minutes total (24 × 5 seconds)
ATTEMPT=0
while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    ATTEMPT=$((ATTEMPT + 1))
    if PGPASSWORD="${POSTGRES_PASS:-docker}" pg_isready -h "${POSTGRES_HOST:-db}" -p "${POSTGRES_PORT:-5432}" -U "${POSTGRES_USER:-docker}" &>/dev/null; then
        echo "Database is ready!"
        break
    fi
    echo "Attempt $ATTEMPT/$MAX_ATTEMPTS - waiting 5 seconds..."
    sleep 5
done

if [ $ATTEMPT -eq $MAX_ATTEMPTS ]; then
    echo "WARNING: Database not ready after $MAX_ATTEMPTS attempts. Backup service will continue, but initial backup may fail."
fi

# Perform initial backup
/backup.sh || echo "Initial backup failed, but service will continue for scheduled backups"

# Start cron in foreground
exec crond -f -l 2
