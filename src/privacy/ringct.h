#ifndef DARKGHOST_RINGCT_H
#define DARKGHOST_RINGCT_H

#include <cstdint>
#include <string>
#include <vector>

// Ring Confidential Transaction component
class RingCT {
public:
  RingCT();
  ~RingCT();

  void initialize();

  // Create a RingCT transaction with decoy outputs
  bool
  createTransaction(const std::vector<std::string> &real_outputs,
                    const std::vector<std::vector<std::string>> &decoy_sets,
                    uint64_t amount, const std::string &recipient);

  // Verify a RingCT transaction
  bool verifyTransaction(const std::string &tx_data);

  // Get ring size (number of decoys + 1 real output)
  uint32_t getRingSize();

private:
  uint32_t ring_size;
  const uint32_t DEFAULT_RING_SIZE = 11; // 10 decoys + 1 real
};

#endif // DARKGHOST_RINGCT_H
