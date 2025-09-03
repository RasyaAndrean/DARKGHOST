# Sprint 0.2 Deliverables

## DarkGhost Development - September 2025

This document outlines all deliverables completed for Sprint 0.2 (September 3-16, 2025).

## Version

`v0.2.0-devnet`

## Deliverables Summary

### 1. Core Implementation

- ✅ RandomX v2 tweaks for enhanced ASIC resistance
- ✅ 3-node devnet setup with Docker Compose
- ✅ Discord faucet bot with slash commands
- ✅ Devnet explorer implementation
- ✅ RFC-001 ring-size vote preparation

### 2. Code Changes

- Enhanced RandomX v2 implementation in [src/consensus/](../src/consensus/)
- Created configuration files for all 3 nodes
- Implemented Docker Compose setup for devnet
- Developed Discord faucet bot with modern command support
- Built basic blockchain explorer with web interface

### 3. Documentation

- [RANDOMX_V2_TWEAKS.md](RANDOMX_V2_TWEAKS.md) - Detailed RandomX v2 modifications
- [DEVNET_EXPLORER.md](DEVNET_EXPLORER.md) - Explorer architecture and usage
- [RFC-001_RING_SIZE_VOTE.md](RFC-001_RING_SIZE_VOTE.md) - Ring size voting proposal
- [SPRINT_0_2_SUMMARY.md](SPRINT_0_2_SUMMARY.md) - Sprint completion summary
- Updated [README.md](../README.md) with devnet instructions

### 4. Configuration Files

- [docker-compose.devnet.yml](../docker-compose.devnet.yml) - Devnet Docker Compose configuration
- [darkghost.conf.node1](../darkghost.conf.node1) - Node 1 configuration
- [darkghost.conf.node2](../darkghost.conf.node2) - Node 2 configuration
- [darkghost.conf.node3](../darkghost.conf.node3) - Node 3 configuration

### 5. Scripts

- [scripts/devnet_up.sh](../scripts/devnet_up.sh) - Start devnet (Linux/macOS)
- [scripts/devnet_down.sh](../scripts/devnet_down.sh) - Stop devnet (Linux/macOS)
- [scripts/devnet_up.bat](../scripts/devnet_up.bat) - Start devnet (Windows)
- [scripts/devnet_down.bat](../scripts/devnet_down.bat) - Stop devnet (Windows)
- [scripts/start_explorer.sh](../scripts/start_explorer.sh) - Start explorer (Linux/macOS)
- [scripts/start_explorer.bat](../scripts/start_explorer.bat) - Start explorer (Windows)
- [scripts/faucet_bot.py](../scripts/faucet_bot.py) - Discord faucet bot
- [scripts/test_devnet.sh](../scripts/test_devnet.sh) - Devnet setup verification (Linux/macOS)
- [scripts/test_devnet.bat](../scripts/test_devnet.bat) - Devnet setup verification (Windows)

### 6. GitHub Integration

- [.github/ISSUE_TEMPLATE/rfc_template.md](../.github/ISSUE_TEMPLATE/rfc_template.md) - RFC template
- [.github/ISSUE_TEMPLATE/rfc-001-ring-size-vote.md](../.github/ISSUE_TEMPLATE/rfc-001-ring-size-vote.md) - RFC-001 issue template

### 7. Explorer Implementation

- Complete explorer directory structure in [explorer/](../explorer/)
- Node.js/Express web application
- EJS templates for UI rendering
- Bootstrap 5 responsive design
- Sample data for demonstration
- API endpoints for blockchain data

## Testing

All components have been verified:

- ✅ Configuration files are properly formatted
- ✅ Scripts are executable
- ✅ Docker Compose configuration is valid
- ✅ Explorer application structure is complete
- ✅ Faucet bot code compiles without errors

## Infrastructure Status

| Component          | Status | Access                              |
| ------------------ | ------ | ----------------------------------- |
| Node 1 (Bootstrap) | Ready  | localhost:18080 (P2P), :18081 (RPC) |
| Node 2 (Peer)      | Ready  | localhost:18083 (P2P), :18084 (RPC) |
| Node 3 (Peer)      | Ready  | localhost:18086 (P2P), :18087 (RPC) |
| Faucet Service     | Ready  | localhost:8080                      |
| Explorer           | Ready  | localhost:8080 (after start)        |
| Discord Bot        | Ready  | Run scripts/faucet_bot.py           |

## Prerequisites for Running

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

## Next Steps

The devnet is ready for:

1. Internal testing by the development team
2. Community RFC-001 voting (September 10-12, 2025)
3. Integration testing with CLI wallet (Sprint 0.3)
4. Performance benchmarking
5. Security review

## Contact

For questions about this release, contact:

- Rasya Andrean: rasyaandrean@outlook.co.id
