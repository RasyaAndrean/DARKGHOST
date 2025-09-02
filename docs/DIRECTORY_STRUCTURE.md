# DarkGhost Directory Structure

## Overview

This document explains the organized directory structure of the DarkGhost project, which was restructured to improve organization and maintainability.

## New Directory Structure

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
│   ├── src/               # Copy of source code for building
│   ├── Makefile           # Build configuration for Linux/macOS
│   ├── CMakeLists.txt     # CMake build configuration
│   ├── build.bat          # Windows build script
│   ├── run_node.bat       # Run the DarkGhost node
│   ├── run_wallet.bat     # Run the CLI wallet
│   ├── run_tests.bat      # Run the test suite
│   └── README.md          # Build directory documentation
├── docs/                  # Documentation files (.md)
│   ├── API.md             # API documentation
│   ├── ARCHITECTURE.md    # Architecture overview
│   ├── CLI.md             # Command-line interface guide
│   ├── WALLET.md          # Wallet usage guide
│   ├── MINING.md          # Mining guide
│   ├── PERFORMANCE.md     # Performance optimization guide
│   ├── SECURITY.md        # Security guidelines
│   ├── STYLE_GUIDE.md     # Coding standards
│   ├── DIRECTORY_STRUCTURE.md # This file
│   └── ...                # Other documentation files
├── scripts/               # Scripts and build tools (.bat, .sh)
│   ├── build.bat          # Windows build script
│   ├── run_node.bat       # Run the DarkGhost node
│   ├── run_wallet.bat     # Run the CLI wallet
│   ├── run_tests.bat      # Run the test suite
│   ├── release.bat        # Release packaging script
│   ├── setup_dev.bat      # Development environment setup
│   ├── show_structure.bat # Show project structure
│   └── release.sh         # Release script for Linux/macOS
├── Dockerfile             # Containerization configuration
└── CMakeLists.txt         # Root CMake build configuration
```

## Directory Purposes

### src/

Contains all the source code organized by functionality:

- **core/**: Blockchain implementation with UTXO model
- **consensus/**: RandomX v2 consensus algorithm
- **privacy/**: Privacy features including RingCT and Bulletproofs
- **wallet/**: Wallet functionality and CLI implementation
- **tests/**: Automated test suite

### build/

Contains build artifacts and build-specific files:

- Compiled binaries
- Object files
- Build configuration files
- Execution scripts

### docs/

Contains all documentation files in Markdown format:

- Technical documentation
- User guides
- API references
- Development guidelines

### scripts/

Contains all executable scripts:

- Build scripts for different platforms
- Runtime execution scripts
- Development tools
- Release management scripts

## Benefits of This Structure

1. **Improved Organization**: Related files are grouped together
2. **Easier Maintenance**: Clear separation of concerns
3. **Better Discoverability**: Files are easier to find
4. **Platform Separation**: Scripts are separated from documentation
5. **Scalability**: Structure can accommodate future growth

## File Migration Summary

### Documentation Files (.md)

All Markdown documentation files were moved from the root directory to the `docs/` directory:

- API.md
- ARCHITECTURE.md
- BUILD_SUMMARY.md
- CHANGELOG.md
- CLI.md
- CODE_OF_CONDUCT.md
- COMMUNITY.md
- COMPLETION_NOTICE.md
- CONTRIBUTING.md
- DOCS.md
- ECOSYSTEM.md
- FAQ.md
- FINAL_STRUCTURE.md
- GETTING_STARTED.md
- GOVERNANCE.md
- HARDWARE_WALLET.md
- I18N.md
- MINING.md
- MOBILE.md
- PERFORMANCE.md
- PROJECT_STRUCTURE.md
- R&D.md
- README.md (new root README created)
- ROADMAP.md
- SECURITY.md
- STYLE_GUIDE.md
- WALLET.md

### Script Files (.bat, .sh)

All batch and shell scripts were moved from the root directory to the `scripts/` directory:

- build.bat
- release.bat
- run_node.bat
- setup_dev.bat
- show_structure.bat
- release.sh

This reorganization makes the project more maintainable and easier to navigate for both developers and users.
