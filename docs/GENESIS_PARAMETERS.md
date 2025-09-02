# DarkGhost Genesis Parameters

This document describes the key parameters that define the DarkGhost blockchain.

## Network Parameters

| Parameter | Value | Description |
|----------|-------|-------------|
| Network ID | "DarkGhost Mainnet" | Identifier for the main network |
| Mainnet Magic Bytes | 0x44474d4e | Magic bytes for mainnet ("DG" in hex) |
| Testnet Magic Bytes | 0x4447544e | Magic bytes for testnet ("DGTN" in hex) |
| Devnet Magic Bytes | 0x4447444e | Magic bytes for devnet ("DGDN" in hex) |

## Genesis Block

| Parameter | Value | Description |
|----------|-------|-------------|
| Genesis Block Hash | 0000000000000000000000000000000000000000000000000000000000000000 | SHA256 hash of genesis block |
| Genesis Timestamp | 1756742400 | September 1, 2025 00:00:00 UTC |
| Genesis Nonce | 123456 | Nonce value for genesis block |
| Initial Block Reward | 5000000000 | 50 DG in atomic units |

## Consensus Parameters

| Parameter | Value | Description |
|----------|-------|-------------|
| Block Time | 120 seconds | Target time between blocks (2 minutes) |
| Initial Block Reward | 5000000000 | 50 DG in atomic units |
| Max Supply | 10000000000000000 | 100 million DG in atomic units |
| Halving Interval | 1051200 blocks | Every 4 years (262800 blocks per year × 4) |
| Tail Emission | false | No tail emission - fixed supply |

## Privacy Parameters

| Parameter | Value | Description |
|----------|-------|-------------|
| Default Ring Size | 11 | 10 decoys + 1 real output |
| Minimum Ring Size | 5 | Minimum allowed ring size |
| Maximum Ring Size | 32 | Maximum allowed ring size |

## Transaction Parameters

| Parameter | Value | Description |
|----------|-------|-------------|
| Minimum Fee | 10000 | 0.0001 DG in atomic units |
| Fee Per Byte | 10 | Fee per byte of transaction data |
| Fee Quantization Mask | 10000 | Round fees to nearest 0.0001 DG |

## Block Parameters

| Parameter | Value | Description |
|----------|-------|-------------|
| Initial Max Block Size | 20000 bytes | Initial maximum block size |
| Max Block Size Growth Rate | 1024 | Growth rate per year |
| Block Size Median Window | 100 | Median calculation window |

## P2P Network Parameters

| Parameter | Value | Description |
|----------|-------|-------------|
| P2P Default Port | 18080 | Default port for P2P network |
| RPC Default Port | 18081 | Default port for RPC interface |
| ZMQ RPC Default Port | 18082 | Default port for ZMQ RPC interface |

## Security Checkpoints

| Parameter | Value | Description |
|----------|-------|-------------|
| Checkpoint Height | 0 | Height of security checkpoint |
| Checkpoint Hash | 0000000000000000000000000000000000000000000000000000000000000000 | Hash of checkpoint block |

## Atomic Units

DarkGhost uses atomic units for all internal calculations:
- 1 DG = 100,000,000 atomic units
- This provides 8 decimal places of precision

## Constants in Code

These parameters are defined in the following files:
- [`src/core/genesis.h`](../src/core/genesis.h) - Main parameter definitions
- [`src/darkghost.h`](../src/darkghost.h) - Exported constants

## Future Considerations

Some parameters may be adjusted through hard forks:
- Block size limits
- Fee structure
- Ring size requirements
- Consensus algorithm updates

Any changes to these parameters will be announced well in advance and implemented through the standard upgrade process.