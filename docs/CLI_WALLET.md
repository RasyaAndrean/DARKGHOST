# DarkGhost CLI Wallet Guide

This document provides instructions for using the DarkGhost command-line wallet.

## Overview

The DarkGhost CLI wallet (`darkghost_wallet`) is a command-line interface for managing DarkGhost transactions and addresses. It provides full privacy features including RingCT transactions, stealth addresses, and bulletproofs.

## Building the Wallet

### Prerequisites

- C++11 compatible compiler
- CMake 3.10 or higher
- Make build system

### Building

```bash
# From the project root directory
mkdir build && cd build
cmake ..
make darkghost_wallet
```

Or on Windows:

```cmd
scripts\build.bat
```

## Running the Wallet

### Starting the Wallet

```bash
./darkghost_wallet
```

Or on Windows:

```cmd
build\darkghost_wallet.exe
```

### Wallet Commands

Once the wallet is running, you can use the following commands:

#### `help`

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

#### `address`

Display your wallet address and stealth address:

```
DarkGhost> address
Wallet Address: abc123...
Stealth Address: dg1xyz...
```

#### `balance`

Show your wallet balance:

```
DarkGhost> balance
Balance: 1000.00 DG
Atomic Units: 100000000000
```

#### `send`

Send DarkGhost coins to another address:

```
DarkGhost> send
Recipient address: dg1recipient...
Amount (DG): 50.0
Transaction sent successfully!
Amount: 50 DG
Recipient: dg1recipient...
```

#### `receive`

Generate a new stealth address for receiving payments:

```
DarkGhost> receive
Generating new stealth address for receiving...
Share this address to receive DarkGhost coins:
dg1newstealthaddress...
```

#### `exit`

Exit the wallet:

```
DarkGhost> exit
Exiting DarkGhost wallet...
```

## Wallet Features

### Privacy Features

- **RingCT Transactions**: All transactions use Ring Confidential Transactions with 11-ring size by default
- **Stealth Addresses**: Each transaction uses a one-time address to prevent linking
- **Bulletproofs**: Transaction amounts are encrypted using Bulletproofs range proofs

### Security Features

- **Key Management**: Secure generation and storage of private keys
- **View Keys**: Support for view-only wallets to monitor incoming transactions
- **Encryption**: Wallet files are encrypted at rest

## Configuration

The CLI wallet currently uses default parameters, but future versions will support configuration files.

## Troubleshooting

### Common Issues

1. **"Insufficient balance"**: Ensure you have enough funds to cover both the transfer amount and transaction fees
2. **"Unknown command"**: Check spelling and use the `help` command to see available commands
3. **Connection issues**: Ensure the DarkGhost node is running and accessible

### Error Messages

- `Error: Bulletproofs not initialized!` - The privacy system failed to initialize
- `Error: Value out of range!` - Transaction amount exceeds valid range
- `Insufficient balance!` - Not enough funds in wallet

## Future Enhancements

Planned features for the CLI wallet:

1. Configuration file support
2. Wallet import/export functionality
3. Multi-signature transactions
4. Hardware wallet integration
5. Advanced transaction features (sweep, transfer, etc.)
6. JSON-RPC interface

## Contributing

To contribute to the CLI wallet development:

1. Review the existing code in [`src/wallet/cli_wallet.cpp`](../src/wallet/cli_wallet.cpp)
2. Follow the coding standards in [STYLE_GUIDE.md](STYLE_GUIDE.md)
3. Add tests for new functionality
4. Submit a pull request
