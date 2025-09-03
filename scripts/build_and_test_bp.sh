#!/bin/bash

echo "Building and Testing Bulletproofs Implementation..."
echo "=================================================="

# Check if we're in the right directory
if [ ! -f "CMakeLists.txt" ]; then
    echo "Error: Please run this script from the DarkGhost root directory"
    exit 1
fi

# Create build directory if it doesn't exist
if [ ! -d "build" ]; then
    echo "Creating build directory..."
    mkdir build
fi

# Build the project
echo "Building project..."
cd build
cmake .. > /dev/null 2>&1
make bulletproofs_test > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"

# Run the tests
echo "Running Bulletproofs tests..."
./bulletproofs_test

if [ $? -eq 0 ]; then
    echo "✅ All Bulletproofs tests passed!"
else
    echo "❌ Some tests failed!"
    exit 1
fi

cd ..
echo "🎉 Bulletproofs implementation is ready for audit!"
