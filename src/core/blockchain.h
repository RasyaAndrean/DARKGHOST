#ifndef DARKGHOST_BLOCKCHAIN_H
#define DARKGHOST_BLOCKCHAIN_H

#include "genesis.h"
#include <cstdint>
#include <vector>

// UTXO structure
struct UTXO {
  std::string tx_hash;
  uint32_t index;
  uint64_t amount;
  std::string pubkey;
};

// Block structure
struct Block {
  uint32_t height;
  std::string prev_hash;
  std::string merkle_root;
  uint64_t timestamp;
  uint32_t nonce;
  std::vector<std::string> transactions;
  uint64_t reward;
};

class Blockchain {
public:
  Blockchain();
  ~Blockchain();

  void initialize();
  bool addBlock(const Block &block);
  std::vector<UTXO> getUTXOs(const std::string &address);
  uint64_t getCurrentSupply();

private:
  std::vector<Block> chain;
  std::vector<UTXO> utxo_set;
  uint64_t total_supply;
  const uint64_t MAX_SUPPLY = Genesis::MAX_SUPPLY;
};

#endif // DARKGHOST_BLOCKCHAIN_H
