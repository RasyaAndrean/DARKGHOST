# DarkGhost Testing Framework

This document describes the testing framework for DarkGhost, including unit tests, integration tests, and performance benchmarks.

## Overview

DarkGhost includes a comprehensive testing framework to ensure code quality, security, and performance. The framework consists of:

- **Unit Tests**: Component-level testing
- **Integration Tests**: System-level testing
- **Performance Benchmarks**: Performance measurement and optimization
- **Security Tests**: Security-focused testing

## Unit Tests

### Test Structure

Unit tests are located in the [`src/tests/`](../src/tests/) directory:

- [`src/tests/blockchain_test.cpp`](../src/tests/blockchain_test.cpp) - Core component tests

### Running Unit Tests

```bash
# Build the test executable
mkdir build && cd build
cmake ..
make darkghost_test

# Run the tests
./darkghost_test
```

Or on Windows:

```cmd
scripts\build.bat
build\darkghost_test.exe
```

### Test Components

The unit test suite validates:

1. **Blockchain**: Block creation, UTXO management, supply tracking
2. **Consensus**: RandomX v2 hash calculation, block verification
3. **Privacy**: RingCT transaction creation, Bulletproofs generation
4. **Wallet**: Stealth address generation, key management

### Example Test

```cpp
// Test Blockchain
Blockchain chain;
chain.initialize();

// Test supply
std::cout << "Current supply: " << chain.getCurrentSupply() << " atomic units"
          << std::endl;

// Verify the supply is correct
assert(chain.getCurrentSupply() == 5000000000); // 50 DG initial reward
```

## Integration Tests

### Test Network

DarkGhost supports integration testing through:

- **Devnet**: Local development network
- **Testnet**: Public test network
- **Regtest**: Regression testing mode

### Test Scenarios

Integration tests cover:

1. **Node Communication**: P2P network functionality
2. **Transaction Processing**: End-to-end transaction flow
3. **Block Synchronization**: Blockchain synchronization
4. **Wallet Operations**: Wallet creation, transaction sending/receiving

### Running Integration Tests

```bash
# Start a local devnet
./darkghostd --devnet

# Run integration tests
./integration_test
```

## Performance Benchmarks

### Benchmark Suite

Performance benchmarks are implemented in:

- [`benchmark.cpp`](../benchmark.cpp) - Main benchmark suite

### Running Benchmarks

```bash
# Build the benchmark executable
mkdir build && cd build
cmake ..
make darkghost_benchmark

# Run the benchmarks
./darkghost_benchmark
```

Or on Windows:

```cmd
scripts\build.bat
build\darkghost_benchmark.exe
```

### Benchmark Categories

1. **Hash Calculation**: RandomX v2 performance
2. **Transaction Creation**: RingCT transaction generation
3. **Signature Verification**: Ring signature verification
4. **Proof Generation**: Bulletproofs generation
5. **Blockchain Operations**: Block processing speed

### Example Benchmark

```cpp
// Benchmark RandomX v2 hash calculation
auto start = std::chrono::high_resolution_clock::now();
for (int i = 0; i < 1000; i++) {
    std::string hash = consensus.calculateHash("test_data_" + std::to_string(i));
}
auto end = std::chrono::high_resolution_clock::now();
auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
std::cout << "Hash calculation: " << duration.count() << " microseconds" << std::endl;
```

## Security Testing

### Code Review

Security testing includes:

1. **Static Analysis**: Automated code analysis
2. **Manual Review**: Expert code review
3. **Penetration Testing**: Security penetration testing
4. **Fuzz Testing**: Input fuzzing for vulnerability detection

### Security Tools

Recommended security tools:

- **Cppcheck**: Static analysis for C++
- **Valgrind**: Memory error detection
- **AddressSanitizer**: Memory error detection
- **Clang Static Analyzer**: Static code analysis

### Running Security Tests

```bash
# Static analysis with Cppcheck
cppcheck --enable=all src/

# Memory checking with Valgrind
valgrind --leak-check=full ./darkghost_test
```

## Continuous Integration

### GitHub Actions

Tests are automatically run through GitHub Actions:

- **Build Matrix**: Ubuntu, macOS, and Windows
- **Test Execution**: Unit tests on all platforms
- **Performance Monitoring**: Benchmark tracking

### Test Coverage

Current test coverage:

- **Core Components**: 85%
- **Consensus Algorithm**: 90%
- **Privacy Features**: 80%
- **Wallet Functionality**: 75%

### Quality Gates

Quality gates for merging:

- **All Tests Pass**: 100% test success rate
- **Code Coverage**: Minimum 80% coverage
- **Security Scan**: No critical vulnerabilities
- **Performance**: No significant performance regressions

## Test Data Management

### Test Fixtures

Test fixtures are used for:

- **Blockchain State**: Predefined blockchain states
- **Transaction Data**: Sample transactions
- **Key Pairs**: Test key pairs
- **Network Scenarios**: Network condition simulations

### Data Generation

Test data is generated using:

- **Deterministic Algorithms**: Repeatable test data
- **Random Seeding**: Controlled randomness
- **Real-world Samples**: Actual transaction data (anonymized)

## Debugging and Troubleshooting

### Debug Builds

Debug builds include:

- **Symbols**: Debug symbols for debugging
- **Assertions**: Runtime assertions for error detection
- **Logging**: Detailed logging for troubleshooting

### Building Debug Version

```bash
# Debug build with symbols
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
```

### Debugging Tools

Recommended debugging tools:

- **GDB**: GNU Debugger for Linux/macOS
- **LLDB**: LLVM Debugger for macOS
- **Visual Studio Debugger**: For Windows
- **Valgrind**: Memory debugging

## Contributing to Tests

### Adding New Tests

To add new tests:

1. **Identify Test Area**: Determine which component needs testing
2. **Create Test File**: Add test file in [`src/tests/`](../src/tests/)
3. **Implement Tests**: Write comprehensive test cases
4. **Update CMakeLists**: Add new test files to build configuration
5. **Run Tests**: Verify all tests pass

### Test Guidelines

Follow these guidelines when writing tests:

1. **Isolation**: Tests should be independent
2. **Repeatability**: Tests should produce consistent results
3. **Coverage**: Tests should cover edge cases
4. **Documentation**: Tests should be well-documented
5. **Performance**: Tests should run efficiently

### Example Test Addition

```cpp
// Add to src/tests/blockchain_test.cpp
void testUTXOSelection() {
    Blockchain chain;
    chain.initialize();

    // Add test UTXOs
    // ...

    // Test UTXO selection logic
    // ...

    // Verify results
    assert(selected_utxos.size() > 0);
}
```

## Future Improvements

### Test Framework Enhancements

Planned improvements:

1. **Mock Objects**: Better isolation for unit tests
2. **Property Testing**: Automated test case generation
3. **Parallel Testing**: Concurrent test execution
4. **Test Reporting**: Detailed test reports

### Coverage Improvements

Planned coverage improvements:

1. **100% Core Coverage**: Complete core component testing
2. **Privacy Testing**: Enhanced privacy feature testing
3. **Network Testing**: Comprehensive network scenario testing
4. **Edge Case Testing**: Better edge case coverage

### Performance Monitoring

Planned performance monitoring:

1. **Continuous Benchmarking**: Automated performance tracking
2. **Regression Detection**: Automatic performance regression detection
3. **Resource Monitoring**: Memory and CPU usage tracking
4. **Scalability Testing**: Large-scale performance testing

## Resources

### Documentation

- [Unit Testing Guidelines](STYLE_GUIDE.md)
- [Performance Optimization](PERFORMANCE.md)
- [Security Best Practices](SECURITY.md)

### Tools

- [CMake Build System](https://cmake.org/)
- [Google Test Framework](https://github.com/google/googletest)
- [Cppcheck Static Analysis](http://cppcheck.sourceforge.net/)
- [Valgrind Memory Debugger](https://valgrind.org/)
