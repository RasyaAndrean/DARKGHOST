# DarkGhost Build Requirements

This document outlines the requirements for building DarkGhost from source.

## Overview

DarkGhost can be built on Windows, Linux, and macOS platforms. The build process requires specific tools and dependencies to be installed.

## Windows Requirements

### Compiler
- **MinGW-w64**: Version 8.0 or higher
  - Download from: https://www.mingw-w64.org/downloads/
  - Or install via Chocolatey: `choco install mingw`

### Build Tools
- **CMake**: Version 3.10 or higher
  - Download from: https://cmake.org/download/
  - Or install via Chocolatey: `choco install cmake`

### Optional Tools
- **Git**: For version control
  - Download from: https://git-scm.com/downloads
  - Or install via Chocolatey: `choco install git`

## Linux Requirements

### Ubuntu/Debian
```bash
sudo apt update
sudo apt install build-essential cmake git
```

### Fedora
```bash
sudo dnf install gcc gcc-c++ make cmake git
```

### Arch Linux
```bash
sudo pacman -S base-devel cmake git
```

## macOS Requirements

### Xcode Command Line Tools
```bash
xcode-select --install
```

### Homebrew (Recommended)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Dependencies
```bash
brew install cmake git
```

## Build Process

### Windows
```cmd
scripts\build.bat
```

### Linux/macOS
```bash
chmod +x scripts/build.sh
scripts/build.sh
```

### Manual Build
```bash
mkdir build && cd build
cmake ..
make
```

## Common Issues

### "g++ not found" (Windows)
**Cause**: MinGW-w64 not installed or not in PATH
**Solution**: Install MinGW-w64 and add to PATH

### "CMake not found"
**Cause**: CMake not installed or not in PATH
**Solution**: Install CMake and add to PATH

### "Compiler not found"
**Cause**: No suitable compiler installed
**Solution**: Install appropriate compiler for your platform

## Docker Build (Alternative)

For users who prefer not to install dependencies locally, Docker can be used:

```bash
docker build -t darkghost .
docker run --rm -v $(pwd):/src darkghost
```

## Verification

After building, verify the build by running the test suite:

### Windows
```cmd
build\darkghost_test.exe
```

### Linux/macOS
```bash
./build/darkghost_test
```

## Resources

- [DEVELOPMENT_SETUP.md](DEVELOPMENT_SETUP.md) - Detailed development setup guide
- [BUILD_PROCESS.md](BUILD_PROCESS.md) - Detailed build process documentation
- [MinGW-w64](https://www.mingw-w64.org/) - MinGW-w64 project page
- [CMake](https://cmake.org/) - CMake project page

## Last Updated

September 2, 2025

---