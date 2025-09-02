#include "consensus/randomx_v2.h"
#include "core/blockchain.h"
#include "privacy/bulletproofs.h"
#include "privacy/ringct.h"
#include "wallet/stealth_address.h"
#include <iostream>

int main() {
  std::cout << "DarkGhost [DG] Core Node" << std::endl;
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
