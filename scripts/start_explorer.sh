#!/bin/bash

echo "Starting DarkGhost Devnet Explorer..."
echo "==================================="

# Check if we're in the right directory
if [ ! -f "explorer/package.json" ]; then
    echo "Error: Please run this script from the DarkGhost root directory"
    exit 1
fi

# Install dependencies if needed
if [ ! -d "explorer/node_modules" ]; then
    echo "Installing explorer dependencies..."
    cd explorer
    npm install
    cd ..
fi

# Copy config if it doesn't exist
if [ ! -f "explorer/config.js" ]; then
    echo "Creating explorer configuration..."
    cp explorer/config.example.js explorer/config.js
fi

# Start the explorer
echo "Starting explorer..."
cd explorer
npm start
