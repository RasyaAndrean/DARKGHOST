#!/bin/bash

# DarkGhost Monero Fork Script
# This script helps fork the Monero codebase for DarkGhost development

echo "DarkGhost Monero Fork Setup"
echo "=========================="

# Check if we're in the right directory
if [ ! -f "CMakeLists.txt" ]; then
    echo "Error: Please run this script from the DarkGhost root directory"
    exit 1
fi

# Create branch for DarkGhost v0.1.0
echo "Creating darkghost-v0.1.0 branch..."
git checkout -b darkghost-v0.1.0

# Update project name and description
echo "Updating project name and description..."
sed -i 's/DarkGhost/DarkGhost \[DG\]/g' README.md
sed -i 's/DarkGhost Core/DarkGhost \[DG\] Core/g' README.md

# Update version information
echo "Updating version information..."
sed -i 's/DARKGHOST_VERSION "1.0.0"/DARKGHOST_VERSION "0.1.0-alpha"/g' src/darkghost.h

# Update supply information
echo "Updating supply information..."
sed -i 's/10000000000000000ULL/10000000000000000ULL \/\//g' src/darkghost.h
echo "#define DARKGHOST_MAX_SUPPLY 10000000000000000ULL // 100 million DG in atomic units" >> src/darkghost.h

# Update block time
echo "Updating block time..."
sed -i 's/DARKGHOST_BLOCK_TIME 120/DARKGHOST_BLOCK_TIME 120/g' src/darkghost.h

# Update ring size
echo "Updating ring size..."
sed -i 's/DARKGHOST_RING_SIZE 11/DARKGHOST_RING_SIZE 11/g' src/darkghost.h

echo "Monero fork setup completed!"
echo "Next steps:"
echo "1. Review and update genesis parameters"
echo "2. Change magic bytes"
echo "3. Update ticker symbols"
echo "4. Adjust emission schedule"
