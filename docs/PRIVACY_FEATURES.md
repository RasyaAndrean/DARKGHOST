# DarkGhost Privacy Features

This document describes the privacy features implemented in DarkGhost, which combine Bitcoin's UTXO model with Monero's advanced privacy technologies.

## Overview

DarkGhost implements three core privacy technologies:

1. **Ring Confidential Transactions (RingCT)** - Unlinkable transactions
2. **Bulletproofs** - Efficient range proofs for transaction amounts
3. **Stealth Addresses** - One-time addresses for each transaction

These technologies work together to provide complete privacy for DarkGhost users.

## Ring Confidential Transactions (RingCT)

### Concept

RingCT allows transactions to be untraceable by mixing the real input with decoy inputs from the blockchain. Observers cannot determine which input is the real one.

### Implementation

- **Default Ring Size**: 11 (10 decoys + 1 real)
- **Signature Scheme**: Ring signatures with Pedersen commitments
- **Amount Hiding**: Transaction amounts are encrypted

### Files

- [`src/privacy/ringct.h`](../src/privacy/ringct.h) - Class definition
- [`src/privacy/ringct.cpp`](../src/privacy/ringct.cpp) - Implementation

### Key Features

```cpp
class RingCT {
public:
  bool createTransaction(
      const std::vector<std::string> &real_outputs,
      const std::vector<std::vector<std::string>> &decoy_sets,
      uint64_t amount, const std::string &recipient);

  bool verifyTransaction(const std::string &tx_data);
};
```

### Privacy Benefits

- **Unlinkability**: No connection between sender and recipient
- **Untraceability**: Real input cannot be distinguished from decoys
- **Amount Privacy**: Transaction amounts are hidden

## Bulletproofs

### Concept

Bulletproofs are non-interactive zero-knowledge proofs that allow transaction amounts to be validated without revealing the actual amounts.

### Implementation

- **Proof Size**: ~1KB (80% smaller than Borromean)
- **Verification**: Efficient mathematical verification
- **Aggregation**: Multiple proofs can be combined

### Files

- [`src/privacy/bulletproofs.h`](../src/privacy/bulletproofs.h) - Class definition
- [`src/privacy/bulletproofs.cpp`](../src/privacy/bulletproofs.cpp) - Implementation

### Key Features

```cpp
class Bulletproofs {
public:
  std::string generateProof(uint64_t value, uint64_t min_value,
                            uint64_t max_value);

  bool verifyProof(const std::string &proof, uint64_t min_value,
                   uint64_t max_value);

  std::string aggregateProofs(const std::vector<std::string> &proofs);
};
```

### Privacy Benefits

- **Amount Hiding**: Transaction amounts are encrypted
- **Range Validation**: Prevents negative or excessive amounts
- **Size Reduction**: Smaller transaction sizes

## Stealth Addresses

### Concept

Stealth addresses are one-time addresses generated for each transaction to prevent linking multiple transactions to the same recipient.

### Implementation

- **Address Generation**: One-time addresses for each transaction
- **Scan Keys**: View keys to scan for incoming transactions
- **Spend Keys**: Spend keys to authorize outgoing transactions

### Files

- [`src/wallet/stealth_address.h`](../src/wallet/stealth_address.h) - Class definition
- [`src/wallet/stealth_address.cpp`](../src/wallet/stealth_address.cpp) - Implementation

### Key Features

```cpp
class StealthAddress {
public:
  std::string generateAddress(const std::string &recipient_public_key);

  std::vector<std::string>
  scanTransactions(const std::string &view_key,
                   const std::vector<std::string> &blockchain_transactions);

  std::pair<std::string, std::string> generateKeyPair();
};
```

### Privacy Benefits

- **Address Unlinkability**: No connection between transactions
- **Recipient Privacy**: Recipient's main address is hidden
- **Sender Privacy**: Sender cannot link to recipient's other transactions

## Integration with UTXO Model

DarkGhost combines these privacy features with Bitcoin's UTXO model:

### Transaction Process

1. **Input Selection**: Select UTXOs and decoy inputs for RingCT
2. **Amount Commitment**: Create Pedersen commitments for amounts
3. **Ring Signature**: Generate ring signature with real and decoy inputs
4. **Range Proof**: Create Bulletproof for amount validation
5. **Stealth Address**: Generate one-time address for recipient
6. **Transaction Broadcast**: Broadcast to network

### Blockchain Structure

- **UTXO Set**: Maintains unspent transaction outputs
- **Privacy Metadata**: Stores commitment and proof data
- **Block Structure**: Includes privacy-enhanced transactions

## Security Considerations

### Cryptographic Security

- **Elliptic Curve**: Curve25519 for key operations
- **Hash Functions**: SHA-3 for hashing operations
- **Commitments**: Pedersen commitments for amount hiding

### Network Security

- **Dandelion++**: Transaction propagation protocol
- **Tor Integration**: Built-in Tor support
- **I2P Support**: Optional I2P routing

### Implementation Security

- **Constant-Time Operations**: Prevent timing attacks
- **Memory Management**: Secure key storage
- **Side-Channel Resistance**: Protection against analysis

## Performance Impact

### Transaction Size

- **RingCT**: ~2KB average with ring size 11
- **Bulletproofs**: ~1KB range proof
- **Total**: ~3KB average transaction size

### Verification Time

- **Ring Signature**: ~100ms verification
- **Bulletproof**: ~50ms verification
- **Total**: ~150ms average verification time

### Storage Requirements

- **Blockchain Growth**: ~10GB per year at current rates
- **Memory Usage**: ~2GB dataset for mining
- **Wallet Storage**: ~100MB average wallet size

## Future Enhancements

### Research Areas

1. **Confidential Assets**: Colored coins on UTXO model
2. **Scriptless Scripts**: Advanced smart contract functionality
3. **Post-Quantum**: Quantum-resistant cryptography
4. **Light Clients**: Efficient mobile wallet protocols

### Planned Features

1. **Ring Size Increase**: Dynamic ring size based on network size
2. **Proof Aggregation**: Combine multiple Bulletproofs
3. **Multi-Signature**: Private multi-signature transactions
4. **Atomic Swaps**: Cross-chain private swaps

## Testing and Validation

### Unit Tests

Privacy features are tested in:

- [`src/tests/blockchain_test.cpp`](../src/tests/blockchain_test.cpp)

### Security Audits

Regular security audits are planned:

- **Code Review**: Internal and external code review
- **Penetration Testing**: Security testing by third parties
- **Formal Verification**: Mathematical proof of correctness

## Contributing

To contribute to privacy feature development:

1. Review the existing implementation
2. Follow the coding standards in [STYLE_GUIDE.md](STYLE_GUIDE.md)
3. Add tests for new functionality
4. Submit a pull request
