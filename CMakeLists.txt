cmake_minimum_required(VERSION 3.10)
project(DarkGhost)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Compiler flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")

# Source files
set(SOURCES
    src/main.cpp
    src/core/blockchain.cpp
    src/consensus/randomx_v2.cpp
    src/privacy/ringct.cpp
    src/privacy/bulletproofs.cpp
    src/wallet/stealth_address.cpp
)

# Header files directory
include_directories(src)

# Main executable
add_executable(darkghostd ${SOURCES})

# CLI Wallet
add_executable(darkghost_wallet
    src/wallet/cli_wallet.cpp
    src/privacy/ringct.cpp
    src/privacy/bulletproofs.cpp
    src/wallet/stealth_address.cpp
)

# Blockchain tests
add_executable(blockchain_test
    src/tests/blockchain_test.cpp
    src/core/blockchain.cpp
)

# Bulletproofs tests
add_executable(bulletproofs_test
    src/tests/bulletproofs_test.cpp
    src/privacy/bulletproofs.cpp
)

# Link libraries (if any)
# target_link_libraries(darkghostd ${LIBRARIES})
