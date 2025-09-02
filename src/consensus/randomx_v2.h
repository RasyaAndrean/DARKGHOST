#ifndef DARKGHOST_RANDOMX_V2_H
#define DARKGHOST_RANDOMX_V2_H

#include <cstdint>
#include <string>

// RandomX v2 - CPU-friendly, ASIC-resistant mining algorithm
class RandomXv2 {
public:
  RandomXv2();
  ~RandomXv2();

  void initialize();
  bool verifyBlock(const std::string &block_data, const std::string &hash);
  std::string calculateHash(const std::string &data);
  uint32_t getDifficulty();
  void adjustDifficulty(uint32_t target_time = 120); // 2 minutes in seconds

private:
  uint32_t difficulty;
  uint64_t last_block_time;
  const uint32_t TARGET_BLOCK_TIME = 120;             // 2 minutes
  const uint32_t DIFFICULTY_ADJUSTMENT_INTERVAL = 10; // Adjust every 10 blocks
};

#endif // DARKGHOST_RANDOMX_V2_H
