# DarkGhost Scripts

This directory contains various scripts to help with development, building, and running DarkGhost.

## Build Scripts

- [`build.bat`](build.bat) - Build DarkGhost on Windows
- [`setup_dev.bat`](setup_dev.bat) - Set up development environment on Windows
- [`setup_dev.sh`](setup_dev.sh) - Set up development environment on Linux/macOS

## Development Scripts

- [`fork_monero.bat`](fork_monero.bat) - Fork Monero codebase for DarkGhost (Windows)
- [`fork_monero.sh`](fork_monero.sh) - Fork Monero codebase for DarkGhost (Linux/macOS)

## Network Scripts

- [`run_node.bat`](run_node.bat) - Run DarkGhost node on Windows
- [`faucet_bot.py`](faucet_bot.py) - Discord faucet bot for testnet

## Verification Scripts

- [`verify_structure.bat`](verify_structure.bat) - Verify project structure
- [`verify_upload.bat`](verify_upload.bat) - Verify GitHub upload

## Release Scripts

- [`release.bat`](release.bat) - Create release builds
- [`release.sh`](release.sh) - Create release builds (Linux/macOS)

## Usage

### Building DarkGhost

**Windows:**

```cmd
scripts\build.bat
```

**Linux/macOS:**

```bash
chmod +x scripts/build.sh
scripts/build.sh
```

### Setting up Development Environment

**Windows:**

```cmd
scripts\setup_dev.bat
```

**Linux/macOS:**

```bash
chmod +x scripts/setup_dev.sh
scripts/setup_dev.sh
```

### Running the Node

**Windows:**

```cmd
scripts\run_node.bat
```

### Forking Monero (Initial Setup)

**Windows:**

```cmd
scripts\fork_monero.bat
```

**Linux/macOS:**

```bash
chmod +x scripts/fork_monero.sh
scripts/fork_monero.sh
```

## Requirements

- **Windows**: MinGW-w64, CMake
- **Linux**: build-essential, CMake
- **macOS**: Xcode Command Line Tools, CMake
- **Python** (for faucet bot): Python 3.6+

## Contributing

To add new scripts:

1. Create the script in this directory
2. Add documentation to this README
3. Ensure cross-platform compatibility when possible
4. Follow the existing naming conventions
