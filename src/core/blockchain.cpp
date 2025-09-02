#include "blockchain.h"
#include <algorithm>
#include <iostream>

Blockchain::Blockchain() : total_supply(0) {
  // Constructor
}

Blockchain::~Blockchain() {
  // Destructor
}

void Blockchain::initialize() {
  std::cout << "Initializing DarkGhost Blockchain with UTXO model..."
            << std::endl;
  std::cout << "Fixed supply: 100 million DG" << std::endl;
  std::cout << "Block time: 2 minutes" << std::endl;

  // Create genesis block
  Block genesis;
  genesis.height = 0;
  genesis.prev_hash =
      "0000000000000000000000000000000000000000000000000000000000000000";
  genesis.merkle_root =
      "0000000000000000000000000000000000000000000000000000000000000000";
  genesis.timestamp = 1756742400; // September 1, 2025
  genesis.nonce = 123456;
  genesis.reward = 5000000000; // 50 DG in atomic units

  chain.push_back(genesis);
  total_supply += genesis.reward;

  std::cout << "Genesis block created with reward: " << genesis.reward
            << " atomic units" << std::endl;
}

bool Blockchain::addBlock(const Block &block) {
  // Verify block before adding
  if (block.height != chain.size()) {
    return false;
  }

  if (block.prev_hash != chain.back().merkle_root) {
    return false;
  }

  // Add block to chain
  chain.push_back(block);
  total_supply += block.reward;

  // Apply halving every 4 years (assuming 262800 blocks per year)
  uint32_t blocks_per_halving = 262800 * 4; // 4 years
  uint32_t halvings = block.height / blocks_per_halving;

  std::cout << "Block " << block.height << " added to chain" << std::endl;
  std::cout << "Current supply: " << total_supply << " atomic units"
            << std::endl;
  std::cout << "Halvings occurred: " << halvings << std::endl;

  return true;
}

std::vector<UTXO> Blockchain::getUTXOs(const std::string &address) {
  std::vector<UTXO> result;

  // Filter UTXOs for specific address
  for (const auto &utxo : utxo_set) {
    if (utxo.pubkey == address) {
      result.push_back(utxo);
    }
  }

  return result;
}

uint64_t Blockchain::getCurrentSupply() { return total_supply; }
