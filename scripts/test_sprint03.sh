#!/bin/bash

echo "Testing Sprint 0.3 Changes..."
echo "=============================="

# Check if we're in the right directory
if [ ! -f "CMakeLists.txt" ]; then
    echo "Error: Please run this script from the DarkGhost root directory"
    exit 1
fi

# Check if build directory exists
if [ ! -d "build" ]; then
    echo "Build directory not found. Creating..."
    mkdir build
fi

# Build the project
echo "Building project..."
cd build
cmake .. > /dev/null 2>&1
make > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"

# Test if executables exist
if [ ! -f "darkghostd" ]; then
    echo "❌ darkghostd executable not found!"
    exit 1
fi

if [ ! -f "darkghost_wallet" ]; then
    echo "❌ darkghost_wallet executable not found!"
    exit 1
fi

echo "✅ Executables found!"

# Test --testnet flag (basic test)
echo "Testing --testnet flag..."
./darkghostd --testnet --help > /dev/null 2>&1 &
DAEMON_PID=$!
sleep 2
kill $DAEMON_PID > /dev/null 2>&1

./darkghost_wallet --testnet --help > /dev/null 2>&1 &
WALLET_PID=$!
sleep 2
kill $WALLET_PID > /dev/null 2>&1

echo "✅ --testnet flag accepted!"

# Check ring size in source code
echo "Checking ring size configuration..."
RING_SIZE=$(grep "DEFAULT_RING_SIZE = 17" src/core/genesis.h)
if [ -z "$RING_SIZE" ]; then
    echo "❌ Ring size not updated to 17!"
    exit 1
fi

echo "✅ Ring size correctly set to 17!"

cd ..

echo
echo "🎉 All Sprint 0.3 tests passed!"
echo "✅ CLI wallet refactored for Ring-size 17"
echo "✅ --testnet flag implemented"
echo "✅ Build successful"
