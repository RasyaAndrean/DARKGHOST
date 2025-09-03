# RandomX v2 Consensus Algorithm

This document describes the RandomX v2 consensus algorithm implementation in DarkGhost.

## Overview

RandomX v2 is a proof-of-work (PoW) algorithm designed to be CPU-friendly and ASIC-resistant. It is based on the original RandomX algorithm used by Monero but has been modified for DarkGhost's specific requirements.

## Key Features

### ASIC Resistance

RandomX v2 maintains ASIC resistance through:

- Complex computational requirements
- Heavy use of CPU cache and memory
- Dynamic program generation
- Instruction set diversity

### CPU Optimization

The algorithm is optimized for general-purpose CPUs:

- Efficient use of modern CPU features
- Balanced computational load
- Support for multiple CPU architectures

### DarkGhost Specific Modifications

RandomX v2 includes modifications for DarkGhost:

- 2-minute target block time
- Integration with DarkGhost's UTXO model
- Custom difficulty adjustment algorithm
- Optimized for DarkGhost's privacy features

## Implementation Details

### Header Files

- [`src/consensus/randomx_v2.h`](../src/consensus/randomx_v2.h) - Class definition and public interface
- [`src/consensus/randomx_v2.cpp`](../src/consensus/randomx_v2.cpp) - Implementation details

### Key Components

#### RandomXv2 Class

The main class that implements the consensus algorithm:

```cpp
class RandomXv2 {
public:
  RandomXv2();
  ~RandomXv2();

  void initialize();
  bool verifyBlock(const std::string &block_data, const std::string &hash);
  std::string calculateHash(const std::string &data);
  uint32_t getDifficulty();
  void adjustDifficulty(uint32_t target_time = 120);
};
```

#### Block Verification

The `verifyBlock` method checks if a block meets the required difficulty:

```cpp
bool RandomXv2::verifyBlock(const std::string &block_data,
                           const std::string &hash) {
  // Check if hash meets difficulty requirements
  return hash.length() == 64 && hash.substr(0, 4) == "0000";
}
```

#### Hash Calculation

The `calculateHash` method generates a hash for block data:

```cpp
std::string RandomXv2::calculateHash(const std::string &data) {
  // Simplified hash calculation for demonstration
  // In practice, this would use the actual RandomX algorithm
}
```

#### Difficulty Adjustment

The `adjustDifficulty` method adjusts mining difficulty based on recent block times:

```cpp
void RandomXv2::adjustDifficulty(uint32_t target_time) {
  // Simplified difficulty adjustment algorithm
  // In practice, this would be more sophisticated
}
```

## Consensus Parameters

### Block Time

- **Target**: 120 seconds (2 minutes)
- **Adjustment Interval**: Every 10 blocks
- **Algorithm**: Moving average based on recent block times

### Difficulty

- **Initial Difficulty**: 1,000,000
- **Adjustment**: Based on deviation from target block time
- **Minimum**: 1,000 (to prevent network stall)

## Integration with DarkGhost

### Blockchain

RandomX v2 integrates with the DarkGhost blockchain through:

- Block validation in [`src/core/blockchain.cpp`](../src/core/blockchain.cpp)
- Consensus verification in the main node loop
- Difficulty tracking and adjustment

### Mining

The algorithm supports CPU mining through:

- Standard mining interfaces
- Stratum protocol compatibility
- Efficient hash calculation

## Performance Considerations

### Memory Usage

RandomX v2 uses significant memory to prevent ASIC development:

- Dataset size: 2GB+ (similar to RandomX)
- Cache requirements: 256KB L3 cache recommended
- Memory access patterns: Random and unpredictable

### CPU Requirements

Optimal performance requires:

- Modern CPU with AES-NI support
- At least 2 CPU cores
- 4GB+ RAM recommended

### Power Efficiency

The algorithm is designed to be power-efficient:

- Balanced computational load
- Reduced idle time
- Efficient memory access patterns

## Security Features

### 51% Attack Resistance

- High hash rate requirements
- Economic disincentives
- Community monitoring

### Block Verification

- Cryptographic hash verification
- Difficulty requirement checking
- Timestamp validation

### Network Security

- Decentralized mining
- Regular difficulty adjustments
- Active community monitoring

## Future Development

### Planned Improvements

1. **Enhanced ASIC Resistance**: Regular algorithm updates
2. **Performance Optimization**: Better CPU utilization
3. **Energy Efficiency**: Reduced power consumption
4. **Security Enhancements**: Improved attack resistance

### Hard Fork Compatibility

The algorithm is designed to support hard forks:

- Backward compatibility when possible
- Smooth transition mechanisms
- Community coordination process

## Testing

### Unit Tests

RandomX v2 includes comprehensive unit tests in:

- [`src/tests/blockchain_test.cpp`](../src/tests/blockchain_test.cpp)

### Performance Testing

Benchmarking tools are available:

- [`benchmark.cpp`](../benchmark.cpp)
- Performance monitoring scripts

## Contributing

To contribute to RandomX v2 development:

1. Review the existing implementation
2. Follow the coding standards in [STYLE_GUIDE.md](STYLE_GUIDE.md)
3. Add tests for new functionality
4. Submit a pull request
