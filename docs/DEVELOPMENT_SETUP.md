# DarkGhost Development Environment Setup

This document provides instructions for setting up a development environment for DarkGhost.

## Overview

Setting up a DarkGhost development environment involves:

1. Installing required dependencies
2. Cloning the repository
3. Building the project
4. Running tests
5. Configuring development tools

## System Requirements

### Minimum Requirements

- **CPU**: 2+ cores
- **RAM**: 4GB+
- **Disk Space**: 10GB+ free space
- **Operating System**: Windows 10+, macOS 10.14+, Ubuntu 18.04+

### Recommended Requirements

- **CPU**: 4+ cores
- **RAM**: 8GB+
- **Disk Space**: 50GB+ free space (for blockchain data)
- **Operating System**: Latest stable versions

## Installing Dependencies

### Windows

#### Prerequisites

1. **Visual Studio** or **MinGW-w64**
2. **CMake** 3.10 or higher
3. **Git**

#### Installation Steps

```cmd
# Install Chocolatey (if not already installed)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install dependencies
choco install git cmake mingw
```

### macOS

#### Prerequisites

1. **Xcode Command Line Tools**
2. **Homebrew**
3. **CMake** 3.10 or higher

#### Installation Steps

```bash
# Install Xcode Command Line Tools
xcode-select --install

# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install git cmake
```

### Linux (Ubuntu/Debian)

#### Prerequisites

1. **Build tools**
2. **CMake** 3.10 or higher
3. **Git**

#### Installation Steps

```bash
# Update package list
sudo apt update

# Install dependencies
sudo apt install build-essential git cmake
```

### Linux (Other Distributions)

#### Fedora

```bash
sudo dnf install gcc gcc-c++ make git cmake
```

#### Arch Linux

```bash
sudo pacman -S base-devel git cmake
```

## Cloning the Repository

### HTTPS Clone

```bash
git clone https://github.com/RasyaAndrean/DARKGHOST.git
cd DARKGHOST
```

### SSH Clone (if you have SSH keys set up)

```bash
git clone git@github.com:RasyaAndrean/DARKGHOST.git
cd DARKGHOST
```

## Building the Project

### Using Build Scripts

#### Windows

```cmd
scripts\build.bat
```

#### Linux/macOS

```bash
chmod +x scripts/build.sh
scripts/build.sh
```

### Manual Build

#### Create Build Directory

```bash
mkdir build && cd build
```

#### Configure with CMake

```bash
# Linux/macOS
cmake ..

# Windows with MinGW
cmake .. -G "MinGW Makefiles"
```

#### Compile

```bash
# Linux/macOS
make

# Windows
mingw32-make
```

### Build Targets

The build process creates several executables:

- **darkghostd** - Main node daemon
- **darkghost_wallet** - CLI wallet
- **darkghost_test** - Test suite
- **darkghost_benchmark** - Performance benchmarks

## Running the Node

### Starting the Node

```bash
# Linux/macOS
./build/darkghostd

# Windows
build\darkghostd.exe
```

### Command Line Options

```bash
# Run in devnet mode
./build/darkghostd --devnet

# Specify data directory
./build/darkghostd --data-dir /path/to/data

# Enable debug logging
./build/darkghostd --log-level debug
```

## Running Tests

### Execute Test Suite

```bash
# Linux/macOS
./build/darkghost_test

# Windows
build\darkghost_test.exe
```

### Test Output

The test suite provides detailed output:

```
DarkGhost Core Components Test
==============================

1. Testing Blockchain...
Initializing DarkGhost Blockchain with UTXO model...
Fixed supply: 100 million DG
Block time: 2 minutes
Genesis block created with reward: 5000000000 atomic units
Current supply: 5000000000 atomic units

2. Testing RandomX v2...
Initializing RandomX v2 consensus algorithm...
ASIC-resistant, CPU-optimized mining
Target block time: 2 minutes
Generated hash: a1b2c3d4...
Hash verification: PASS

...

All tests completed!
```

## Development Tools

### Recommended IDEs

#### Visual Studio Code

1. Install the C/C++ extension
2. Install the CMake Tools extension
3. Configure IntelliSense for the project

#### CLion

1. Open the project directory
2. CLion will automatically detect CMake configuration
3. Configure toolchains as needed

#### Visual Studio

1. Open the CMakeLists.txt file
2. Visual Studio will generate project files
3. Build using Visual Studio's build system

### Code Formatting

DarkGhost follows specific code formatting guidelines:

- **Indentation**: 2 spaces
- **Line Length**: 80 characters maximum
- **Brace Style**: K&R style
- **Naming**: camelCase for variables, PascalCase for classes

### Static Analysis Tools

Recommended static analysis tools:

- **Cppcheck**: Static analysis for C++
- **Clang Static Analyzer**: LLVM-based static analyzer
- **SonarQube**: Continuous code quality analysis

## Setting Up Development Environment

### Automated Setup

#### Windows

```cmd
scripts\setup_dev.bat
```

#### Linux/macOS

```bash
chmod +x scripts/setup_dev.sh
scripts/setup_dev.sh
```

### Manual Setup

#### Create Required Directories

```bash
mkdir -p build wallets logs
```

#### Initialize Git Submodules

```bash
git submodule init
git submodule update
```

#### Configure Environment Variables

Add to your shell profile (`.bashrc`, `.zshrc`, etc.):

```bash
export DARKGHOST_HOME=/path/to/darkghost
export PATH=$DARKGHOST_HOME/build:$PATH
```

## Development Workflow

### Typical Development Cycle

1. **Make Changes**: Edit source files
2. **Build**: Compile the project
3. **Test**: Run unit tests
4. **Debug**: Fix any issues
5. **Commit**: Commit changes to version control

### Feature Development

1. **Create Branch**: `git checkout -b feature-name`
2. **Implement Feature**: Write code and tests
3. **Build and Test**: Verify everything works
4. **Code Review**: Submit pull request for review
5. **Merge**: Merge after approval

### Bug Fixing

1. **Reproduce Issue**: Confirm the bug exists
2. **Create Test**: Write a test that reproduces the bug
3. **Fix Code**: Implement the fix
4. **Verify Fix**: Ensure the test passes
5. **Regression Testing**: Run full test suite

## Troubleshooting

### Common Issues

#### Build Failures

1. **Missing Dependencies**: Ensure all dependencies are installed
2. **CMake Version**: Update to CMake 3.10 or higher
3. **Compiler Issues**: Verify compiler installation

#### Test Failures

1. **Environment Issues**: Check development environment setup
2. **Data Corruption**: Clean build directory and rebuild
3. **Network Issues**: Check network connectivity for integration tests

#### Runtime Issues

1. **Permission Errors**: Check file permissions
2. **Memory Issues**: Ensure sufficient RAM
3. **Disk Space**: Verify sufficient disk space

### Debugging Tips

#### Enable Debug Logging

```bash
./build/darkghostd --log-level debug
```

#### Use Debug Build

```bash
mkdir debug && cd debug
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
```

#### Run with Debugger

```bash
# GDB (Linux/macOS)
gdb ./build/darkghostd
(gdb) run

# Visual Studio Debugger (Windows)
# Set breakpoints and start debugging
```

## Contributing

### Code Style

Follow the guidelines in [STYLE_GUIDE.md](STYLE_GUIDE.md):

- Use consistent naming conventions
- Follow indentation rules
- Write clear comments
- Keep functions focused and small

### Testing

Ensure all changes include appropriate tests:

- **Unit Tests**: For new functionality
- **Integration Tests**: For system-level changes
- **Performance Tests**: For performance-sensitive code

### Documentation

Update documentation when making changes:

- **Code Comments**: Document complex logic
- **README Updates**: Update setup instructions if needed
- **API Documentation**: Update API documentation

## Resources

### Documentation

- [Project Structure](PROJECT_STRUCTURE.md)
- [Architecture Overview](ARCHITECTURE.md)
- [Coding Standards](STYLE_GUIDE.md)
- [Testing Framework](TESTING.md)

### External Resources

- [CMake Documentation](https://cmake.org/documentation/)
- [Git Documentation](https://git-scm.com/doc)
- [C++ Reference](https://en.cppreference.com/)
- [RandomX Documentation](https://github.com/tevador/RandomX)
