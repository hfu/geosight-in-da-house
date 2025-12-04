# Changelog

All notable changes to the GeoSight in-da-house project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **ARM64 Build System**: Custom Dockerfiles for ARM64-incompatible images
  - `dockerfiles/postgis/Dockerfile`: ARM64-compatible PostGIS based on official postgis/postgis:13-3.4-alpine
  - `dockerfiles/pg-backup/Dockerfile`: ARM64-compatible PostgreSQL backup service
  - Template docker-compose override file for ARM64 builds
  - Automatic copying of ARM64 Dockerfiles during installation
  - Automatic building of ARM64 images before first run
- **Build Automation**: 
  - Automatic detection of ARM64 architecture and build trigger
  - Progress messages for long-running ARM64 builds (15-30 minutes on Raspberry Pi)
  - Docker image caching for subsequent runs (reduces startup to 10-15 minutes)
- **Documentation Updates**:
  - Updated troubleshooting section with Dockerfile-based build approach
  - Added timing information for initial ARM64 builds
  - Clarified that emulation is avoided in favor of native ARM64 builds
- ARM64-specific docker-compose override file (`docker-compose.override.arm64.yml`) for explicit platform specification
- Automatic generation of ARM64 platform override during installation
- Platform-aware docker-compose command construction for all operations (run, restart, status, logs)
- Enhanced troubleshooting documentation for kartoza/postgis ARM64 compatibility
- Automatic platform detection and configuration for Docker (ARM64/AMD64)
- Robust database readiness check using `pg_isready` before initialization
- Platform-specific troubleshooting guidance in README.md
- Comprehensive "Why This Project is Valuable" section in README.md explaining:
  - Democratization of geospatial technology
  - Edge computing demonstration
  - Setup automation benefits
  - Contribution to UN Smart Maps community
  - Practical use cases (disaster response, field work, education, development)
- Initial Justfile-based automation for GeoSight deployment on Raspberry Pi OS trixie 64-bit
- Comprehensive bilingual (English/Japanese) README.md documentation
- 12 Justfile tasks for complete lifecycle management:
  - `install`: Install dependencies, clone GeoSight-OS, create optimized configuration, copy ARM64 Dockerfiles
  - `run`: Build ARM64 images (if needed), start GeoSight in development mode with Raspberry Pi optimizations
  - `stop`: Stop GeoSight containers
  - `restart`: Restart GeoSight services
  - `uninstall`: Remove GeoSight installation completely
  - `tunnel`: Create Cloudflare Tunnel for internet access
  - `doit`: One-command full setup (install + run with docker group handling)
  - `status`: Show container status
  - `logs`: View container logs
  - `shell`: Access Django shell
  - `clean`: Clean up unused Docker resources
  - `info`: Display system information
- Raspberry Pi 4B specific optimizations:
  - Extended Docker timeouts (300s) for slower I/O
  - Reduced log rotation (7 days, 50MB) for storage constraints
  - Minimal plugin configuration (cloud_native_gis, reference_dataset)
- Security enhancements:
  - Random generation of SECRET_KEY (50 characters)
  - Random generation of DATABASE_PASSWORD (16 characters)
  - Random generation of REDIS_PASSWORD (16 characters)
  - Prominent warnings to change admin password after first login
- Docker group membership handling with proper exit codes
- Integration notes for niroku (UNVT Portable)
- .gitignore to exclude cloned GeoSight-OS directory and temporary files

### Changed
- **ARM64 Strategy**: Changed from platform override/emulation to native Dockerfile builds
  - Replaces `kartoza/postgis:13.0` with custom build based on `postgis/postgis:13-3.4-alpine`
  - Replaces `kartoza/pg-backup:13.0` with custom Alpine-based backup service
  - Ensures native ARM64 execution without emulation overhead
- All docker-compose commands now use ARM64 override file when on ARM64 architecture
- Platform detection now creates a dedicated override file instead of relying solely on environment variables
- Replaced simple 60-second sleep with intelligent database health check
- Database initialization now waits up to 5 minutes with proper health verification
- `DOCKER_DEFAULT_PLATFORM` environment variable automatically set based on architecture
- Enhanced error messages with actionable troubleshooting steps
- Improved service startup reliability by verifying database readiness before initialization
- License changed from MIT to CC0 1.0 Universal (Public Domain)
  - Aligns with UN Smart Maps Group conventions
  - Clarified that project only provides automation scripts, not GeoSight-OS modifications
  - AGPL copyleft does not apply as GeoSight-OS is not modified or redistributed

### Fixed
- **Critical**: Fixed `kartoza/postgis:13.0` platform mismatch error on ARM64 by building from ARM64-compatible Dockerfile
- **Critical**: Fixed `kartoza/pg-backup:13.0` unavailability on ARM64 by building from custom Dockerfile
- **Critical**: Eliminated emulation overhead by using native ARM64 builds instead of platform override
- **Critical**: Fixed platform mismatch error on ARM64 systems by setting `DOCKER_DEFAULT_PLATFORM`
- **Critical**: Fixed "could not translate host name 'db'" error by implementing proper database readiness checks
- Improved container startup reliability by waiting for actual service readiness instead of fixed timeouts
- Added proper exit codes and error handling for database connection failures
- Removed unused `_generate-secret-key` recipe from Justfile
- Fixed variable name inconsistency: REDIS_PASS → REDIS_PASSWORD throughout
- Fixed exit code handling in docker group addition (exit 2 for proper doit task handling)
- Fixed doit task exit code when docker group requires re-login (exit 0 instead of 2)
- Improved error messages for docker permission issues

### Security
- All sensitive credentials (SECRET_KEY, DATABASE_PASSWORD, REDIS_PASSWORD) are randomly generated using OpenSSL
- Clear warnings about changing default admin password (admin/admin)
- Documentation of security considerations for Cloudflare Tunnel usage
- Notes about production security requirements

## Background

This project was created based on knowledge gained from [UNopenGIS/7 issue #821](https://github.com/UNopenGIS/7/issues/821), which documented the correct setup sequence for GeoSight-OS:

```bash
make setup
make dev
make dev-initialize
make load-test-data
```

The project provides automation and Raspberry Pi-specific optimizations around this core GeoSight-OS setup process.

## References

- GeoSight-OS: https://github.com/unicef-drp/GeoSight-OS
- GeoSight Documentation: https://unicef-drp.github.io/GeoSight-OS-Documentation/
- UNopenGIS/7 Issue #821: https://github.com/UNopenGIS/7/issues/821
- niroku (UNVT Portable): https://github.com/unvt/niroku
- just command runner: https://github.com/casey/just

## Acknowledgments

- **UNICEF** - GeoSight development and publication
- **Kartoza** - GeoSight technical development
- **@yuiseki** - Discovery and sharing of GeoSight setup procedures in UNopenGIS/7#821
- **UN Smart Maps Community** - Promoting open geospatial technology
