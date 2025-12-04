#!/bin/bash
set -e

# Map kartoza/postgis environment variables to standard PostgreSQL variables
export POSTGRES_PASSWORD="${POSTGRES_PASS:-${POSTGRES_PASSWORD:-docker}}"
export POSTGRES_USER="${POSTGRES_USER:-docker}"
export POSTGRES_DB="${POSTGRES_DBNAME:-${POSTGRES_DB:-django}}"

# Call the original entrypoint
exec /usr/local/bin/docker-entrypoint.sh "$@"
