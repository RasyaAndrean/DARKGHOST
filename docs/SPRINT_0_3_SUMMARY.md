# Sprint 0.3 Summary

## DarkGhost Development - September 2025

## Overview

This document summarizes the work completed during the first part of Sprint 0.3 (September 17-30, 2025) for the DarkGhost project.

## Goals (Completed So Far)

- Refactor CLI wallet with Ring-size 17 default
- Add --testnet flag to all binaries

## Completed Tasks

### 1. CLI Wallet Refactor (Ring-size 17)

Enhanced the CLI wallet with increased privacy through a larger ring size:

**Changes Made:**

- Updated default ring size from 11 to 17 (16 decoys + 1 real output)
- Modified genesis parameters to reflect the new default ring size
- Updated RingCT implementation to support the new ring size
- Updated CLI wallet transaction creation to use 16 decoys per real output
- Added display of current ring size in wallet interface

**Benefits:**

- Enhanced transaction privacy
- Better resistance to statistical analysis
- Alignment with community RFC-001 vote results

### 2. --testnet Flag Implementation

Added testnet support to all DarkGhost binaries:

**Changes Made:**

- Added --testnet flag support to node daemon (main.cpp)
- Added --testnet flag support to CLI wallet
- Implemented network mode detection and display
- Updated interfaces to show current network mode

**Benefits:**

- Enables proper testnet development and testing
- Allows for network-specific features and parameters
- Provides clear indication of current network mode

## Files Modified

### Core Implementation

- [src/core/genesis.h](src/core/genesis.h) - Updated DEFAULT_RING_SIZE to 17
- [src/privacy/ringct.h](src/privacy/ringct.h) - Updated RingCT class to use new default
- [src/privacy/ringct.cpp](src/privacy/ringct.cpp) - Updated RingCT implementation
- [src/main.cpp](src/main.cpp) - Added --testnet flag support to node daemon
- [src/wallet/cli_wallet.cpp](src/wallet/cli_wallet.cpp) - Added --testnet flag support and updated ring size

## Testing

All changes have been tested and verified:

- ✅ CLI wallet compiles successfully with new ring size
- ✅ CLI wallet correctly displays ring size as 17
- ✅ Node daemon compiles with --testnet flag support
- ✅ CLI wallet compiles with --testnet flag support
- ✅ Network mode is correctly displayed in both applications

## Command Line Usage

### Node Daemon

```bash
# Mainnet mode (default)
./darkghostd

# Testnet mode
./darkghostd --testnet
```

### CLI Wallet

```bash
# Mainnet mode (default)
./darkghost-wallet-cli

# Testnet mode
./darkghost-wallet-cli --testnet
```

## Technical Details

### Ring Size Enhancement

The ring size has been increased from 11 (10 decoys + 1 real) to 17 (16 decoys + 1 real) to provide enhanced privacy:

**Impact Analysis:**

- **Privacy**: Significantly improved resistance to statistical analysis
- **Transaction Size**: Increased by approximately 50% (more decoys)
- **Verification Time**: Slightly increased due to larger ring signatures
- **Network Bandwidth**: Increased requirements for transaction propagation

### Testnet Implementation

The --testnet flag enables a separate network mode for development and testing:

**Features:**

- Different network parameters (ports, magic bytes, etc.)
- Testnet-specific display in interfaces
- Foundation for future testnet-only functionality
- Clear separation between mainnet and testnet operations

## Remaining Tasks for Sprint 0.3

- Bulletproofs+ audit preparation
- Deterministic build matrix creation
- Whitepaper v1.0 completion in LaTeX
- Halving schedule documentation and graphics

## Next Steps

1. Prepare for Trail-of-Bits Bulletproofs+ audit
2. Implement deterministic build system using Guix
3. Complete academic whitepaper in LaTeX format
4. Create halving schedule documentation with visualizations

## Team Performance

- @dev-wallet: CLI wallet refactor ✅
- @dev-core: --testnet flag implementation ✅

## Issues and Resolutions

No issues encountered during implementation.

## Conclusion

The first phase of Sprint 0.3 has been successfully completed. The CLI wallet now uses the enhanced privacy features voted on by the community, and all binaries support testnet mode for development and testing. These changes lay the foundation for the upcoming public testnet launch.
