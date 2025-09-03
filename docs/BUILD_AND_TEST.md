# Building and Testing DarkGhost

## Development Guide

## Overview

This document provides instructions for building and testing the DarkGhost project during development.

## Prerequisites

### Required Tools

- C++11 compatible compiler (g++, clang++, etc.)
- CMake 3.10 or higher
- Make build system (or MinGW-w64 on Windows)
- Git

### Optional Tools

- Docker (for containerized builds)
- LaTeX (for whitepaper compilation)
- Python 3.6+ (for scripts and bots)

## Building DarkGhost

### Linux/macOS

```bash
# Create build directory
mkdir build && cd build

# Configure with CMake
cmake ..

# Build all targets
make

# Or build specific targets
make darkghostd
make darkghost_wallet
make blockchain_test
```

### Windows

```cmd
REM Create build directory
mkdir build && cd build

REM Configure with CMake
cmake .. -G "MinGW Makefiles"

REM Build all targets
mingw32-make

REM Or build specific targets
mingw32-make darkghostd
mingw32-make darkghost_wallet
mingw32-make blockchain_test
```

### Using Build Scripts

```bash
# Linux/macOS
./scripts/build.sh

# Windows
scripts\build.bat
```

## Running Tests

### Blockchain Tests

```bash
# Build and run
cd build
make blockchain_test
./blockchain_test
```

### Bulletproofs Tests

```bash
# Build and run
cd build
make bulletproofs_test
./bulletproofs_test
```

### Using Test Scripts

```bash
# Linux/macOS
./scripts/test_sprint03.sh

# Windows
scripts\test_sprint03.bat
```

## Running DarkGhost

### Node Daemon

```bash
# Mainnet mode (default)
./build/darkghostd

# Testnet mode
./build/darkghostd --testnet
```

### CLI Wallet

```bash
# Mainnet mode (default)
./build/darkghost_wallet

# Testnet mode
./build/darkghost_wallet --testnet
```

## Devnet Setup

### Starting the Devnet

```bash
# Linux/macOS
./scripts/devnet_up.sh

# Windows
scripts\devnet_up.bat
```

### Stopping the Devnet

```bash
# Linux/macOS
./scripts/devnet_down.sh

# Windows
scripts\devnet_down.bat
```

## Explorer

### Starting the Explorer

```bash
# Linux/macOS
./scripts/start_explorer.sh

# Windows
scripts\start_explorer.bat
```

## Faucet Bot

```bash
python3 scripts/faucet_bot.py
```

## Build Matrix

The deterministic build matrix will be implemented using Guix for reproducible builds across platforms:

- Windows
- macOS
- Ubuntu

## Troubleshooting

### Common Issues

1. **CMake not found**: Install CMake from https://cmake.org/download/
2. **Compiler not found**: Install GCC/Clang or MinGW-w64
3. **Build errors**: Ensure all prerequisites are installed
4. **Test failures**: Check that all components are properly linked

### Getting Help

- Check the documentation in [docs/](docs/)
- File issues on GitHub
- Contact the development team on Discord

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a pull request

## License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.
