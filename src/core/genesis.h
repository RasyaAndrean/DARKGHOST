#ifndef DARKGHOST_GENESIS_H
#define DARKGHOST_GENESIS_H

#include <cstdint>
#include <string>

// Genesis Block Parameters for DarkGhost
namespace Genesis {
// Network identifier
const std::string NETWORK_ID = "DarkGhost Mainnet";

// Magic bytes for network identification
const uint32_t MAINNET_MAGIC_BYTES = 0x44474d4e; // "DG" in hex
const uint32_t TESTNET_MAGIC_BYTES = 0x4447544e; // "DGTN" in hex
const uint32_t DEVNET_MAGIC_BYTES = 0x4447444e;  // "DGDN" in hex

// Genesis block parameters
const std::string GENESIS_BLOCK_HASH =
    "0000000000000000000000000000000000000000000000000000000000000000";
const uint64_t GENESIS_TIMESTAMP = 1756742400; // September 1, 2025
const uint32_t GENESIS_NONCE = 123456;

// Consensus parameters
const uint32_t BLOCK_TIME = 120;                  // 2 minutes in seconds
const uint64_t INITIAL_BLOCK_REWARD = 5000000000; // 50 DG in atomic units
const uint64_t MAX_SUPPLY = 10000000000000000; // 100 million DG in atomic units

// Emission parameters
const uint32_t HALVING_INTERVAL =
    1051200;                      // Every 4 years (262800 blocks per year * 4)
const bool TAIL_EMISSION = false; // No tail emission - fixed supply

// Privacy parameters
const uint32_t DEFAULT_RING_SIZE = 11; // 10 decoys + 1 real
const uint32_t MIN_RING_SIZE = 5;
const uint32_t MAX_RING_SIZE = 32;

// Network parameters
const uint32_t DIFFICULTY_TARGET = 120; // 2 minutes
const uint32_t DIFFICULTY_WINDOW = 720; // 24 hours worth of blocks
const uint32_t DIFFICULTY_LAG = 15;     // Ignore 15 most recent blocks
const uint32_t DIFFICULTY_CUT = 60;     // Ignore 60 extreme values

// Transaction parameters
const uint64_t MIN_FEE = 10000;   // 0.0001 DG in atomic units
const uint64_t FEE_PER_BYTE = 10; // Fee per byte of transaction data
const uint64_t FEE_QUANTIZATION_MASK = 10000; // Round fees to nearest 0.0001 DG

// Block parameters
const uint64_t MAX_BLOCK_SIZE_INITIAL = 20000;    // Initial max block size
const uint64_t MAX_BLOCK_SIZE_GROWTH_RATE = 1024; // Growth rate per year
const uint32_t BLOCK_SIZE_MEDIAN_WINDOW = 100;    // Median calculation window

// P2P network parameters
const uint16_t P2P_DEFAULT_PORT = 18080;
const uint16_t RPC_DEFAULT_PORT = 18081;
const uint16_t ZMQ_RPC_DEFAULT_PORT = 18082;

// Checkpoint for security
const uint64_t CHECKPOINT_HEIGHT = 0;
const std::string CHECKPOINT_HASH =
    "0000000000000000000000000000000000000000000000000000000000000000";
} // namespace Genesis

#endif // DARKGHOST_GENESIS_H
