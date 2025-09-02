# DarkGhost UTXO Model Implementation

This document describes how DarkGhost implements the Unspent Transaction Output (UTXO) model, combining Bitcoin's efficiency with Monero's privacy.

## Overview

DarkGhost uses a UTXO-based blockchain model similar to Bitcoin, where transactions consume existing outputs and create new ones. However, it enhances this model with privacy features from Monero.

## Key Concepts

### Unspent Transaction Outputs (UTXOs)
UTXOs represent spendable coins in the DarkGhost network:
- Each UTXO has a specific amount and owner
- UTXOs can only be spent once
- New UTXOs are created when transactions are processed

### Transaction Structure
A DarkGhost transaction consists of:
- **Inputs**: References to previous UTXOs to spend
- **Outputs**: New UTXOs created by the transaction
- **Privacy Data**: Ring signatures, Bulletproofs, stealth addresses

### Block Structure
Blocks contain:
- **Header**: Metadata about the block
- **Transaction List**: List of transactions in the block
- **Merkle Root**: Hash of all transactions in the block

## Implementation Details

### UTXO Structure
The UTXO structure is defined in [`src/core/blockchain.h`](../src/core/blockchain.h):

```cpp
struct UTXO {
  std::string tx_hash;  // Hash of the transaction that created this UTXO
  uint32_t index;       // Index of this UTXO in the transaction
  uint64_t amount;      // Amount in atomic units
  std::string pubkey;   // Public key that can spend this UTXO
};
```

### Block Structure
The Block structure is also defined in [`src/core/blockchain.h`](../src/core/blockchain.h):

```cpp
struct Block {
  uint32_t height;              // Block height
  std::string prev_hash;        // Hash of previous block
  std::string merkle_root;      // Merkle root of transactions
  uint64_t timestamp;           // Block creation timestamp
  uint32_t nonce;               // Nonce for PoW
  std::vector<std::string> transactions; // Transaction hashes
  uint64_t reward;              // Block reward
};
```

### Blockchain Class
The main blockchain implementation is in [`src/core/blockchain.cpp`](../src/core/blockchain.cpp):

```cpp
class Blockchain {
public:
  void initialize();
  bool addBlock(const Block &block);
  std::vector<UTXO> getUTXOs(const std::string &address);
  uint64_t getCurrentSupply();
};
```

## Privacy Integration

### RingCT with UTXO
DarkGhost integrates RingCT with the UTXO model:
- **Input Mixing**: Real UTXO inputs are mixed with decoy UTXOs
- **Amount Hiding**: Transaction amounts are encrypted using Bulletproofs
- **One-time Addresses**: Each output uses a stealth address

### Transaction Process
1. **Input Selection**: Select UTXOs to spend and decoy UTXOs
2. **Ring Signature**: Create ring signature with real and decoy inputs
3. **Amount Commitment**: Create Pedersen commitments for amounts
4. **Range Proof**: Generate Bulletproof for amount validation
5. **Output Creation**: Create new UTXOs with stealth addresses
6. **Transaction Broadcast**: Broadcast to the network

### UTXO Set Management
The UTXO set is maintained in memory:
- **Addition**: New UTXOs are added when blocks are processed
- **Removal**: Spent UTXOs are removed from the set
- **Validation**: UTXO existence is checked during transaction validation

## Supply Model

### Fixed Supply
DarkGhost has a fixed supply of 100 million DG:
- **Initial Reward**: 50 DG per block
- **Halving**: Every 4 years (1,051,200 blocks)
- **No Tail Emission**: Supply stops increasing after all coins are mined

### Halving Schedule
```
Height      Reward      Total Supply
0           50 DG       50 DG
1,051,200   25 DG       26,280,050 DG
2,102,400   12.5 DG     39,420,075 DG
...
```

### Supply Tracking
The current supply is tracked in the Blockchain class:
```cpp
uint64_t Blockchain::getCurrentSupply() { 
  return total_supply; 
}
```

## Performance Considerations

### Memory Usage
The UTXO set is maintained in memory for fast access:
- **Current Size**: ~100MB with 1 million UTXOs
- **Growth Rate**: ~100KB per day with 1000 transactions/day
- **Optimization**: Pruning spent UTXOs immediately

### Disk Storage
Blockchain data is stored on disk:
- **Block Storage**: Serialized block data
- **Index Files**: Fast lookup of blocks and transactions
- **UTXO Database**: Persistent UTXO set (for node restarts)

### Transaction Processing
Transaction processing is optimized for:
- **Validation Speed**: Fast UTXO lookup
- **Memory Efficiency**: Minimal memory footprint
- **Concurrency**: Thread-safe operations

## Security Features

### Double-Spending Prevention
The UTXO model prevents double-spending:
- **Consensus**: Network agrees on valid transactions
- **Validation**: Nodes verify UTXO existence before spending
- **Immutability**: Blockchain history cannot be changed

### Privacy Enhancements
Privacy is enhanced through:
- **Ring Signatures**: Unlinkable transactions
- **Bulletproofs**: Hidden transaction amounts
- **Stealth Addresses**: Unlinkable recipients

### Network Security
Network security is maintained through:
- **Proof of Work**: Computational security
- **Block Verification**: Cryptographic validation
- **Peer-to-Peer**: Decentralized network

## Comparison with Bitcoin

### Similarities
- **UTXO Model**: Same fundamental model as Bitcoin
- **Block Structure**: Similar block structure
- **Proof of Work**: Same consensus mechanism (RandomX v2)

### Differences
- **Privacy**: DarkGhost adds RingCT, Bulletproofs, and stealth addresses
- **Block Time**: 2 minutes vs Bitcoin's 10 minutes
- **Supply**: Fixed 100M vs Bitcoin's 21M with different emission curve
- **Transaction Size**: Larger due to privacy features

## Future Enhancements

### Scalability Improvements
1. **UTXO Commitments**: Compress UTXO set in blocks
2. **DAG Sidechains**: Parallel transaction processing
3. **Light Clients**: Efficient mobile wallet protocols

### Privacy Enhancements
1. **Confidential Assets**: Colored coins on UTXO model
2. **Aggregate Signatures**: Combine multiple signatures
3. **Bulletproof++**: More efficient range proofs

### Performance Optimizations
1. **Database Improvements**: Faster UTXO database
2. **Memory Management**: Reduced memory footprint
3. **Parallel Processing**: Concurrent transaction validation

## Testing and Validation

### Unit Tests
The UTXO implementation is tested in:
- [`src/tests/blockchain_test.cpp`](../src/tests/blockchain_test.cpp)

### Integration Tests
Integration testing covers:
- **Block Processing**: Adding blocks to the chain
- **Transaction Validation**: Validating UTXO transactions
- **Supply Tracking**: Verifying correct supply calculation

### Performance Tests
Performance testing includes:
- **UTXO Lookup**: Speed of UTXO set operations
- **Transaction Processing**: Throughput of transaction validation
- **Memory Usage**: Memory consumption under load

## Contributing

To contribute to the UTXO model implementation:
1. Review the existing code in [`src/core/`](../src/core/)
2. Follow the coding standards in [STYLE_GUIDE.md](STYLE_GUIDE.md)
3. Add tests for new functionality
4. Submit a pull request