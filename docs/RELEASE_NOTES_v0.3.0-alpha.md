# Release Notes

## DarkGhost v0.3.0-alpha

### September 30, 2025

## Overview

This release completes Sprint 0.3 with significant enhancements to privacy features, testnet support, and development infrastructure. It includes CLI wallet refactoring with Ring-size 17, --testnet flag implementation, Bulletproofs+ audit preparation, deterministic build matrix, and foundational documentation for the whitepaper and halving schedule.

## Features

### Core Implementation

- CLI wallet refactored with Ring-size 17 default (RFC-001 community vote result)
- --testnet flag added to all binaries for development and testing
- Bulletproofs+ implementation prepared for Trail-of-Bits security audit
- Deterministic build matrix established for reproducible builds

### Privacy Enhancements

- Increased default ring size from 11 to 17 (16 decoys + 1 real)
- Enhanced transaction privacy with 63.5% community preference
- Better resistance to statistical analysis
- Improved unlinkability between transactions

### Development Infrastructure

- Testnet support with --testnet flag
- Comprehensive audit preparation for Bulletproofs+
- Deterministic build matrix for Windows, macOS, and Ubuntu
- Updated build and test scripts

### Documentation

- Whitepaper foundation with LaTeX template
- Halving schedule documentation with visualizations
- Comprehensive sprint documentation
- Updated build and testing guides

## Files Added/Modified

### Core Implementation

- [src/core/genesis.h](src/core/genesis.h) - Updated DEFAULT_RING_SIZE to 17
- [src/privacy/ringct.h](src/privacy/ringct.h) - Updated RingCT class
- [src/privacy/ringct.cpp](src/privacy/ringct.cpp) - Updated RingCT implementation
- [src/main.cpp](src/main.cpp) - Added --testnet flag support
- [src/wallet/cli_wallet.cpp](src/wallet/cli_wallet.cpp) - Added --testnet flag and updated ring size

### Documentation

- [docs/SPRINT_0_3_FINAL.md](SPRINT_0_3_FINAL.md) - Sprint completion summary
- [docs/RFC-001_RESULTS.md](RFC-001_RESULTS.md) - Voting results
- [docs/BULLETPROOFS_AUDIT_PREP.md](BULLETPROOFS_AUDIT_PREP.md) - Audit preparation
- [docs/BUILD_AND_TEST.md](BUILD_AND_TEST.md) - Development guide
- [docs/HALVING_SCHEDULE.md](HALVING_SCHEDULE.md) - Emission model
- [docs/HALVING_SCHEDULE_GRAPH.md](HALVING_SCHEDULE_GRAPH.md) - Visualizations

### Tests

- [src/tests/bulletproofs_test.cpp](src/tests/bulletproofs_test.cpp) - Bulletproofs unit tests

### Build System

- [CMakeLists.txt](CMakeLists.txt) - Updated build configuration
- [scripts/build_and_test_bp.sh](scripts/build_and_test_bp.sh) - Unix build script
- [scripts/build_and_test_bp.bat](scripts/build_and_test_bp.bat) - Windows build script
- [scripts/build_matrix.sh](scripts/build_matrix.sh) - Deterministic build matrix
- [scripts/build_matrix.bat](scripts/build_matrix.bat) - Windows build matrix

### Whitepaper

- [whitepaper/whitepaper_v1.0.tex](whitepaper/whitepaper_v1.0.tex) - LaTeX template
- [whitepaper/compile.sh](whitepaper/compile.sh) - Unix compilation script
- [whitepaper/compile.bat](whitepaper/compile.bat) - Windows compilation script

## Prerequisites

1. C++11 compatible compiler
2. CMake 3.10 or higher
3. Make build system (or MinGW-w64 on Windows)
4. Git
5. Optional: GNU Guix for deterministic builds
6. Optional: LaTeX for whitepaper compilation

## How to Use

### Building DarkGhost

```bash
# Create build directory
mkdir build && cd build

# Configure with CMake
cmake ..

# Build all targets
make
```

### Running Node Daemon

```bash
# Mainnet mode (default)
./build/darkghostd

# Testnet mode
./build/darkghostd --testnet
```

### Running CLI Wallet

```bash
# Mainnet mode (default)
./build/darkghost_wallet

# Testnet mode
./build/darkghost_wallet --testnet
```

### Testing

```bash
# Run Bulletproofs tests
cd build
make bulletproofs_test
./bulletproofs_test
```

## Known Issues

- Whitepaper v1.0 PDF not yet compiled
- Halving schedule graphics not yet finalized
- Bulletproofs+ audit pending with Trail-of-Bits
- Deterministic builds require GNU Guix installation

## Next Release

v1.0.0-testnet will include:

- Public testnet launch
- Genesis block ceremony
- Mining pool reference implementation
- Exchange listing preparation
- Hardware wallet integration

## Changelog

### v0.3.0-alpha (2025-09-30)

- CLI wallet refactored with Ring-size 17 default
- --testnet flag added to all binaries
- Bulletproofs+ audit preparation completed
- Deterministic build matrix established
- Whitepaper foundation created
- Halving schedule documentation completed

### v0.2.0-devnet (2025-09-16)

- Enhanced RandomX v2 implementation
- 3-node Docker Compose devnet setup
- Discord faucet bot with slash commands
- Basic blockchain explorer
- RFC-001 preparation

### v0.1.0-alpha (2025-09-10)

- Initial release with core functionality
- UTXO model implementation
- RandomX v2 consensus
- RingCT privacy features
- CLI wallet

## Support

For issues with this release, please:

1. Check the documentation in [docs/](docs/)
2. File issues on GitHub
3. Contact the development team on Discord

## Security

This is an alpha release intended for testing purposes only. Do not use with real funds.
The Bulletproofs+ implementation has been prepared for security audit but not yet completed.

## Community

Join our community to stay updated on developments:

- Discord: `discord.gg/darkghost`
- Telegram: `t.me/darkghostcoin`
- Reddit: `r/darkghost`
- GitHub: `github.com/RasyaAndrean/DARKGHOST`
