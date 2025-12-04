# ARM64-compatible PostgreSQL Backup Dockerfile
# Based on Alpine Linux which supports ARM64
# This replaces kartoza/pg-backup:13.0 which is AMD64-only

FROM postgres:13-alpine

# Install necessary tools for backup operations
RUN apk add --no-cache \
    bash \
    postgresql-client \
    dcron \
    gzip \
    && rm -rf /var/cache/apk/*

# Create backup directory
RUN mkdir -p /backups

# Create backup script compatible with kartoza/pg-backup environment variables
RUN cat > /backup.sh << 'EOF'
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
    perform_backup "$db"
done

# Clean up old backups (keep last 30 days)
find /backups -name "${DUMPPREFIX}_*.dump" -mtime +30 -delete 2>/dev/null || true

echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup process completed"
EOF

RUN chmod +x /backup.sh

# Create cron job for daily backups at 2 AM
RUN echo "0 2 * * * /backup.sh >> /var/log/backup.log 2>&1" > /etc/crontabs/root

# Create entrypoint script
RUN cat > /docker-entrypoint.sh << 'EOF'
#!/bin/bash
set -e

echo "Starting PostgreSQL backup service..."
echo "Backup will run daily at 2 AM"
echo "Database: ${POSTGRES_DBNAME:-django}"
echo "Host: ${POSTGRES_HOST:-db}"
echo "User: ${POSTGRES_USER:-docker}"

# Create log file
touch /var/log/backup.log

# Perform initial backup
/backup.sh

# Start cron in foreground
exec crond -f -l 2
EOF

RUN chmod +x /docker-entrypoint.sh

# Set working directory
WORKDIR /backups

# Volume for backups
VOLUME ["/backups"]

# Run the entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]
