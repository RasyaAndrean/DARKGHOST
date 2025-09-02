# DarkGhost Project Structure

## Overview

This document describes the directory structure and organization of the DarkGhost cryptocurrency project.

## Root Directory

```
DarkGhost/
├── src/                    # Source code
├── build/                  # Build output (created during compilation)
├── docs/                   # Documentation files
├── wallets/                # Wallet storage (created during runtime)
├── logs/                   # Log files (created during runtime)
├── .gitignore             # Git ignore file
├── ARCHITECTURE.md        # System architecture documentation
├── CMakeLists.txt         # CMake build configuration
├── darkghost.conf         # Main configuration file
├── darkghost.conf.example # Example configuration file
├── DOCS.md                # Technical documentation
├── Makefile               # Make build configuration
├── MINING.md              # Mining guide
├── pool.conf              # Example mining pool configuration
├── PROJECT_STRUCTURE.md   # This file
├── README.md              # Project overview
├── ROADMAP.md             # Development roadmap
├── run_node.bat           # Node execution script (Windows)
├── build.bat              # Build script (Windows)
├── WALLET.md              # Wallet guide
└── LICENSE                # License file (to be added)
```

## Source Code Structure

### Core Components

```
src/
├── core/
│   ├── blockchain.h       # Blockchain implementation
│   └── blockchain.cpp
├── consensus/
│   ├── randomx_v2.h       # RandomX v2 consensus algorithm
│   └── randomx_v2.cpp
├── privacy/
│   ├── ringct.h           # Ring Confidential Transactions
│   ├── ringct.cpp
│   ├── bulletproofs.h     # Bulletproofs implementation
│   └── bulletproofs.cpp
├── wallet/
│   ├── stealth_address.h  # Stealth address implementation
│   ├── stealth_address.cpp
│   └── cli_wallet.cpp     # CLI wallet implementation
├── tests/
│   └── blockchain_test.cpp # Unit tests
├── main.cpp               # Main entry point
├── darkghost.h            # Main header file
```

## Detailed Component Descriptions

### Core Blockchain

Located in `src/core/`, this component implements the UTXO-based blockchain model.

**Key Files:**

- `blockchain.h`: Defines the Blockchain class, UTXO structure, and Block structure
- `blockchain.cpp`: Implements blockchain initialization, block addition, and UTXO management

**Features:**

- Fixed supply of 100 million DG
- 2-minute block time
- Dynamic block sizing
- Halving schedule every 4 years

### Consensus Algorithm

Located in `src/consensus/`, this component implements the RandomX v2 algorithm.

**Key Files:**

- `randomx_v2.h`: Defines the RandomXv2 class for consensus operations
- `randomx_v2.cpp`: Implements block verification, hash calculation, and difficulty adjustment

**Features:**

- CPU-friendly mining algorithm
- ASIC-resistant design
- 2-minute target block time
- Automatic difficulty adjustment

### Privacy Features

Located in `src/privacy/`, this component implements Monero-style privacy features.

**RingCT:**

- `ringct.h`: Defines the RingCT class for confidential transactions
- `ringct.cpp`: Implements transaction creation and verification with ring signatures

**Bulletproofs:**

- `bulletproofs.h`: Defines the Bulletproofs class for range proofs
- `bulletproofs.cpp`: Implements proof generation and verification

**Features:**

- Ring size of 11 (10 decoys + 1 real output)
- Stealth address generation
- Transaction amount encryption
- Reduced transaction size through Bulletproofs

### Wallet Functionality

Located in `src/wallet/`, this component provides wallet features.

**Key Files:**

- `stealth_address.h`: Defines the StealthAddress class
- `stealth_address.cpp`: Implements stealth address generation and transaction scanning
- `cli_wallet.cpp`: Implements the command-line wallet interface

**Features:**

- BIP-39 seed phrase support
- View key scanning capability
- Stealth address generation
- CLI interface for wallet operations

## Build System

### Makefile

The `Makefile` provides build instructions for Linux and macOS systems.

**Targets:**

- `all`: Build the main executable
- `clean`: Remove build artifacts
- `rebuild`: Clean and rebuild
- `install`: Install the executable

### CMakeLists.txt

The `CMakeLists.txt` provides cross-platform build configuration.

**Targets:**

- `darkghostd`: Main node executable
- `darkghost_test`: Test executable
- `darkghost_wallet`: CLI wallet executable

### Windows Scripts

- `build.bat`: Compile the project on Windows
- `run_node.bat`: Run the DarkGhost node

## Configuration Files

### Node Configuration

- `darkghost.conf`: Main configuration file for the node
- `darkghost.conf.example`: Example configuration file

### Pool Configuration

- `pool.conf`: Example mining pool configuration

## Documentation Files

- `README.md`: Project overview and quick start guide
- `DOCS.md`: Technical documentation
- `ARCHITECTURE.md`: System architecture and design
- `ROADMAP.md`: Development roadmap and milestones
- `MINING.md`: Mining guide and best practices
- `WALLET.md`: Wallet usage and security guide
- `PROJECT_STRUCTURE.md`: This file

## Runtime Directories

These directories are created during runtime and are not part of the source code:

- `build/`: Contains compiled executables and object files
- `wallets/`: Stores wallet files and key data
- `logs/`: Contains log files for debugging and monitoring

## Development Workflow

### Adding New Features

1. Create new header and implementation files in appropriate directories
2. Update `Makefile` and `CMakeLists.txt` with new source files
3. Add tests in the `src/tests/` directory
4. Update documentation files as needed
5. Follow the existing code style and structure

### Building the Project

**Windows:**

```cmd
build.bat
```

**Linux/macOS:**

```bash
make
# or
cmake . && make
```

### Running Tests

After building, run the test executable:

```bash
./build/darkghost_test
```

### Running the Node

**Windows:**

```cmd
run_node.bat
```

**Linux/macOS:**

```bash
./build/darkghostd
```

## Version Control

The `.gitignore` file excludes:

- Build artifacts
- Runtime directories
- Log files
- OS-specific temporary files
- IDE configuration files

## Contributing

To contribute to the DarkGhost project:

1. Fork the repository
2. Create a feature branch
3. Implement your changes
4. Add tests if applicable
5. Update documentation
6. Submit a pull request

Follow the existing code structure and conventions when adding new components.
