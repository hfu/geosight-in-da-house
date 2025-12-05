# Copilot Instructions for geosight-in-da-house

- Target environment is Raspberry Pi OS 64-bit on Raspberry Pi 4B; prefer ARM64-friendly defaults and avoid AMD64-only images unless explicitly gated by architecture checks.
- Use Docker Compose V2 (`docker compose`), not the old `docker-compose`; do not add a `version:` key to new Compose snippets since it is obsolete.
- The ARM64 override file is `deployment/docker-compose.override.arm64.yml`; ensure it stays plain YAML (no Markdown fences) and keeps service-level `platform: linux/arm64` plus build contexts under `deployment/dockerfiles/`.
- `DOCKER_DEFAULT_PLATFORM` should be set based on `uname -m` (arm64/aarch64 -> linux/arm64, otherwise linux/amd64) before builds; keep the helper that refreshes ARM64 overrides in the `run` recipe.
- Preserve idempotent setup: only overwrite generated files when missing or clearly invalid (e.g., fenced YAML); avoid clobbering user-customized overrides without good reason.
- If adding new automation, mirror the existing style: bash with `set -euo pipefail`, explicit echo logging, and Raspberry Pi–friendly timeouts.
