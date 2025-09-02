# DarkGhost Style Guide

## Overview

This style guide establishes coding standards, documentation conventions, and design principles for the DarkGhost project. Consistent application of these guidelines ensures code quality, readability, and maintainability across the entire codebase.

## Code Style Guidelines

### General Principles

1. **Clarity over Brevity**: Write code that is easy to understand rather than clever
2. **Consistency**: Follow established patterns throughout the codebase
3. **Readability**: Prioritize code that is easy to read and maintain
4. **Performance**: Consider performance implications without sacrificing clarity
5. **Security**: Follow security best practices in all code

### C++ Coding Standards

#### Naming Conventions

##### Classes and Structs

```cpp
// Use PascalCase for class names
class BlockchainManager {
    // ...
};

struct TransactionData {
    // ...
};
```

##### Functions and Methods

```cpp
// Use camelCase for function names
void processTransaction();
bool validateBlock(const Block& block);
```

##### Variables

```cpp
// Use snake_case for variables
int transaction_count;
std::string wallet_address;
bool is_valid;
```

##### Constants

```cpp
// Use UPPER_SNAKE_CASE for constants
const int MAX_BLOCK_SIZE = 1024 * 1024;
const std::string GENESIS_BLOCK_HASH = "0000000000000000000000000000000000000000000000000000000000000000";
```

##### Private Members

```cpp
class Wallet {
private:
    std::string private_key_;  // Trailing underscore for private members
    std::string public_key_;
};
```

#### File Organization

##### Header Files (.h)

```cpp
#ifndef DARKGHOST_BLOCKCHAIN_H
#define DARKGHOST_BLOCKCHAIN_H

#include <vector>
#include <string>

// Class declarations
class Block;

class Blockchain {
public:
    Blockchain();
    ~Blockchain();

    bool addBlock(const Block& block);
    std::vector<Block> getChain() const;

private:
    std::vector<Block> chain_;
    uint64_t total_supply_;
};

#endif // DARKGHOST_BLOCKCHAIN_H
```

##### Implementation Files (.cpp)

```cpp
#include "blockchain.h"
#include <algorithm>
#include <iostream>

// Constructor implementations
Blockchain::Blockchain() : total_supply_(0) {
    // Initialize blockchain
}

// Destructor implementations
Blockchain::~Blockchain() {
    // Cleanup resources
}

// Method implementations
bool Blockchain::addBlock(const Block& block) {
    // Implementation details
    return true;
}

std::vector<Block> Blockchain::getChain() const {
    return chain_;
}
```

#### Formatting

##### Indentation

- Use 4 spaces for indentation
- No tabs
- Consistent indentation throughout file

##### Line Length

- Maximum 100 characters per line
- Break long lines at logical points

##### Braces

```cpp
// Opening brace on same line
if (condition) {
    // Code block
} else {
    // Else block
}

// Functions with opening brace on next line
void longFunctionName(
    int parameter1,
    int parameter2,
    int parameter3
) {
    // Function body
}
```

##### Spacing

```cpp
// Spaces around operators
int result = a + b * c;

// No spaces inside parentheses
if (condition) {
    // Code
}

// Spaces after commas
function_call(param1, param2, param3);
```

#### Comments and Documentation

##### File Headers

```cpp
/*
 * DarkGhost Blockchain Implementation
 *
 * This file implements the core blockchain functionality
 * including block validation, chain management, and consensus.
 *
 * Copyright (c) 2025 DarkGhost Network
 * Licensed under the GPL-3.0 License
 */
```

##### Function Documentation

```cpp
/**
 * Validates a block before adding it to the blockchain
 *
 * @param block The block to validate
 * @return true if block is valid, false otherwise
 *
 * This function checks the block's hash, timestamp, and
 * transactions before accepting it into the chain.
 */
bool validateBlock(const Block& block);
```

##### Inline Comments

```cpp
// Calculate the block hash using RandomX v2
std::string hash = calculateHash(block_data);

// Check if hash meets difficulty requirements
if (hash < target_difficulty) {
    // Accept block
}
```

### Error Handling

#### Exception Safety

```cpp
// Prefer RAII for resource management
class DatabaseConnection {
public:
    DatabaseConnection() {
        // Acquire resources
    }

    ~DatabaseConnection() {
        // Release resources automatically
    }
};
```

#### Error Codes vs Exceptions

```cpp
// Use exceptions for exceptional conditions
void criticalOperation() {
    if (!initialize()) {
        throw std::runtime_error("Failed to initialize critical component");
    }
}

// Use error codes for expected failure cases
enum class ValidationResult {
    VALID,
    INVALID_HASH,
    INVALID_TIMESTAMP,
    INVALID_TRANSACTIONS
};

ValidationResult validateBlock(const Block& block) {
    // Return appropriate validation result
    return ValidationResult::VALID;
}
```

### Memory Management

#### Smart Pointers

```cpp
// Use smart pointers for automatic memory management
#include <memory>

std::unique_ptr<Blockchain> chain = std::make_unique<Blockchain>();
std::shared_ptr<Wallet> wallet = std::make_shared<Wallet>();
```

#### Avoid Raw Pointers

```cpp
// Avoid raw pointers when possible
// Bad:
Block* block = new Block();
delete block;

// Good:
auto block = std::make_unique<Block>();
```

### Performance Considerations

#### Move Semantics

```cpp
// Use move semantics for large objects
std::vector<Transaction> processTransactions(std::vector<Transaction> txs) {
    // Process transactions
    return txs;  // Automatically moved
}

// Or explicitly move
std::vector<Transaction> result;
return std::move(result);
```

#### Const Correctness

```cpp
// Use const for functions that don't modify state
class Blockchain {
public:
    std::vector<Block> getChain() const;
    size_t getBlockCount() const;

private:
    std::vector<Block> chain_;
};
```

## Documentation Style

### Markdown Conventions

#### Headers

```markdown
# Main Title (H1)

## Section Title (H2)

### Subsection Title (H3)

#### Sub-subsection Title (H4)
```

#### Code Blocks

````markdown
```cpp
// C++ code example
int main() {
    return 0;
}
```

```bash
# Bash command example
./darkghostd --help
```
````

#### Lists

```markdown
1. First item
2. Second item
   - Sub-item
   - Another sub-item

- Unordered list item
- Another unordered item
```

#### Links

```markdown
[Project Documentation](https://docs.darkghost.network)
[GitHub Repository](https://github.com/darkghost-network/darkghost-core)
```

### API Documentation

#### Function Documentation

````markdown
## `validateBlock(block)`

Validates a block before adding it to the blockchain.

### Parameters

- `block` (Block): The block to validate

### Returns

- `bool`: true if block is valid, false otherwise

### Example

```cpp
Block new_block;
bool is_valid = validateBlock(new_block);
```
````

````

#### Class Documentation
```markdown
## Blockchain

Manages the DarkGhost blockchain including block validation,
chain maintenance, and consensus protocols.

### Constructor
```cpp
Blockchain()
````

### Methods

- `addBlock(block)`: Adds a validated block to the chain
- `getBlock(height)`: Retrieves a block by height
- `getChain()`: Returns the entire blockchain

```

## Git Commit Guidelines

### Commit Message Format
```

type(scope): brief description

Detailed explanation of changes if needed.
Multiple paragraphs are allowed.

Fixes #123
Refs #456

```

### Commit Types
- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: Code style changes (formatting, etc.)
- **refactor**: Code refactoring
- **perf**: Performance improvements
- **test**: Test additions or updates
- **chore**: Maintenance tasks

### Scope Examples
- **core**: Core blockchain functionality
- **consensus**: Consensus algorithm changes
- **privacy**: Privacy feature updates
- **wallet**: Wallet functionality
- **network**: Network layer changes
- **build**: Build system changes

### Example Commits
```

feat(consensus): implement RandomX v2 difficulty adjustment

Add dynamic difficulty adjustment algorithm that maintains
2-minute block target time. Includes unit tests and
performance benchmarks.

Refs #789

```

```

fix(wallet): resolve seed phrase import issue

Fix bug where 24-word seed phrases were not properly
validated during wallet restoration. Added additional
validation checks and updated error messages.

Fixes #1024

````

## Testing Standards

### Unit Test Structure
```cpp
#include <gtest/gtest.h>
#include "blockchain.h"

class BlockchainTest : public ::testing::Test {
protected:
    void SetUp() override {
        // Setup code
    }

    void TearDown() override {
        // Cleanup code
    }

    Blockchain chain;
};

TEST_F(BlockchainTest, AddValidBlock) {
    // Arrange
    Block valid_block;

    // Act
    bool result = chain.addBlock(valid_block);

    // Assert
    EXPECT_TRUE(result);
}

TEST_F(BlockchainTest, RejectInvalidBlock) {
    // Arrange
    Block invalid_block;

    // Act
    bool result = chain.addBlock(invalid_block);

    // Assert
    EXPECT_FALSE(result);
}
````

### Test Naming Convention

- Use descriptive test names
- Follow pattern: `TestedFunctionality_ExpectedBehavior`
- Example: `AddBlock_ValidBlock_ReturnsTrue`

### Test Coverage

- Aim for 80%+ code coverage
- Test both positive and negative cases
- Include edge case testing
- Regular coverage reporting

## Security Guidelines

### Input Validation

```cpp
// Always validate external inputs
bool validateAddress(const std::string& address) {
    if (address.empty()) {
        return false;
    }

    if (address.length() != 95) {
        return false;
    }

    // Additional validation...
    return true;
}
```

### Secure Coding Practices

- Avoid buffer overflows
- Validate all inputs
- Use secure random number generation
- Protect against injection attacks
- Follow principle of least privilege

### Cryptographic Standards

- Use well-established cryptographic libraries
- Keep cryptographic dependencies updated
- Follow industry best practices
- Regular security audits

## Performance Guidelines

### Algorithmic Efficiency

- Choose appropriate data structures
- Consider time and space complexity
- Profile performance regularly
- Optimize bottlenecks

### Resource Management

- Minimize memory allocations
- Use efficient I/O operations
- Cache frequently accessed data
- Release resources promptly

### Concurrency

- Use thread-safe data structures
- Minimize lock contention
- Consider lock-free alternatives
- Test for race conditions

## Review Process

### Code Review Checklist

#### General

- [ ] Code follows style guidelines
- [ ] Comments are clear and accurate
- [ ] No commented-out code
- [ ] Consistent naming conventions

#### Functionality

- [ ] Logic is correct
- [ ] Edge cases handled
- [ ] Error conditions considered
- [ ] Performance implications understood

#### Security

- [ ] Input validation present
- [ ] No buffer overflows
- [ ] Secure random generation used
- [ ] Cryptographic best practices followed

#### Testing

- [ ] Unit tests included
- [ ] Test coverage adequate
- [ ] Edge cases tested
- [ ] Integration tests updated

### Review Process

1. **Self-Review**: Author reviews own code before submission
2. **Peer Review**: At least one other developer reviews
3. **Automated Checks**: CI runs style and security checks
4. **Merge**: Code merged after approval

## Tools and Automation

### Linting

- Use clang-format for C++ code formatting
- Configure IDE to apply formatting automatically
- Run linter in CI pipeline

### Static Analysis

- Use static analysis tools regularly
- Address all high-priority warnings
- Integrate analysis into CI pipeline

### Continuous Integration

- Automated testing on all commits
- Style checking in CI
- Security scanning
- Performance benchmarking

## Versioning

### Semantic Versioning

DarkGhost follows Semantic Versioning (SemVer):

- **Major**: Breaking changes
- **Minor**: New features
- **Patch**: Bug fixes

### Release Branching

- `main`: Production-ready code
- `develop`: Development branch
- `feature/*`: Feature development branches
- `hotfix/*`: Emergency fixes
- `release/*`: Release preparation

## Conclusion

This style guide represents our commitment to maintaining high-quality, readable, and maintainable code. All contributors are expected to follow these guidelines to ensure consistency across the DarkGhost codebase.

Regular updates to this guide will be made as the project evolves and new best practices emerge. For questions or suggestions about these guidelines, please contact the maintainers through GitHub issues or our community channels.

Remember: Good code is not just about functionality—it's about creating a codebase that can be easily understood, maintained, and extended by current and future developers.
