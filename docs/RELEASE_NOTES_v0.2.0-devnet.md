# Release Notes

## DarkGhost v0.2.0-devnet

### September 16, 2025

## Overview

This release establishes the devnet infrastructure for DarkGhost, enabling internal testing and community engagement. It includes enhanced RandomX v2 implementation, a 3-node Docker Compose setup, Discord faucet bot, basic blockchain explorer, and preparation for the RFC-001 ring-size vote.

## Features

### Core Implementation

- Enhanced RandomX v2 with ASIC-resistant tweaks
  - Increased scratchpad size to 2MB
  - Increased dataset size to 256MB
  - Increased program size to 512 instructions
  - Increased program iterations to 1024
  - Added DarkGhost-specific methods

### Devnet Infrastructure

- 3-node Docker Compose setup
  - Node 1: Bootstrap node
  - Node 2: Peer node
  - Node 3: Peer node
  - Integrated faucet service
  - Custom network with static IP assignments

### Community Tools

- Discord faucet bot with slash command support
- Basic blockchain explorer with web interface
- RFC-001 ring-size voting preparation

## Files Added

### Core Implementation

- `src/consensus/randomx_v2.h`
- `src/consensus/randomx_v2.cpp`
- `docs/RANDOMX_V2_TWEAKS.md`

### Configuration

- `docker-compose.devnet.yml`
- `darkghost.conf.node1`
- `darkghost.conf.node2`
- `darkghost.conf.node3`

### Scripts

- `scripts/devnet_up.sh`
- `scripts/devnet_down.sh`
- `scripts/devnet_up.bat`
- `scripts/devnet_down.bat`
- `scripts/start_explorer.sh`
- `scripts/start_explorer.bat`
- `scripts/faucet_bot.py`

### Explorer

- `explorer/` directory with complete structure
- `docs/DEVNET_EXPLORER.md`

### Community & Governance

- `docs/RFC-001_RING_SIZE_VOTE.md`
- `.github/ISSUE_TEMPLATE/rfc-001-ring-size-vote.md`
- `.github/ISSUE_TEMPLATE/rfc_template.md`

### Documentation

- `docs/SPRINT_0_2_SUMMARY.md`
- `docs/SPRINT_0_2_DELIVERABLES.md`
- `docs/RELEASE_NOTES_v0.2.0-devnet.md`
- `PHASE_02_COMPLETION.md`

## Prerequisites

1. Docker and Docker Compose
2. Node.js (for explorer)
3. Python 3.6+ (for faucet bot)
4. MongoDB (for explorer - optional in devnet)

## How to Use

### Starting the Devnet

```bash
# Linux/macOS
./scripts/devnet_up.sh

# Windows
scripts\devnet_up.bat
```

### Starting the Explorer

```bash
# Linux/macOS
./scripts/start_explorer.sh

# Windows
scripts\start_explorer.bat
```

### Running the Faucet Bot

```bash
python3 scripts/faucet_bot.py
```

## Known Issues

- Docker installation required for devnet
- MongoDB recommended for explorer (optional in devnet)
- Explorer is basic implementation, advanced features planned for future releases

## Next Release

v0.3.0-alpha will include:

- CLI wallet refactoring with Ring-size 11 default
- Bulletproofs+ audit
- Whitepaper v1.0 in LaTeX
- Finalized build matrix for Windows/macOS/Ubuntu
- Halving schedule documentation

## Changelog

### v0.2.0-devnet (2025-09-16)

- Initial devnet release
- Enhanced RandomX v2 implementation
- 3-node Docker Compose setup
- Discord faucet bot
- Basic blockchain explorer
- RFC-001 preparation

## Support

For issues with this release, please:

1. Check the documentation in `docs/`
2. File issues on GitHub
3. Contact the development team on Discord

## Security

This is a development release intended for testing purposes only. Do not use with real funds.
