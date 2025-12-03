# Changelog

All notable changes to the GeoSight in-da-house project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial Justfile-based automation for GeoSight deployment on Raspberry Pi OS trixie 64-bit
- Comprehensive bilingual (English/Japanese) README.md documentation
- 12 Justfile tasks for complete lifecycle management:
  - `install`: Install dependencies, clone GeoSight-OS, create optimized configuration
  - `run`: Start GeoSight in development mode with Raspberry Pi optimizations
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
- License changed from MIT to CC0 1.0 Universal (Public Domain)
  - Aligns with UN Smart Maps Group conventions
  - Clarified that project only provides automation scripts, not GeoSight-OS modifications
  - AGPL copyleft does not apply as GeoSight-OS is not modified or redistributed

### Fixed
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
