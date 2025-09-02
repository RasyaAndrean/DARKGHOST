# DarkGhost Command Line Interface (CLI) Guide

## Overview

The DarkGhost CLI provides powerful command-line tools for interacting with the DarkGhost network, managing wallets, and performing various blockchain operations. This guide covers the available CLI tools and their usage.

## Available CLI Tools

### 1. DarkGhost Daemon (`darkghostd`)

The main DarkGhost node daemon that maintains the blockchain, validates transactions, and participates in the network consensus.

### 2. DarkGhost Wallet CLI (`darkghost-wallet-cli`)

A command-line wallet interface for managing DarkGhost funds, creating transactions, and interacting with the blockchain.

### 3. DarkGhost RPC Client (`darkghost-cli`)

A lightweight RPC client for sending commands to a running DarkGhost daemon.

### 4. Key Generator (`darkghost-gen-key`)

A utility for generating cryptographic keys and wallet addresses.

## DarkGhost Daemon (`darkghostd`)

### Basic Usage

```bash
# Start the daemon with default settings
./darkghostd

# Start with custom configuration
./darkghostd --config-file /path/to/darkghost.conf

# Start in testnet mode
./darkghostd --testnet

# Start with specific data directory
./darkghostd --data-dir /path/to/blockchain/data
```

### Common Options

| Option                    | Description                  | Example                        |
| ------------------------- | ---------------------------- | ------------------------------ |
| `--config-file`           | Specify configuration file   | `--config-file darkghost.conf` |
| `--data-dir`              | Specify data directory       | `--data-dir /blockchain/data`  |
| `--log-file`              | Specify log file             | `--log-file darkghost.log`     |
| `--log-level`             | Set log level (0-4)          | `--log-level 3`                |
| `--testnet`               | Run on testnet               | `--testnet`                    |
| `--rpc-bind-ip`           | RPC bind IP                  | `--rpc-bind-ip 127.0.0.1`      |
| `--rpc-bind-port`         | RPC bind port                | `--rpc-bind-port 31314`        |
| `--restricted-rpc`        | Restrict RPC commands        | `--restricted-rpc`             |
| `--confirm-external-bind` | Confirm external RPC binding | `--confirm-external-bind`      |
| `--detach`                | Run as daemon in background  | `--detach`                     |

### Configuration File

Create a `darkghost.conf` file to store persistent settings:

```ini
# Network settings
testnet=0
data-dir=/home/user/.darkghost
 log-file=/home/user/.darkghost/darkghost.log
log-level=3

# RPC settings
rpc-bind-ip=127.0.0.1
rpc-bind-port=31314
rpc-login=username:password
confirm-external-bind=0
restricted-rpc=0

# P2P settings
p2p-bind-ip=0.0.0.0
p2p-bind-port=31313
out-peers=8
in-peers=16

# Performance settings
block-sync-size=100
db-sync-mode=fast
```

### Daemon Management

#### Starting the Daemon

```bash
# Foreground mode (recommended for initial setup)
./darkghostd --config-file darkghost.conf

# Background mode
./darkghostd --config-file darkghost.conf --detach
```

#### Stopping the Daemon

```bash
# Graceful shutdown
./darkghost-cli exit

# Force kill (not recommended)
killall darkghostd
```

#### Checking Status

```bash
# Get node information
./darkghost-cli get_info

# Check synchronization status
./darkghost-cli sync_info

# View connections
./darkghost-cli get_connections
```

## DarkGhost Wallet CLI (`darkghost-wallet-cli`)

### Basic Usage

```bash
# Start wallet with interactive mode
./darkghost-wallet-cli

# Start with specific wallet file
./darkghost-wallet-cli --wallet-file my_wallet

# Start with testnet wallet
./darkghost-wallet-cli --testnet --wallet-file test_wallet

# Start with specific daemon address
./darkghost-wallet-cli --daemon-address localhost:31313
```

### Wallet Creation and Management

#### Creating a New Wallet

```bash
./darkghost-wallet-cli --generate-new-wallet my_wallet

# You will be prompted for:
# - Password (encrypts wallet file)
# - Language for seed phrase (English, Spanish, etc.)
```

#### Opening an Existing Wallet

```bash
./darkghost-wallet-cli --wallet-file my_wallet

# You will be prompted for the wallet password
```

#### Restoring from Seed

```bash
./darkghost-wallet-cli --restore-deterministic-wallet

# You will be prompted for:
# - Wallet name
# - Password
# - Seed phrase (25 words)
# - Restore height (optional, for faster sync)
```

### Wallet Commands

#### Basic Information

```
# Show wallet address
address

# Show balance
balance

# Show blockchain height
height

# Show wallet status
status
```

#### Transaction Management

```
# Send DG to an address
transfer <address> <amount>

# Example:
transfer DG1YourRecipientAddressHere 10.5

# Send to multiple recipients
transfer <address1> <amount1> <address2> <amount2>

# Sweep all funds to an address
sweep_all <address>

# Sweep specific outputs
sweep_single <key_image> <address>

# Show transaction history
show_transfers

# Show incoming transfers
incoming_transfers

# Export wallet outputs
export_outputs outputs.bin

# Import wallet outputs
import_outputs outputs.bin
```

#### Advanced Wallet Features

```
# Generate a new integrated address with payment ID
integrated_address

# Generate a new subaddress
address new

# Show all subaddresses
address all

# Label a subaddress
address label <index> <label>

# Set transaction priority
set priority 2  # 1=low, 2=medium, 3=high, 4=unimportant

# Set ring size
set ring_size 11

# Enable/disable auto-refresh
set auto-refresh 1

# Refresh wallet manually
refresh

# Save wallet
save

# Change wallet password
password
```

#### View-Only Wallet

```
# Create view-only wallet from existing wallet
export_key_images key_images

# In view-only wallet:
import_key_images key_images
```

### Wallet Security

#### Backup Commands

```
# Show seed phrase (25 words)
seed

# Show view key
viewkey

# Show spend key (DANGER: Never share this!)
spendkey

# Backup wallet file
save
```

#### Security Settings

```
# Enable wallet encryption
password

# Set auto-save interval
set auto-save 1

# Enable/disable mining
start_mining 4  # 4 threads
stop_mining
```

## DarkGhost RPC Client (`darkghost-cli`)

### Basic Usage

```bash
# Get node information
./darkghost-cli get_info

# Get blockchain height
./darkghost-cli get_height

# Get block hash
./darkghost-cli get_block_hash 12345

# Get block details
./darkghost-cli get_block 12345

# Get transaction details
./darkghost-cli get_transactions tx_hash1 tx_hash2

# Start mining
./darkghost-cli start_mining DG1YourMiningAddressHere 4

# Stop mining
./darkghost-cli stop_mining

# Save blockchain
./darkghost-cli save

# Stop daemon
./darkghost-cli exit
```

### Advanced RPC Commands

```bash
# Get network connections
./darkghost-cli get_connections

# Get peer list
./darkghost-cli get_peer_list

# Ban a peer
./darkghost-cli ban 192.168.1.100

# Unban a peer
./darkghost-cli unban 192.168.1.100

# Flush transaction pool
./darkghost-cli flush_txpool

# Get mining status
./darkghost-cli mining_status

# Get transaction pool backlog
./darkghost-cli get_txpool_backlog
```

## Key Generator (`darkghost-gen-key`)

### Basic Usage

```bash
# Generate a new key pair
./darkghost-gen-key

# Generate a key pair with specific parameters
./darkghost-gen-key --language English --restore-height 0

# Validate an address
./darkghost-gen-key --address DG1YourAddressHere
```

## Common CLI Workflows

### 1. Setting Up a New Node

```bash
# 1. Create configuration file
cat > darkghost.conf << EOF
data-dir=/home/user/.darkghost
log-file=/home/user/.darkghost/darkghost.log
log-level=3
rpc-bind-ip=127.0.0.1
rpc-bind-port=31314
rpc-login=darkghost:your_secure_password
EOF

# 2. Create data directory
mkdir -p /home/user/.darkghost

# 3. Start the daemon
./darkghostd --config-file darkghost.conf

# 4. Monitor sync progress (in another terminal)
./darkghost-cli get_info
```

### 2. Creating and Using a Wallet

```bash
# 1. Create new wallet
./darkghost-wallet-cli --generate-new-wallet my_wallet

# 2. Note the seed phrase and store it securely
# 3. Set a strong password
# 4. Note the wallet address

# 5. In wallet CLI, check balance
balance

# 6. Send funds
transfer DG1RecipientAddressHere 10.5

# 7. Check transaction status
show_transfers
```

### 3. Mining Setup

```bash
# 1. Start daemon with mining enabled
./darkghostd --start-mining DG1YourMiningAddressHere --mining-threads 4

# 2. Or start mining via RPC
./darkghost-cli start_mining DG1YourMiningAddressHere 4

# 3. Check mining status
./darkghost-cli mining_status

# 4. Monitor hashrate
./darkghost-cli get_info
```

### 4. Backup and Recovery

```bash
# 1. In wallet CLI, export seed phrase
seed

# 2. Store seed phrase securely (offline storage)

# 3. Backup wallet file
save

# 4. Copy wallet file to secure location
cp my_wallet /secure/backup/location/

# 5. To restore:
./darkghost-wallet-cli --restore-deterministic-wallet
```

## Environment Variables

### Supported Variables

```bash
# Set RPC credentials
export DARKGHOST_RPC_USER=username
export DARKGHOST_RPC_PASSWORD=password

# Set daemon address
export DARKGHOST_DAEMON_ADDRESS=localhost:31313

# Set wallet file
export DARKGHOST_WALLET_FILE=my_wallet

# Set log level
export DARKGHOST_LOG_LEVEL=3
```

## Scripting Examples

### Bash Script for Node Monitoring

```bash
#!/bin/bash

# monitor_node.sh
while true; do
    echo "=== DarkGhost Node Status ==="
    ./darkghost-cli get_info | grep -E "height|difficulty|status"
    echo "Connections: $(./darkghost-cli get_connections | grep -c peer)"
    echo "Last check: $(date)"
    echo "============================"
    sleep 60
done
```

### Python Script for Wallet Balance

```python
#!/usr/bin/env python3

import subprocess
import json

def get_wallet_balance():
    try:
        result = subprocess.run(
            ['./darkghost-cli', 'get_balance'],
            capture_output=True,
            text=True,
            check=True
        )
        data = json.loads(result.stdout)
        balance = data['result']['balance'] / 100000000  # Convert from atomic units
        return balance
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")
        return None

if __name__ == "__main__":
    balance = get_wallet_balance()
    if balance is not None:
        print(f"Wallet balance: {balance:.8f} DG")
```

## Troubleshooting

### Common Issues and Solutions

#### 1. Daemon Won't Start

```bash
# Check logs
tail -f ~/.darkghost/darkghost.log

# Verify configuration
./darkghostd --help

# Check ports
netstat -tlnp | grep 31313
```

#### 2. Wallet Connection Issues

```bash
# Check daemon status
./darkghost-cli get_info

# Verify daemon is running
ps aux | grep darkghostd

# Check RPC settings
./darkghost-wallet-cli --daemon-address correct_address:31313
```

#### 3. Sync Problems

```bash
# Check sync status
./darkghost-cli sync_info

# Add more peers
./darkghost-cli add_peer seed.darkghost.network:31313

# Check firewall
sudo ufw status
```

#### 4. Transaction Issues

```bash
# Check transaction pool
./darkghost-cli get_transaction_pool

# Verify funds
./darkghost-wallet-cli balance

# Check ring size
./darkghost-wallet-cli set ring_size 11
```

### Debugging Options

#### Verbose Logging

```bash
# Start with maximum verbosity
./darkghostd --log-level 4

# Log to file with timestamp
./darkghostd --log-file darkghost.log --log-level 3
```

#### Network Debugging

```bash
# Show detailed connection info
./darkghost-cli get_connections

# Ban problematic peers
./darkghost-cli ban problematic_peer_ip

# Reset peer list
./darkghost-cli flush_peer_list
```

## Performance Tuning

### Daemon Optimization

```bash
# Increase database sync mode
./darkghostd --db-sync-mode fast

# Adjust block sync size
./darkghostd --block-sync-size 200

# Limit connections
./darkghostd --out-peers 10 --in-peers 20
```

### Wallet Optimization

```bash
# Increase refresh rate
./darkghost-wallet-cli set refresh-rate 5

# Adjust auto-save interval
./darkghost-wallet-cli set auto-save 1

# Use subaddresses for better performance
./darkghost-wallet-cli address new
```

## Security Best Practices

### Daemon Security

1. **RPC Authentication**: Always use strong RPC credentials
2. **Network Binding**: Bind RPC to localhost only when possible
3. **Firewall**: Configure firewall to restrict access
4. **Updates**: Keep daemon software updated

### Wallet Security

1. **Strong Passwords**: Use complex wallet passwords
2. **Seed Backup**: Store seed phrases securely offline
3. **File Permissions**: Restrict wallet file permissions
4. **View Keys**: Use view-only wallets for monitoring

### Example Secure Configuration

```ini
# Secure darkghost.conf
data-dir=/home/user/.darkghost
log-file=/home/user/.darkghost/darkghost.log
log-level=1  # Reduce log verbosity

# RPC Security
rpc-bind-ip=127.0.0.1  # Localhost only
rpc-bind-port=31314
rpc-login=strong_user:very_secure_password
rpc-restricted-bind-port=31315  # For public access

# Network Security
out-peers=8
in-peers=0  # Disable incoming connections if not needed
```

## Advanced Features

### Restricted RPC Mode

```bash
# Start daemon with restricted RPC
./darkghostd --restricted-rpc

# Or in configuration:
restricted-rpc=1
rpc-restricted-bind-port=31315
```

### Blockchain Pruning

```bash
# Start daemon with pruned blockchain
./darkghostd --prune-blockchain

# Check pruning status
./darkghost-cli get_info | grep pruning
```

### Bootstrap Node

```bash
# Start as bootstrap node
./darkghostd --bootstrap-daemon-address seed.darkghost.network:31313
```

## Support and Resources

### Documentation

- **Official Docs**: https://docs.darkghost.network
- **API Reference**: API.md in this repository
- **JSON-RPC Guide**: Detailed RPC method documentation

### Community Support

- **Discord**: discord.gg/darkghost
- **Reddit**: r/darkghost
- **Telegram**: t.me/darkghostcoin
- **GitHub Issues**: Report bugs and request features

### Professional Support

- **Enterprise Solutions**: enterprise@darkghost.network
- **Security Audits**: security@darkghost.network
- **Consulting**: consulting@darkghost.network

The DarkGhost CLI tools provide powerful and flexible ways to interact with the DarkGhost network. Whether you're running a full node, managing wallets, or building applications, these tools offer the functionality you need with the privacy and security that DarkGhost is known for.
