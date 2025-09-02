#ifndef DARKGHOST_H
#define DARKGHOST_H

// DarkGhost Core Components Header
// Include this single header to access all DarkGhost functionality

// Core components
#include "core/blockchain.h"

// Consensus algorithms
#include "consensus/randomx_v2.h"

// Privacy features
#include "privacy/bulletproofs.h"
#include "privacy/ringct.h"

// Wallet functionality
#include "wallet/stealth_address.h"

// Constants
#define DARKGHOST_VERSION "1.0.0"
#define DARKGHOST_MAX_SUPPLY                                                   \
  10000000000000000ULL           // 100 million DG in atomic units
#define DARKGHOST_BLOCK_TIME 120 // 2 minutes in seconds
#define DARKGHOST_HALVING_INTERVAL                                             \
  1051200                      // Every 4 years (262800 blocks per year * 4)
#define DARKGHOST_RING_SIZE 11 // 10 decoys + 1 real output

#endif // DARKGHOST_H
