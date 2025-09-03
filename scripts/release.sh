#!/bin/bash

echo "DarkGhost Release Script"
echo "======================"

# Check if we're in the right directory
if [ ! -f "CMakeLists.txt" ]; then
    echo "Error: Please run this script from the DarkGhost root directory"
    exit 1
fi

# Get version from darkghost.h
VERSION=$(grep "DARKGHOST_VERSION" src/darkghost.h | awk '{print $3}' | sed 's/"//g')

echo "Creating release for DarkGhost v$VERSION..."

# Create release directory
RELEASE_DIR="release-v$VERSION"
if [ -d "$RELEASE_DIR" ]; then
    echo "Removing existing release directory..."
    rm -rf "$RELEASE_DIR"
fi
mkdir "$RELEASE_DIR"

# Build project
echo "Building project..."
mkdir -p build
cd build
cmake ..
make

if [ ! -f "darkghostd" ]; then
    echo "Error: Build failed!"
    cd ..
    exit 1
fi

echo "Build successful!"

# Copy executables to release directory
echo "Copying executables..."
cp "darkghostd" "../$RELEASE_DIR/"
cp "darkghost_wallet" "../$RELEASE_DIR/"
cp "darkghost_test" "../$RELEASE_DIR/"
cp "darkghost_benchmark" "../$RELEASE_DIR/"

# Copy documentation
echo "Copying documentation..."
mkdir -p "../$RELEASE_DIR/docs"
cp ../docs/*.md "../$RELEASE_DIR/docs/"

# Copy scripts
echo "Copying scripts..."
mkdir -p "../$RELEASE_DIR/scripts"
cp ../scripts/*.bat "../$RELEASE_DIR/scripts/" 2>/dev/null || true
cp ../scripts/*.sh "../$RELEASE_DIR/scripts/" 2>/dev/null || true
cp ../scripts/*.py "../$RELEASE_DIR/scripts/" 2>/dev/null || true

# Copy configuration files
echo "Copying configuration files..."
cp "../darkghost.conf.example" "../$RELEASE_DIR/"
cp "../pool.conf" "../$RELEASE_DIR/"
cp "../README.md" "../$RELEASE_DIR/"
cp "../LICENSE" "../$RELEASE_DIR/"

# Create release archive
echo "Creating release archive..."
cd ..
tar -czf "darkghost-v$VERSION-linux.tar.gz" "$RELEASE_DIR"

echo
echo "Release v$VERSION created successfully!"
echo "Archive: darkghost-v$VERSION-linux.tar.gz"
echo
