#ifndef DARKGHOST_H
#define DARKGHOST_H

// DarkGhost Core Components Header
// Include this single header to access all DarkGhost functionality

// Core components
#include "core/blockchain.h"
#include "core/genesis.h"

// Consensus algorithms
#include "consensus/randomx_v2.h"

// Privacy features
#include "privacy/bulletproofs.h"
#include "privacy/ringct.h"

// Wallet functionality
#include "wallet/stealth_address.h"

// Constants
#define DARKGHOST_VERSION "0.1.0-alpha"
#define DARKGHOST_MAX_SUPPLY Genesis::MAX_SUPPLY
#define DARKGHOST_BLOCK_TIME Genesis::BLOCK_TIME
#define DARKGHOST_HALVING_INTERVAL Genesis::HALVING_INTERVAL
#define DARKGHOST_RING_SIZE Genesis::DEFAULT_RING_SIZE

#endif // DARKGHOST_H
