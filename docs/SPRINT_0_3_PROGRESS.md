# Sprint 0.3 Progress Report

## DarkGhost Development - September 2025

## Overview

This document tracks the progress of Sprint 0.3 (September 17-30, 2025) for the DarkGhost project.

## Completed Tasks

### 1. CLI Wallet Refactor (Ring-size 17)

- Updated default ring size from 11 to 17 (16 decoys + 1 real)
- Modified genesis parameters to reflect new default
- Updated RingCT implementation to support new ring size
- Updated CLI wallet to use new ring size for transactions
- Added display of current ring size in wallet interface

### 2. --testnet Flag Implementation

- Added --testnet flag support to node daemon (main.cpp)
- Added --testnet flag support to CLI wallet
- Implemented network mode detection and display
- Updated wallet interface to show current network mode

## Files Modified

### Core Implementation

- [src/core/genesis.h](src/core/genesis.h) - Updated DEFAULT_RING_SIZE to 17
- [src/privacy/ringct.h](src/privacy/ringct.h) - Updated RingCT class to use new default
- [src/privacy/ringct.cpp](src/privacy/ringct.cpp) - Updated RingCT implementation
- [src/main.cpp](src/main.cpp) - Added --testnet flag support to node daemon
- [src/wallet/cli_wallet.cpp](src/wallet/cli_wallet.cpp) - Added --testnet flag support and updated ring size

## Testing

Both changes have been tested and verified:

- ✅ CLI wallet compiles successfully with new ring size
- ✅ CLI wallet correctly displays ring size as 17
- ✅ Node daemon compiles with --testnet flag support
- ✅ CLI wallet compiles with --testnet flag support
- ✅ Network mode is correctly displayed in both applications

## Next Tasks

- Prepare for Bulletproofs+ audit
- Create deterministic build matrix
- Complete whitepaper v1.0 in LaTeX
- Create halving schedule documentation and graphics

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

### Ring Size Change

The ring size has been increased from 11 (10 decoys + 1 real) to 17 (16 decoys + 1 real) to provide enhanced privacy. This change affects:

- Transaction privacy level
- Transaction size
- Verification time
- Network bandwidth requirements

### Testnet Flag

The --testnet flag enables testnet mode for both the node daemon and CLI wallet. In testnet mode:

- Different network parameters are used
- Testnet-specific features can be enabled
- Network mode is displayed in the interface
- Future testnet-only functionality can be added

## Team Performance

- @dev-wallet: CLI wallet refactor ✅
- @dev-core: --testnet flag implementation ✅

## Issues and Resolutions

No issues encountered during implementation.
