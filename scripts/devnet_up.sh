#!/bin/bash

echo "Starting DarkGhost 3-node Devnet..."
echo "==================================="

# Check if docker-compose.devnet.yml exists
if [ ! -f "docker-compose.devnet.yml" ]; then
    echo "Error: docker-compose.devnet.yml not found!"
    echo "Please run this script from the DarkGhost root directory"
    exit 1
fi

# Create necessary directories
echo "Creating data directories..."
mkdir -p data/node1 data/node2 data/node3 faucet_data

# Start the devnet
echo "Starting 3-node devnet with Docker Compose..."
docker-compose -f docker-compose.devnet.yml up -d

if [ $? -eq 0 ]; then
    echo
    echo "✅ Devnet started successfully!"
    echo
    echo "Nodes:"
    echo "  - Node 1 (Bootstrap): localhost:18080 (P2P), localhost:18081 (RPC)"
    echo "  - Node 2 (Peer):      localhost:18083 (P2P), localhost:18084 (RPC)"
    echo "  - Node 3 (Peer):      localhost:18086 (P2P), localhost:18087 (RPC)"
    echo "  - Faucet:             localhost:8080"
    echo
    echo "To view logs:"
    echo "  docker-compose -f docker-compose.devnet.yml logs -f"
    echo
    echo "To stop the devnet:"
    echo "  ./scripts/devnet_down.sh"
else
    echo "❌ Failed to start devnet!"
    exit 1
fi
