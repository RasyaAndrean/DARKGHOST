#include "consensus/randomx_v2.h"
#include "core/blockchain.h"
#include "core/genesis.h"
#include "privacy/bulletproofs.h"
#include "privacy/ringct.h"
#include "wallet/stealth_address.h"
#include <iostream>
#include <string>

// Global flag for network mode
bool is_testnet = false;

int main(int argc, char *argv[]) {
  // Parse command line arguments
  for (int i = 1; i < argc; i++) {
    std::string arg = argv[i];
    if (arg == "--testnet") {
      is_testnet = true;
    }
  }

  if (is_testnet) {
    std::cout << "DarkGhost [DG] Testnet Node" << std::endl;
  } else {
    std::cout << "DarkGhost [DG] Core Node" << std::endl;
  }
  std::cout << "Hybrid of Bitcoin UTXO and Monero Privacy" << std::endl;

  // Initialize blockchain with UTXO model
  Blockchain chain;

  // Initialize RandomX v2 consensus
  RandomXv2 consensus;

  // Initialize privacy components
  RingCT ringct;
  Bulletproofs bulletproofs;
  StealthAddress stealth;

  // Start node operations
  chain.initialize();

  return 0;
}
