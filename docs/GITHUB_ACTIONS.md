# GitHub Actions CI/CD Pipeline

This document describes the continuous integration and deployment pipeline for DarkGhost.

## Workflow Overview

The CI/CD pipeline is defined in [`.github/workflows/build.yml`](../.github/workflows/build.yml) and runs on every push to the `main` and `develop` branches, as well as on every pull request to the `main` branch.

## Supported Platforms

The pipeline builds and tests DarkGhost on three platforms:

- Ubuntu (latest LTS)
- macOS (latest)
- Windows (latest)

## Build Process

### 1. Environment Setup

Each job begins by setting up the required dependencies:

- **Ubuntu**: `build-essential` and `cmake`
- **macOS**: `cmake` via Homebrew
- **Windows**: `mingw` and `cmake` via Chocolatey

### 2. Build Steps

1. Checkout the repository
2. Create build directory
3. Configure with CMake
4. Compile with native build tools

### 3. Testing

After building, the test suite is executed to verify the build:

```bash
./darkghost_test
```

## Configuration

### Build Matrix

The workflow uses a build matrix to test on multiple platforms:

```yaml
jobs:
  build-ubuntu:
    runs-on: ubuntu-latest
  build-macos:
    runs-on: macos-latest
  build-windows:
    runs-on: windows-latest
```

### Build Commands

- **Ubuntu/macOS**: `cmake .. && make`
- **Windows**: `cmake .. -G "MinGW Makefiles" && mingw32-make`

## Artifacts

Currently, the workflow does not upload build artifacts, but this may be added in the future for:

- Pre-built binaries for releases
- Test reports
- Code coverage reports

## Status Badges

The build status is displayed in the main [README.md](../README.md) with a badge that shows the current status of the pipeline.

## Future Enhancements

Planned improvements to the CI/CD pipeline:

1. Code coverage reporting
2. Static analysis integration
3. Automated release creation
4. Performance benchmarking
5. Security scanning
6. Documentation generation

## Troubleshooting

### Common Issues

1. **Missing dependencies**: Ensure all required packages are installed in the setup step
2. **Compiler errors**: Check for platform-specific code issues
3. **Test failures**: Verify that tests pass locally before pushing

### Debugging

To debug CI issues:

1. Check the detailed logs in the GitHub Actions interface
2. Reproduce the environment locally
3. Run the same commands manually

## Contributing

To modify the CI/CD pipeline:

1. Edit [`.github/workflows/build.yml`](../.github/workflows/build.yml)
2. Test changes in a feature branch
3. Verify all platforms build successfully
4. Submit a pull request
