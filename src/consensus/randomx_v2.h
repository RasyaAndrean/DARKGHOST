#ifndef DARKGHOST_RANDOMX_V2_H
#define DARKGHOST_RANDOMX_V2_H

#include <cstdint>
#include <string>
#include <vector>

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

  // DarkGhost-specific methods
  void initializeScratchpad();
  void executeProgram();
  uint64_t getHashRateAdjustment();

private:
  uint32_t difficulty;
  uint64_t last_block_time;
  std::vector<uint8_t> scratchpad;

  // DarkGhost-specific parameters
  const uint32_t SCRATCHPAD_L3 = 2 * 1024 * 1024; // 2 MB (increased from 1 MB)
  const uint32_t SCRATCHPAD_L2 = 256 * 1024;      // 256 KB (same as original)
  const uint32_t SCRATCHPAD_L1 = 16 * 1024;       // 16 KB (same as original)
  const uint32_t DATASET_SIZE =
      256 * 1024 * 1024;                    // 256 MB (increased from 208 MB)
  const uint32_t PROGRAM_SIZE = 512;        // Increased from 256
  const uint32_t PROGRAM_ITERATIONS = 1024; // Increased from 512

  const uint32_t TARGET_BLOCK_TIME = 120;             // 2 minutes
  const uint32_t DIFFICULTY_ADJUSTMENT_INTERVAL = 10; // Adjust every 10 blocks
};

#endif // DARKGHOST_RANDOMX_V2_H
