# DarkGhost Command-Line Interface (CLI)

This document describes the DarkGhost command-line interface, including node commands, wallet commands, and utility functions.

## Overview

DarkGhost provides two main command-line interfaces:

- **darkghostd**: The main node daemon
- **darkghost_wallet**: The command-line wallet

Both tools support extensive command-line options for configuration and operation.

## DarkGhost Node (darkghostd)

### Basic Usage

```bash
darkghostd [options]
```

### Common Options

#### Network Options

- `--mainnet`: Run on mainnet (default)
- `--testnet`: Run on testnet
- `--devnet`: Run on devnet
- `--data-dir <directory>`: Specify data directory
- `--config-file <file>`: Specify configuration file

#### RPC Options

- `--rpc-bind-ip <ip>`: IP to bind RPC server (default: 127.0.0.1)
- `--rpc-bind-port <port>`: Port to bind RPC server (default: 18081)
- `--rpc-login <username:password>`: RPC authentication
- `--confirm-external-bind`: Confirm external RPC binding

#### P2P Options

- `--p2p-bind-ip <ip>`: IP to bind P2P server (default: 0.0.0.0)
- `--p2p-bind-port <port>`: Port to bind P2P server (default: 18080)
- `--add-peer <ip:port>`: Add peer to connect to
- `--seed-node <ip:port>`: Connect to seed node

#### Logging Options

- `--log-file <file>`: Specify log file
- `--log-level <level>`: Set log level (trace, debug, info, warn, error)
- `--log-format <format>`: Set log format (default, json)
- `--max-log-file-size <size>`: Maximum log file size

#### Performance Options

- `--max-concurrency <n>`: Maximum concurrency
- `--block-sync-size <n>`: Block sync size
- `--block-download-timeout <seconds>`: Block download timeout

### Node Commands

#### Starting the Node

```bash
# Start node with default settings
darkghostd

# Start node with custom data directory
darkghostd --data-dir /path/to/data

# Start node on testnet
darkghostd --testnet

# Start node with RPC authentication
darkghostd --rpc-login user:password
```

#### Stopping the Node

```bash
# Graceful shutdown
kill -TERM $(pidof darkghostd)

# Force shutdown (not recommended)
kill -KILL $(pidof darkghostd)
```

#### Node Status

```bash
# Check node status via RPC
curl -X POST http://127.0.0.1:18081/json_rpc \
  -H 'Content-Type: application/json' \
  -d '{
    "jsonrpc": "2.0",
    "id": "0",
    "method": "get_info"
  }'
```

### Configuration File

The node can be configured through a configuration file (`darkghost.conf`):

```ini
# Network settings
mainnet=1
testnet=0
devnet=0

# Data directory
data-dir=/path/to/data

# RPC settings
rpc-bind-ip=127.0.0.1
rpc-bind-port=18081
rpc-login=user:password

# P2P settings
p2p-bind-ip=0.0.0.0
p2p-bind-port=18080

# Logging settings
log-file=/path/to/darkghost.log
log-level=info

# Performance settings
max-concurrency=4
```

## DarkGhost Wallet (darkghost_wallet)

### Basic Usage

```bash
darkghost_wallet [options]
```

### Common Options

#### Wallet Options

- `--wallet-file <file>`: Use wallet file
- `--generate-new-wallet <file>`: Generate new wallet
- `--daemon-address <ip:port>`: Use daemon instance at <ip:port>
- `--password <password>`: Wallet password

#### Security Options

- `--restore-deterministic-wallet`: Restore deterministic wallet
- `--restore-height <height>`: Restore from block height
- `--electrum-seed <seed>`: Specify Electrum seed for wallet recovery

#### RPC Options

- `--daemon-host <host>`: Daemon host
- `--daemon-port <port>`: Daemon port
- `--trusted-daemon`: Enable commands which rely on a trusted daemon

### Wallet Commands

#### Starting the Wallet

```bash
# Start wallet with existing file
darkghost_wallet --wallet-file my_wallet --password my_password

# Generate new wallet
darkghost_wallet --generate-new-wallet new_wallet --password my_password

# Restore from seed
darkghost_wallet --restore-deterministic-wallet --electrum-seed "sequence of words"
```

#### Interactive Wallet Commands

Once the wallet is running, you can use the following commands:

##### help

Display available commands:

```
DarkGhost> help
Available commands:
  help     - Show this help message
  address  - Show wallet address
  balance  - Show wallet balance
  send     - Send DarkGhost coins
  receive  - Receive DarkGhost coins
  exit     - Exit the wallet
```

##### address

Display wallet address:

```
DarkGhost> address
Wallet Address: dg1abc123...
Stealth Address: dg1def456...
```

##### balance

Show wallet balance:

```
DarkGhost> balance
Balance: 1000.00 DG
Unlocked Balance: 500.00 DG
Atomic Units: 100000000000
```

##### send

Send DarkGhost coins:

```
DarkGhost> send
Recipient address: dg1recipient...
Amount (DG): 50.0
Transaction sent successfully!
Transaction Hash: abc123...
Transaction Key: def456...
Fee: 0.0001 DG
```

##### receive

Generate stealth address for receiving:

```
DarkGhost> receive
Generating new stealth address for receiving...
Share this address to receive DarkGhost coins:
dg1newstealthaddress...
```

##### exit

Exit the wallet:

```
DarkGhost> exit
Exiting DarkGhost wallet...
```

### Wallet Configuration

The wallet can be configured through command-line options or configuration files:

```ini
# Daemon settings
daemon-address=127.0.0.1:18081

# Wallet settings
wallet-file=my_wallet
password=my_password

# Security settings
trusted-daemon=1
```

## Utility Commands

### Key Generation

Generate new key pairs:

```bash
# Generate new wallet keys
darkghost_wallet --generate-new-wallet temp_wallet --password temp_password
```

### Blockchain Utilities

Utilities for blockchain analysis:

```bash
# Export blockchain to file
darkghostd --export-blockchain --data-dir /path/to/data

# Import blockchain from file
darkghostd --import-blockchain --data-dir /path/to/data
```

### Transaction Utilities

Utilities for transaction analysis:

```bash
# Decode raw transaction
darkghost_wallet --decode-raw-tx <hex_transaction>

# Verify transaction signature
darkghost_wallet --verify-tx <hex_transaction>
```

## Advanced Usage

### Mining

Start mining with the node:

```bash
# Start mining with 4 threads
darkghostd --start-mining --mining-threads 4 --mining-address dg1miner...

# Stop mining
darkghostd --stop-mining
```

### Network Analysis

Analyze network connectivity:

```bash
# Show peer list
darkghostd --print-pl

# Show blockchain status
darkghostd --print-bc
```

### Debugging

Enable debugging features:

```bash
# Enable debug logging
darkghostd --log-level debug

# Enable trace logging
darkghostd --log-level trace

# Log to file
darkghostd --log-file /path/to/debug.log
```

## Scripting and Automation

### Batch Scripts

Create batch scripts for automated operations:

#### Windows Batch Script

```batch
@echo off
echo Starting DarkGhost Node...
darkghostd --data-dir C:\darkghost\data --log-file C:\darkghost\logs\node.log
```

#### Linux Shell Script

```bash
#!/bin/bash
echo "Starting DarkGhost Node..."
darkghostd --data-dir /home/user/darkghost/data --log-file /home/user/darkghost/logs/node.log
```

### Cron Jobs

Schedule regular operations with cron:

```bash
# Daily backup at 2 AM
0 2 * * * /path/to/backup_script.sh

# Hourly status check
0 * * * * /path/to/status_check.sh
```

### JSON-RPC Automation

Automate operations through JSON-RPC:

```bash
#!/bin/bash
# Get node info
curl -s -X POST http://127.0.0.1:18081/json_rpc \
  -H 'Content-Type: application/json' \
  -d '{
    "jsonrpc": "2.0",
    "id": "0",
    "method": "get_info"
  }' | jq '.result.height'
```

## Security Best Practices

### Node Security

- **Firewall**: Restrict RPC access to trusted IPs
- **Authentication**: Use strong RPC passwords
- **Updates**: Keep node software updated
- **Backups**: Regularly backup wallet files

### Wallet Security

- **Passwords**: Use strong wallet passwords
- **Storage**: Store wallet files securely
- **Backups**: Backup wallet files and seed phrases
- **Offline**: Use cold storage for large amounts

### Network Security

- **Tor**: Use Tor for enhanced privacy
- **VPN**: Use VPN for network anonymity
- **Updates**: Keep system software updated
- **Monitoring**: Monitor for suspicious activity

## Troubleshooting

### Common Issues

#### Node Won't Start

```
Error: Failed to bind to port 18080
```

**Solution**: Check if another instance is running or change the port.

#### Wallet Connection Failed

```
Error: Couldn't connect to daemon
```

**Solution**: Ensure the node is running and accessible.

#### Insufficient Funds

```
Error: Not enough money
```

**Solution**: Check wallet balance and ensure funds are unlocked.

#### Sync Issues

```
Error: Blockchain not synced
```

**Solution**: Wait for blockchain to sync or check network connectivity.

### Log Analysis

Check logs for detailed error information:

```bash
# View recent log entries
tail -f /path/to/darkghost.log

# Search for errors
grep -i error /path/to/darkghost.log

# View last 100 lines
tail -100 /path/to/darkghost.log
```

### Performance Monitoring

Monitor node performance:

```bash
# Check system resources
top -p $(pidof darkghostd)

# Check disk usage
df -h /path/to/data

# Check network usage
iftop -i eth0
```

## Environment Variables

### Node Variables

- `DARKGHOST_DATA_DIR`: Default data directory
- `DARKGHOST_CONFIG_FILE`: Default configuration file
- `DARKGHOST_LOG_LEVEL`: Default log level

### Wallet Variables

- `DARKGHOST_WALLET_FILE`: Default wallet file
- `DARKGHOST_DAEMON_ADDRESS`: Default daemon address
- `DARKGHOST_WALLET_PASSWORD`: Default wallet password

## Docker Usage

### Running Node in Docker

```bash
# Run node in Docker
docker run -d \
  --name darkghost-node \
  -p 18080:18080 \
  -p 18081:18081 \
  -v /path/to/data:/data \
  darkghost/darkghostd \
  --data-dir /data
```

### Running Wallet in Docker

```bash
# Run wallet in Docker
docker run -it \
  --name darkghost-wallet \
  -v /path/to/wallets:/wallets \
  darkghost/darkghost_wallet \
  --wallet-file /wallets/my_wallet \
  --password my_password
```

## Integration Examples

### Python Integration

```python
import subprocess
import json

def get_node_info():
    result = subprocess.run([
        'curl', '-s', '-X', 'POST',
        'http://127.0.0.1:18081/json_rpc',
        '-H', 'Content-Type: application/json',
        '-d', json.dumps({
            "jsonrpc": "2.0",
            "id": "0",
            "method": "get_info"
        })
    ], capture_output=True, text=True)

    return json.loads(result.stdout)

info = get_node_info()
print(f"Block height: {info['result']['height']}")
```

### Bash Integration

```bash
#!/bin/bash

# Function to get wallet balance
get_balance() {
    curl -s -X POST http://127.0.0.1:18081/json_rpc \
      -H 'Content-Type: application/json' \
      -d '{
        "jsonrpc": "2.0",
        "id": "0",
        "method": "get_balance"
      }' | jq -r '.result.balance'
}

balance=$(get_balance)
echo "Wallet balance: $balance atomic units"
```

## Resources

### Documentation

- [API.md](API.md) - API documentation
- [WALLET.md](WALLET.md) - Wallet documentation
- [MINING.md](MINING.md) - Mining documentation
- [SECURITY.md](SECURITY.md) - Security guidelines

### Tools

- [curl](https://curl.se/) - Command-line HTTP client
- [jq](https://stedolan.github.io/jq/) - JSON processor
- [screen](https://www.gnu.org/software/screen/) - Terminal multiplexer
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer

### References

- [Bitcoin CLI](https://en.bitcoin.it/wiki/Original_Bitcoin_client/API_calls_list)
- [Monero CLI](https://wwww.getmonero.org/resources/developer-guides/wallet-rpc.html)
- [Command-Line Interface](https://en.wikipedia.org/wiki/Command-line_interface)

## Last Updated

September 2, 2025

---
