#ifndef DARKGHOST_BULLETPROOFS_H
#define DARKGHOST_BULLETPROOFS_H

#include <cstdint>
#include <string>
#include <vector>

// Bulletproofs implementation for range proofs
class Bulletproofs {
public:
  Bulletproofs();
  ~Bulletproofs();

  void initialize();

  // Generate a bulletproof for a range
  std::string generateProof(uint64_t value, uint64_t min_value,
                            uint64_t max_value);

  // Verify a bulletproof
  bool verifyProof(const std::string &proof, uint64_t min_value,
                   uint64_t max_value);

  // Aggregate multiple bulletproofs
  std::string aggregateProofs(const std::vector<std::string> &proofs);

private:
  bool is_initialized;
};

#endif // DARKGHOST_BULLETPROOFS_H
