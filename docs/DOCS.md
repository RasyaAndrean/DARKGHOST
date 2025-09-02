# DarkGhost Documentation

## Project Structure

```
DarkGhost/
├── src/                    # Source code
│   ├── core/              # Core blockchain functionality
│   │   ├── blockchain.h   # UTXO-based blockchain
│   │   └── blockchain.cpp
│   ├── consensus/         # Consensus algorithms
│   │   ├── randomx_v2.h   # RandomX v2 implementation
│   │   └── randomx_v2.cpp
│   ├── privacy/           # Privacy features
│   │   ├── ringct.h       # Ring Confidential Transactions
│   │   └── ringct.cpp
│   ├── wallet/            # Wallet functionality
│   │   ├── stealth_address.h
│   │   ├── stealth_address.cpp
│   │   └── cli_wallet.cpp
│   └── main.cpp           # Main entry point
├── build/                 # Build output directory
├── docs/                  # Documentation
├── wallets/               # Wallet storage
├── logs/                  # Log files
├── darkghost.conf         # Configuration file
├── Makefile              # Build instructions (Linux/macOS)
├── build.bat             # Build script (Windows)
├── README.md             # Project overview
└── DOCS.md               # This file
```

## Core Components

### 1. Blockchain (UTXO Model)

DarkGhost uses a UTXO (Unspent Transaction Output) model similar to Bitcoin, but with enhanced privacy features.

Key features:

- Fixed supply of 100 million DG
- 2-minute block time
- Dynamic block sizing
- Halving every 4 years

### 2. Consensus (RandomX v2)

RandomX v2 is a CPU-friendly, ASIC-resistant mining algorithm:

- Optimized for general-purpose CPUs
- Resistant to specialized mining hardware
- 2-minute target block time
- Difficulty adjustment mechanism

### 3. Privacy Features

DarkGhost implements Monero-style privacy on a UTXO model:

#### RingCT (Ring Confidential Transactions)

- Mixes real transaction inputs with decoy inputs
- Default ring size of 11 (10 decoys + 1 real)
- Uses Pedersen commitments to hide transaction amounts

#### Stealth Addresses

- One-time addresses for each transaction
- Prevents linking transactions to a recipient's public address
- Recipients scan the blockchain with their view key

#### Bulletproofs

- Reduces transaction size and verification time
- Efficient range proofs for transaction amounts
- Compresses RingCT transactions by approximately 80%
- Enables faster verification of transaction validity

## Building DarkGhost

### Windows

```cmd
build.bat
```

### Linux/macOS

```bash
make
```

## Configuration

The `darkghost.conf` file contains all node configuration options:

- Network settings
- Consensus parameters
- Privacy settings
- Wallet configuration
- Logging options

## Wallet

DarkGhost includes a CLI wallet for basic operations:

- Address generation
- Balance checking
- Sending and receiving transactions
- Stealth address creation

## Mining

DarkGhost supports CPU mining with XMRig:

```bash
./xmrig -a rx/dg -o pool.darkghost.network:3333 -u WALLET_ADDRESS.WORKER_NAME -p x
```
