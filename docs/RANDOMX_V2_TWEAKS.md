# DarkGhost RandomX v2 Tweaks

This document describes the specific tweaks made to the RandomX v2 algorithm for DarkGhost to enhance ASIC resistance and improve performance.

## Overview

DarkGhost implements a customized version of RandomX v2 with specific tweaks designed to:

1. Enhance ASIC resistance
2. Optimize for DarkGhost's 2-minute block time
3. Improve performance on consumer hardware
4. Maintain compatibility with the broader RandomX ecosystem

## Key Tweaks

### 1. Scratchpad Size Modification

The scratchpad size has been adjusted to better suit DarkGhost's requirements:

```cpp
// In randomx_v2.h
static const uint32_t SCRATCHPAD_L3 = 2 * 1024 * 1024; // 2 MB (increased from 1 MB)
static const uint32_t SCRATCHPAD_L2 = 256 * 1024;      // 256 KB (same as original)
static const uint32_t SCRATCHPAD_L1 = 16 * 1024;       // 16 KB (same as original)
```

### 2. Dataset Size Adjustment

The dataset size has been modified to improve ASIC resistance:

```cpp
// In randomx_v2.h
static const uint32_t DATASET_SIZE = 256 * 1024 * 1024; // 256 MB (increased from 208 MB)
```

### 3. Program Size Modification

The program size has been adjusted to increase complexity:

```cpp
// In randomx_v2.h
static const uint32_t PROGRAM_SIZE = 512; // Increased from 256
static const uint32_t PROGRAM_ITERATIONS = 1024; // Increased from 512
```

### 4. Instruction Set Modifications

Several modifications to the instruction set have been made:

1. **Increased Floating-Point Operations**: More floating-point instructions to utilize AVX units
2. **Memory Jump Instructions**: Added new memory jump instructions to increase memory dependency
3. **Conditional Execution**: Enhanced conditional execution paths to increase branch prediction complexity

### 5. Cache Access Patterns

Modified cache access patterns to increase memory bandwidth requirements:

```cpp
// In randomx_v2.cpp
void RandomXv2::initializeCache() {
    // Increased cache access complexity
    for (int i = 0; i < CACHE_ACCESSES; i++) {
        // More complex access patterns
        cacheReads[i] = (i * 17 + 23) % CACHE_SIZE;
        cacheWrites[i] = (i * 19 + 31) % CACHE_SIZE;
    }
}
```

## Implementation Details

### Header File Changes

The RandomX v2 header file has been updated with new constants:

```cpp
// randomx_v2.h
class RandomXv2 {
public:
    // ... existing methods ...

    // New methods for DarkGhost-specific features
    void initializeScratchpad();
    void executeProgram();
    uint64_t getHashRateAdjustment();

private:
    // ... existing members ...

    // New members for DarkGhost-specific features
    uint32_t scratchpad_l3;
    uint32_t dataset_size;
    uint32_t program_size;
    uint32_t program_iterations;
};
```

### Implementation Changes

The implementation has been enhanced with DarkGhost-specific optimizations:

```cpp
// randomx_v2.cpp
void RandomXv2::initializeScratchpad() {
    // Initialize larger scratchpad for increased memory requirements
    scratchpad.resize(scratchpad_l3);

    // Fill scratchpad with pseudo-random data
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<uint64_t> dis;

    for (size_t i = 0; i < scratchpad.size(); i += sizeof(uint64_t)) {
        *reinterpret_cast<uint64_t*>(&scratchpad[i]) = dis(gen);
    }
}

void RandomXv2::executeProgram() {
    // Execute larger program with more iterations
    for (uint32_t i = 0; i < program_iterations; i++) {
        // Execute program instructions
        // ... implementation details ...
    }
}
```

## Performance Considerations

### CPU Utilization

The tweaks are designed to:

- Utilize more CPU cores effectively
- Increase memory bandwidth usage
- Enhance floating-point unit utilization
- Improve cache efficiency

### Power Efficiency

The algorithm maintains good power efficiency by:

- Balancing computational load
- Reducing idle time
- Optimizing memory access patterns

## ASIC Resistance Features

### Memory Hardness

The increased scratchpad and dataset sizes make:

- ASIC development more expensive
- Memory bandwidth a limiting factor
- Large die area requirements

### Computational Complexity

The enhanced instruction set and program size:

- Increase circuit complexity
- Require more transistors
- Make optimization more difficult

### Dynamic Features

The algorithm includes dynamic features that:

- Change over time
- Require firmware updates
- Adapt to new ASIC techniques

## Testing and Validation

### Unit Tests

Comprehensive unit tests have been added:

- Scratchpad initialization tests
- Program execution tests
- Hash calculation validation
- Performance benchmarking

### Integration Tests

Integration tests verify:

- Block validation
- Difficulty adjustment
- Network consensus
- Compatibility with existing nodes

## Security Considerations

### Cryptographic Security

The tweaks maintain cryptographic security by:

- Using well-established primitives
- Following cryptographic best practices
- Undergoing security reviews
- Maintaining entropy levels

### Network Security

Network security is enhanced through:

- Consistent difficulty adjustment
- Block validation improvements
- Resistance to 51% attacks
- Protection against selfish mining

## Future Development

### Planned Enhancements

Future enhancements may include:

- Post-quantum resistance features
- Additional ASIC resistance techniques
- Performance optimizations
- Hardware-specific optimizations

### Research Areas

Active research areas:

- Zero-knowledge proofs integration
- Advanced memory-hard functions
- Quantum-resistant cryptography
- Hardware acceleration

## References

- [RandomX GitHub Repository](https://github.com/tevador/RandomX)
- [DarkGhost Technical Documentation](ARCHITECTURE.md)
- [Consensus Algorithm Implementation](../src/consensus/randomx_v2.h)
- [Consensus Algorithm Implementation](../src/consensus/randomx_v2.cpp)

## Version History

| Version | Date       | Description                         |
| ------- | ---------- | ----------------------------------- |
| 1.0.0   | 2025-09-03 | Initial DarkGhost RandomX v2 tweaks |
| 1.1.0   | TBD        | Performance optimizations           |
| 1.2.0   | TBD        | Additional ASIC resistance features |

## Contact

For questions about RandomX v2 tweaks, contact:

**Rasya Andrean**
Email: rasyaandrean@outlook.co.id

---
