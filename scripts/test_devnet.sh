#!/bin/bash

echo "Testing DarkGhost Devnet Setup..."
echo "================================="

# Check if docker-compose.devnet.yml exists
if [ ! -f "docker-compose.devnet.yml" ]; then
    echo "Error: docker-compose.devnet.yml not found!"
    echo "Please run this script from the DarkGhost root directory"
    exit 1
fi

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed!"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Error: Docker Compose is not installed!"
    exit 1
fi

# Check if configuration files exist
missing_configs=0
if [ ! -f "darkghost.conf.node1" ]; then
    echo "Error: darkghost.conf.node1 not found!"
    missing_configs=1
fi

if [ ! -f "darkghost.conf.node2" ]; then
    echo "Error: darkghost.conf.node2 not found!"
    missing_configs=1
fi

if [ ! -f "darkghost.conf.node3" ]; then
    echo "Error: darkghost.conf.node3 not found!"
    missing_configs=1
fi

if [ $missing_configs -eq 1 ]; then
    echo "Missing configuration files!"
    exit 1
fi

# Check if scripts exist
missing_scripts=0
if [ ! -f "scripts/devnet_up.sh" ]; then
    echo "Error: scripts/devnet_up.sh not found!"
    missing_scripts=1
fi

if [ ! -f "scripts/devnet_down.sh" ]; then
    echo "Error: scripts/devnet_down.sh not found!"
    missing_scripts=1
fi

if [ $missing_scripts -eq 1 ]; then
    echo "Missing scripts!"
    exit 1
fi

# Check if explorer files exist
if [ ! -d "explorer" ]; then
    echo "Warning: explorer directory not found!"
else
    if [ ! -f "explorer/package.json" ]; then
        echo "Warning: explorer/package.json not found!"
    fi
fi

# Check if faucet bot exists
if [ ! -f "scripts/faucet_bot.py" ]; then
    echo "Warning: scripts/faucet_bot.py not found!"
fi

echo "✅ All files are in place!"
echo "✅ Devnet setup is ready for testing!"

echo
echo "To start the devnet, run:"
echo "  ./scripts/devnet_up.sh"
echo
echo "To test the explorer, run:"
echo "  ./scripts/start_explorer.sh"
echo
echo "To test the faucet bot:"
echo "  python3 scripts/faucet_bot.py"
