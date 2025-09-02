# DarkGhost Scripts Usage Guide

## Overview

This document explains how to use the various scripts available in the DarkGhost project to build, run, and manage the cryptocurrency.

## Script Directory

All scripts are located in the [scripts/](../scripts/) directory and are organized by function:

```
scripts/
├── build.bat              # Main build script for Windows
├── run_node.bat           # Run the DarkGhost node
├── run_wallet.bat         # Run the CLI wallet
├── run_tests.bat          # Run the test suite
├── release.bat            # Create release packages
├── setup_dev.bat          # Set up development environment
├── show_structure.bat     # Display project structure
├── update_build.bat       # Update build directory with latest source
├── verify_structure.bat   # Verify project directory structure
└── release.sh             # Release script for Linux/macOS
```

## Building DarkGhost

### Windows

To build DarkGhost on Windows, run the build script:

```cmd
cd scripts
build.bat
```

This will:

1. Compile all source files
2. Create executables in the build directory
3. Display build status and instructions for running

### Linux/macOS

To build DarkGhost on Linux or macOS:

```bash
mkdir build && cd build
cmake ..
make
```

Alternatively, you can use the Makefile directly:

```bash
make all
```

## Running Components

### Node

To run the DarkGhost node:

```cmd
cd scripts
run_node.bat
```

Or from the build directory:

```cmd
cd build
darkghostd
```

### Wallet

To run the CLI wallet:

```cmd
cd scripts
run_wallet.bat
```

Or from the build directory:

```cmd
cd build
darkghost_wallet
```

### Tests

To run the test suite:

```cmd
cd scripts
run_tests.bat
```

Or from the build directory:

```cmd
cd build
darkghost_test
```

## Development Scripts

### Setup Development Environment

To set up the development environment:

```cmd
cd scripts
setup_dev.bat
```

This script will:

1. Check for required tools
2. Install dependencies if needed
3. Set up environment variables

### Update Build Directory

To update the build directory with the latest source code:

```cmd
cd scripts
update_build.bat
```

This script will:

1. Copy all source files from src/ to build/src/
2. Copy build scripts to the build directory
3. Copy configuration files

### Verify Structure

To verify the project directory structure:

```cmd
cd scripts
verify_structure.bat
```

This script will:

1. Check for required directories
2. Verify documentation files
3. Verify script files
4. Confirm source code files

## Release Management

### Create Release Package

To create a release package:

```cmd
cd scripts
release.bat
```

This script will:

1. Build all components
2. Package executables
3. Create release archive

### Cross-platform Release

For Linux/macOS releases:

```bash
cd scripts
./release.sh
```

## Utility Scripts

### Show Project Structure

To display the project structure:

```cmd
cd scripts
show_structure.bat
```

This script will show:

1. Main directory contents
2. Source code structure
3. Build directory structure
4. Documentation files
5. Script files

## Troubleshooting

### Common Issues

1. **Missing Compiler**: If you get "g++ not found" errors, install MinGW-w64 or similar
2. **Permission Denied**: Run scripts as administrator if needed
3. **Path Issues**: Ensure you're running scripts from the correct directory

### Build Issues

If builds fail:

1. Run `verify_structure.bat` to check directory structure
2. Run `update_build.bat` to refresh build directory
3. Check that all required tools are installed

## Customization

You can modify the scripts to suit your needs:

- Change compiler flags in build scripts
- Modify directory paths
- Add custom build steps
- Adjust environment variables

## Security Notes

- Always verify scripts before running them
- Scripts should be run from the project root
- Some scripts may require administrator privileges
- Keep scripts updated with the latest security practices

## Contributing

If you create new scripts or improve existing ones:

1. Follow the naming conventions
2. Add documentation to this file
3. Test scripts on multiple platforms
4. Submit pull requests with changes
