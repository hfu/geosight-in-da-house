# ARM64-compatible PostGIS Dockerfile
# Based on official postgis/postgis image which supports ARM64
# This replaces kartoza/postgis:13.0 which is AMD64-only

FROM postgis/postgis:13-3.4-alpine

# Install necessary tools for compatibility
RUN apk add --no-cache \
    bash \
    postgresql-client \
    && rm -rf /var/cache/apk/*

# Create wrapper entrypoint to handle kartoza environment variables
RUN cat > /docker-entrypoint-wrapper.sh << 'EOF'
#!/bin/bash
set -e

# Map kartoza/postgis environment variables to standard PostgreSQL variables
export POSTGRES_PASSWORD="${POSTGRES_PASS:-${POSTGRES_PASSWORD:-docker}}"
export POSTGRES_USER="${POSTGRES_USER:-docker}"
export POSTGRES_DB="${POSTGRES_DBNAME:-${POSTGRES_DB:-django}}"

# Call the original entrypoint
exec /usr/local/bin/docker-entrypoint.sh "$@"
EOF

RUN chmod +x /docker-entrypoint-wrapper.sh

# Expose PostgreSQL port
EXPOSE 5432

# Use wrapper entrypoint
ENTRYPOINT ["/docker-entrypoint-wrapper.sh"]
CMD ["postgres"]

# Health check to verify PostgreSQL is ready
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=3 \
    CMD pg_isready -U docker -d django || exit 1

