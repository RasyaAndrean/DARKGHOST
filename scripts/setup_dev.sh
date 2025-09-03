#!/bin/bash

echo "Setting up DarkGhost Development Environment..."
echo "============================================="

# Check if we're in the right directory
if [ ! -f "CMakeLists.txt" ]; then
    echo "Error: Please run this script from the DarkGhost root directory"
    exit 1
fi

# Create necessary directories
echo "Creating directories..."
mkdir -p build wallets logs

# Initialize git submodules if any
echo "Initializing submodules..."
git submodule init
git submodule update

# Install dependencies (Linux)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Installing dependencies (Linux)..."
    sudo apt-get update
    sudo apt-get install -y build-essential cmake
# Install dependencies (macOS)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing dependencies (macOS)..."
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Please install Homebrew first:"
        echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
    brew install cmake
fi

# Build the project
echo "Building project..."
cd build
cmake ..
make

if [ -f "darkghostd" ]; then
    echo
    echo "Build successful!"
    echo "Executables created:"
    echo "  - darkghostd (Main node)"
    echo "  - darkghost_wallet (CLI wallet)"
    echo "  - darkghost_test (Test suite)"
    echo "  - darkghost_benchmark (Benchmark tool)"
    echo
    echo "To run the DarkGhost node:"
    echo "  ./darkghostd"
    echo
    echo "To run the CLI wallet:"
    echo "  ./darkghost_wallet"
    echo
    echo "To run tests:"
    echo "  ./darkghost_test"
else
    echo
    echo "Build failed!"
    echo "Check the error messages above."
fi

cd ..

echo
echo "Development environment setup complete!"
echo "Next steps:"
echo "1. Review the documentation in docs/"
echo "2. Run the test suite to verify installation"
echo "3. Join our Discord and Telegram dev channels"
