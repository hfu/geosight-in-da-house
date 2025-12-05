# ARM64-compatible PostGIS Dockerfile
# Based on official postgis/postgis image which supports ARM64
# This replaces kartoza/postgis:13.0 which is AMD64-only

FROM postgis/postgis:13-3.4-alpine

# Install necessary tools for compatibility
# Note: postgresql tools are already included in the postgis base image
RUN apk add --no-cache \
    bash \
    && rm -rf /var/cache/apk/*

# Copy wrapper entrypoint to handle kartoza environment variables
COPY docker-entrypoint-wrapper.sh /docker-entrypoint-wrapper.sh
RUN chmod +x /docker-entrypoint-wrapper.sh

# Expose PostgreSQL port
EXPOSE 5432

# Use wrapper entrypoint
ENTRYPOINT ["/docker-entrypoint-wrapper.sh"]
CMD ["postgres"]

# Health check to verify PostgreSQL is accepting connections
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=3 \
    CMD pg_isready -h localhost || exit 1