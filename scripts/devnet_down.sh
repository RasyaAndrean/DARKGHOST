#!/bin/bash

echo "Stopping DarkGhost 3-node Devnet..."
echo "==================================="

# Check if docker-compose.devnet.yml exists
if [ ! -f "docker-compose.devnet.yml" ]; then
    echo "Error: docker-compose.devnet.yml not found!"
    echo "Please run this script from the DarkGhost root directory"
    exit 1
fi

# Stop the devnet
echo "Stopping 3-node devnet with Docker Compose..."
docker-compose -f docker-compose.devnet.yml down

if [ $? -eq 0 ]; then
    echo "✅ Devnet stopped successfully!"
    echo
    echo "To start the devnet again:"
    echo "  ./scripts/devnet_up.sh"
else
    echo "❌ Failed to stop devnet!"
    exit 1
fi
