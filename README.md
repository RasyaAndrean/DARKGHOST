<p align="center">
  <img src="assets/logo.svg" width="200" alt="DarkGhost Logo">
</p>

# DarkGhost [DG] - Hybrid Privacy Cryptocurrency

[![Build Status](https://github.com/RasyaAndrean/DARKGHOST/workflows/Build%20and%20Test/badge.svg)](https://github.com/RasyaAndrean/DARKGHOST/actions)

## Overview

DarkGhost is a revolutionary hybrid cryptocurrency that combines the best features of Bitcoin and Monero. It implements Bitcoin's UTXO model for scalability and efficiency while incorporating Monero's advanced privacy features to ensure complete transaction confidentiality.

**Creator**: Rasya Andrean
**Email**: rasyaandrean@outlook.co.id

## Key Features

### Blockchain Architecture

- **UTXO Model**: Bitcoin-style unspent transaction output model for efficient transaction processing
- **Fixed Supply**: Limited to 100 million DG tokens with no inflation
- **Fast Blocks**: 2-minute block time for rapid transaction confirmation
- **Dynamic Sizing**: Blocks automatically adjust size based on network demand

### Consensus Mechanism

- **RandomX v2**: CPU-friendly, ASIC-resistant mining algorithm
- **Proof of Work**: Secure and decentralized consensus mechanism
- **Difficulty Adjustment**: Maintains consistent 2-minute block intervals

### Privacy Features

- **RingCT**: Ring Confidential Transactions with 11-ring size (10 decoys + 1 real)
- **Bulletproofs**: Efficient range proofs that reduce transaction size by 80%
- **Stealth Addresses**: One-time addresses for each transaction to prevent linking
- **Unlinkability**: No connection between sender and recipient addresses

## Technical Specifications

| Feature      | Specification                           |
| ------------ | --------------------------------------- |
| Consensus    | RandomX v2 Proof of Work                |
| Block Time   | 120 seconds (2 minutes)                 |
| Block Reward | Starts at 50 DG, halves every 4 years   |
| Total Supply | 100,000,000 DG                          |
| Ring Size    | 11 (10 decoys + 1 real)                 |
| Privacy      | RingCT, Bulletproofs, Stealth Addresses |
| Mining       | CPU-only, ASIC-resistant                |

## Directory Structure

```
DarkGhost/
├── src/                    # Source code organized by modules
│   ├── core/              # Core blockchain functionality
│   ├── consensus/         # Consensus algorithms (RandomX v2)
│   ├── privacy/           # Privacy features (RingCT, Bulletproofs)
│   ├── wallet/            # Wallet functionality
│   ├── tests/             # Test suite
│   ├── darkghost.h        # Main header file
│   └── main.cpp           # Main entry point
├── build/                 # Build directory with compiled binaries
├── docs/                  # Documentation files (.md)
├── scripts/               # Scripts and build tools (.bat, .sh)
├── Dockerfile             # Containerization configuration
└── CMakeLists.txt         # CMake build configuration
```

## Getting Started

### Prerequisites

See [BUILD_REQUIREMENTS.md](docs/BUILD_REQUIREMENTS.md) for detailed build requirements.

- C++11 compatible compiler (g++, clang++, etc.)
- CMake 3.10 or higher
- Make build system
- For Windows: MinGW-w64 or Visual Studio with C++ support

### Building DarkGhost

#### Windows

```cmd
cd scripts
build.bat
```

#### Linux/macOS

```bash
mkdir build && cd build
cmake ..
make
```

### Running DarkGhost

#### Node

```cmd
cd build
darkghostd
```

#### Wallet

```cmd
cd build
darkghost_wallet
```

## Documentation

All documentation is available in the [docs/](docs/) directory:

- [API Documentation](docs/API.md)
- [Architecture Overview](docs/ARCHITECTURE.md)
- [CLI Guide](docs/CLI.md)
- [Wallet Guide](docs/WALLET.md)
- [Mining Guide](docs/MINING.md)
- [Performance Optimization](docs/PERFORMANCE.md)
- [Security Guidelines](docs/SECURITY.md)
- [Style Guide](docs/STYLE_GUIDE.md)

## Contributing

Please read [CONTRIBUTING.md](docs/CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.

## Community

Join our community to stay updated on developments:

- [Community Guidelines](docs/COMMUNITY.md)
- [Code of Conduct](docs/CODE_OF_CONDUCT.md)

## Roadmap

See our detailed [2025-2028 Roadmap](docs/ROADMAP_2025_2028.md) for future development plans.

## Development Status

- ✅ Phase 0 - Foundation (Completed - See [PHASE_01_COMPLETION.md](docs/PHASE_01_COMPLETION.md))
- ✅ Phase 0.2 - Devnet Infrastructure (Completed - See [PHASE_02_COMPLETION.md](PHASE_02_COMPLETION.md))
- ✅ Phase 0.3 - CLI Wallet & Whitepaper (Completed - See [SPRINT_0_3_FINAL.md](docs/SPRINT_0_3_FINAL.md))
- 🔜 Phase 1 - Testnet & Tooling (In Progress)
- 🔜 Phase 2 - Mainnet & Initial Ecosystem (Planned Q2-2026)
- 🔜 Phase 3 - Scaling & Governance (Planned Q3-2026-Q2-2027)
- 🔜 Phase 4 - Mass Adoption & Long-term (Planned Q3-2027-2028+)

## Latest Release

### v0.2.0-devnet (September 16, 2025)

Enhanced RandomX v2 implementation, 3-node Docker Compose devnet, Discord faucet bot, basic blockchain explorer, and RFC-001 preparation.

[Release Notes](docs/RELEASE_NOTES_v0.2.0-devnet.md) | [All Releases](https://github.com/RasyaAndrean/DARKGHOST/releases)

## Devnet Setup

### Prerequisites

- Docker and Docker Compose
- Node.js (for explorer)
- MongoDB (for explorer)

### Starting the Devnet

```bash
# Start the 3-node devnet
./scripts/devnet_up.sh

# Or on Windows
scripts\devnet_up.bat
```

### Devnet Components

- **Node 1**: Bootstrap node (localhost:18080 P2P, :18081 RPC)
- **Node 2**: Peer node (localhost:18083 P2P, :18084 RPC)
- **Node 3**: Peer node (localhost:18086 P2P, :18087 RPC)
- **Faucet**: Testnet token dispenser (localhost:8080)

### Stopping the Devnet

```bash
# Stop the devnet
./scripts/devnet_down.sh

# Or on Windows
scripts\devnet_down.bat
```

### Devnet Explorer

```bash
# Start the explorer
./scripts/start_explorer.sh

# Or on Windows
scripts\start_explorer.bat
```

The explorer will be available at http://localhost:8080

### Faucet Bot

The Discord faucet bot is available in [scripts/faucet_bot.py](scripts/faucet_bot.py)

### Configuration Files

- Node 1: [darkghost.conf.node1](darkghost.conf.node1)
- Node 2: [darkghost.conf.node2](darkghost.conf.node2)
- Node 3: [darkghost.conf.node3](darkghost.conf.node3)

For more details, see:

- [Devnet Explorer Documentation](docs/DEVNET_EXPLORER.md)
- [RandomX v2 Tweaks](docs/RANDOMX_V2_TWEAKS.md)
- [RFC-001 Ring Size Vote](docs/RFC-001_RING_SIZE_VOTE.md)
