cmake_minimum_required(VERSION 3.10)
project(DarkGhost)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Compiler flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -O2")

# Source files
set(SOURCES
    src/main.cpp
    src/core/blockchain.cpp
    src/consensus/randomx_v2.cpp
    src/privacy/ringct.cpp
    src/privacy/bulletproofs.cpp
    src/wallet/stealth_address.cpp
)

# Test files
set(TEST_SOURCES
    src/tests/blockchain_test.cpp
    src/core/blockchain.cpp
    src/consensus/randomx_v2.cpp
    src/privacy/ringct.cpp
    src/privacy/bulletproofs.cpp
    src/wallet/stealth_address.cpp
)

# Benchmark files
set(BENCHMARK_SOURCES
    benchmark.cpp
    src/core/blockchain.cpp
    src/consensus/randomx_v2.cpp
    src/privacy/ringct.cpp
    src/privacy/bulletproofs.cpp
    src/wallet/stealth_address.cpp
)

# Wallet files
set(WALLET_SOURCES
    src/wallet/cli_wallet.cpp
    src/wallet/stealth_address.cpp
    src/privacy/ringct.cpp
    src/privacy/bulletproofs.cpp
)

# Create main executable
add_executable(darkghostd ${SOURCES})

# Create test executable
add_executable(darkghost_test ${TEST_SOURCES})

# Create wallet executable
add_executable(darkghost_wallet ${WALLET_SOURCES})

# Create benchmark executable
add_executable(darkghost_benchmark ${BENCHMARK_SOURCES})

# Include directories
target_include_directories(darkghostd PRIVATE src)
target_include_directories(darkghost_test PRIVATE src)
target_include_directories(darkghost_wallet PRIVATE src)

# Install targets
install(TARGETS darkghostd darkghost_test darkghost_wallet
    RUNTIME DESTINATION bin
)
