#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 '<compose command>'" >&2
    exit 1
fi

COMPOSE_CMD="$1"

run_statement() {
    local sql="$1"
    eval "$COMPOSE_CMD exec -T db psql -U docker -d django -c \"$sql\"" || true
}

echo "🔧 Cleaning up partially applied GeoSight migrations..."
run_statement "SET search_path TO public"
run_statement "DROP TABLE IF EXISTS geosight_data_indicatorrule CASCADE"
run_statement "DROP TABLE IF EXISTS geosight_data_dashboardbookmark CASCADE"
run_statement "DROP TABLE IF EXISTS geosight_data_dashboardbookmark_id_seq"
run_statement "DROP SCHEMA IF EXISTS geosight_data CASCADE"
run_statement "DROP SCHEMA IF EXISTS geosight_permission CASCADE"
run_statement "DROP SCHEMA IF EXISTS geosight_reference_dataset CASCADE"
run_statement "DROP SCHEMA IF EXISTS geosight_importer CASCADE"
run_statement "DROP SCHEMA IF EXISTS geosight_log CASCADE"
run_statement "DROP SCHEMA IF EXISTS geosight_georepo CASCADE"

echo "✅ Removed leftover tables/schemas"
