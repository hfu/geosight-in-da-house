# ARM64-compatible PostgreSQL Backup Dockerfile
# Based on Alpine Linux which supports ARM64
# This replaces kartoza/pg-backup:13.0 which is AMD64-only

FROM postgres:13-alpine

# Install necessary tools for backup operations
# Note: postgresql tools, gzip, and crond are already included in the postgres base image
RUN apk add --no-cache \
    bash \
    && rm -rf /var/cache/apk/*

# Create backup directory
RUN mkdir -p /backups

# Copy backup scripts
COPY backup.sh /backup.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /backup.sh /docker-entrypoint.sh

# Set working directory
WORKDIR /backups

# Volume for backups
VOLUME ["/backups"]

# Run the entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]
