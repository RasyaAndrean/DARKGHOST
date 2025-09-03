# DarkGhost Build Process

This document describes the build process for DarkGhost, including dependencies, compilation steps, and build targets.

## Overview

DarkGhost uses CMake as its build system, supporting multiple platforms including Windows, Linux, and macOS. The build process compiles the core node, wallet, test suite, and benchmark tools.

## Dependencies

### Required Dependencies

- **C++ Compiler**: C++11 compatible compiler (g++, clang++, MSVC)
- **CMake**: Version 3.10 or higher
- **Build Tools**: Make (Linux/macOS) or MinGW-w64 (Windows)

### Optional Dependencies

- **Git**: For version control operations
- **Python**: For faucet bot and scripts (version 3.6+)
- **Docker**: For containerized deployment

## Build System

### CMake Configuration

The build is configured through [CMakeLists.txt](../CMakeLists.txt), which defines:

- **Source Files**: All source code files
- **Build Targets**: Executables to build
- **Compiler Flags**: Optimization and warning flags
- **Include Directories**: Header file search paths

### Build Targets

The CMake configuration defines several build targets:

- **darkghostd**: Main node daemon
- **darkghost_wallet**: CLI wallet
- **darkghost_test**: Test suite
- **darkghost_benchmark**: Performance benchmarks

## Building on Windows

### Prerequisites

1. Install MinGW-w64 or Visual Studio
2. Install CMake
3. Ensure `g++` and `cmake` are in your PATH

### Build Steps

```cmd
# Navigate to project root
cd DARKGHOST

# Create build directory
mkdir build
cd build

# Configure with CMake
cmake .. -G "MinGW Makefiles"

# Build all targets
mingw32-make

# Or build specific targets
mingw32-make darkghostd
mingw32-make darkghost_wallet
mingw32-make darkghost_test
mingw32-make darkghost_benchmark
```

### Using Build Script

```cmd
# From project root
scripts\build.bat
```

## Building on Linux/macOS

### Prerequisites

1. Install build tools:
   - **Ubuntu/Debian**: `sudo apt install build-essential cmake`
   - **Fedora**: `sudo dnf install gcc gcc-c++ make cmake`
   - **macOS**: Install Xcode Command Line Tools and Homebrew, then `brew install cmake`

### Build Steps

```bash
# Navigate to project root
cd DARKGHOST

# Create build directory
mkdir build
cd build

# Configure with CMake
cmake ..

# Build all targets
make

# Or build specific targets
make darkghostd
make darkghost_wallet
make darkghost_test
make darkghost_benchmark
```

### Using Build Script

```bash
# From project root
chmod +x scripts/build.sh
scripts/build.sh
```

## Build Configuration

### Build Types

CMake supports different build types:

- **Debug**: Includes debug symbols and assertions
- **Release**: Optimized for performance
- **RelWithDebInfo**: Release with debug information
- **MinSizeRel**: Release optimized for size

### Setting Build Type

```bash
# Debug build
cmake .. -DCMAKE_BUILD_TYPE=Debug

# Release build
cmake .. -DCMAKE_BUILD_TYPE=Release
```

### Compiler Flags

The project uses the following compiler flags:

- **Warnings**: `-Wall -Wextra` for comprehensive warnings
- **Optimization**: `-O2` for balanced optimization
- **Standard**: C++11 standard compliance

## Build Targets Details

### Main Node (darkghostd)

- **Purpose**: Full node implementation
- **Components**: Blockchain, consensus, privacy, network
- **Usage**: `./darkghostd` or `darkghostd.exe`

### CLI Wallet (darkghost_wallet)

- **Purpose**: Command-line wallet interface
- **Components**: Wallet functionality, transaction creation
- **Usage**: `./darkghost_wallet` or `darkghost_wallet.exe`

### Test Suite (darkghost_test)

- **Purpose**: Unit and integration tests
- **Components**: All core component tests
- **Usage**: `./darkghost_test` or `darkghost_test.exe`

### Benchmark Tool (darkghost_benchmark)

- **Purpose**: Performance measurement
- **Components**: Performance benchmarks for core algorithms
- **Usage**: `./darkghost_benchmark` or `darkghost_benchmark.exe`

## Cross-Platform Considerations

### Platform-Specific Code

The codebase handles platform differences through:

- **Conditional Compilation**: `#ifdef` directives for platform-specific code
- **Standard Libraries**: Use of standard C++ libraries
- **CMake Configuration**: Platform-specific build settings

### File Paths

- **Separators**: Use of forward slashes for cross-platform compatibility
- **Case Sensitivity**: Consistent file naming conventions
- **Line Endings**: Unix-style line endings in source files

## Build Artifacts

### Output Directory

All build artifacts are created in the `build/` directory:

- **Executables**: Compiled binaries
- **Object Files**: Intermediate compilation files
- **Dependency Files**: CMake-generated files

### Installation

The build system supports installation:

```bash
# Install to system directories
sudo make install

# Install to custom directory
make install DESTDIR=/path/to/install
```

## Continuous Integration

### GitHub Actions

The project uses GitHub Actions for CI:

- **Build Matrix**: Tests on Ubuntu, macOS, and Windows
- **Automated Testing**: Runs test suite on each platform
- **Build Verification**: Ensures successful compilation

### Build Status

Build status is displayed in the README through badges:

- **Success**: Green badge indicating successful build
- **Failure**: Red badge indicating build failure
- **Pending**: Yellow badge indicating build in progress

## Troubleshooting

### Common Build Issues

#### Missing Dependencies

```
CMake Error: CMake was unable to find a build program corresponding to "Unix Makefiles"
```

**Solution**: Install build tools (`build-essential` on Ubuntu, Xcode on macOS)

#### Compiler Not Found

```
No C++ compiler found
```

**Solution**: Install g++ or clang++

#### CMake Version Too Old

```
CMake 3.10 or higher is required. You are running version 3.5
```

**Solution**: Update CMake to version 3.10 or higher

### Debugging Build Issues

#### Verbose Build Output

```bash
# Linux/macOS
make VERBOSE=1

# Windows
mingw32-make VERBOSE=1
```

#### CMake Debug Output

```bash
cmake .. --debug-output
```

#### Clean Build

```bash
# Remove build directory
rm -rf build

# Rebuild from scratch
mkdir build && cd build
cmake ..
make
```

## Performance Optimization

### Compiler Optimizations

The build uses `-O2` optimization level, which provides:

- **Speed**: Good performance optimization
- **Size**: Reasonable binary size
- **Debugging**: Maintains debuggability

### Profile-Guided Optimization

For release builds, consider using profile-guided optimization:

```bash
# Instrumentation build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-fprofile-generate"

# Profile-guided optimization
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-fprofile-use"
```

## Security Considerations

### Compiler Security Flags

Consider adding security-related compiler flags:

```bash
# Stack protection
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-protector")

# Address sanitization (for debugging)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address")
```

### Static Analysis

Integrate static analysis tools:

- **Cppcheck**: `cppcheck --enable=all src/`
- **Clang Static Analyzer**: `scan-build make`

## Containerized Build

### Docker Build

The project includes a Dockerfile for containerized builds:

```bash
# Build Docker image
docker build -t darkghost .

# Run build in container
docker run --rm -v $(pwd):/src darkghost
```

### Docker Compose

For development environments:

```bash
# Build and run development environment
docker-compose up --build
```

## Release Process

### Versioning

The project follows semantic versioning:

- **Major**: Breaking changes
- **Minor**: New features
- **Patch**: Bug fixes

### Release Build

For creating release builds:

```bash
# Configure for release
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local

# Build and install
make
sudo make install
```

## Contributing to Build System

### Adding New Source Files

1. Add new source files to appropriate lists in CMakeLists.txt
2. Ensure proper include directory setup
3. Update documentation if needed

### Adding New Build Targets

1. Define new target in CMakeLists.txt
2. Specify source files and dependencies
3. Add to installation rules if needed

### Platform Support

When adding platform-specific features:

1. Use conditional compilation
2. Update CMake configuration
3. Test on all supported platforms

## Resources

### Documentation

- [CMake Documentation](https://cmake.org/documentation/)
- [GNU Make Manual](https://www.gnu.org/software/make/manual/)
- [MinGW-w64 Documentation](http://mingw-w64.org/)

### Tools

- [CMake GUI](https://cmake.org/runningcmake/)
- [Ninja Build System](https://ninja-build.org/)
- [CCache](https://ccache.dev/) - Compiler cache for faster builds

### Further Reading

- [Cross-Platform Development](https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html)
- [C++ Build Systems](https://en.wikipedia.org/wiki/List_of_build_automation_software#C++)

## Last Updated

September 2, 2025

---
