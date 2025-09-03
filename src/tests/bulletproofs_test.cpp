#include "../privacy/bulletproofs.h"
#include <cassert>
#include <iostream>

int main() {
  std::cout << "Running Bulletproofs tests..." << std::endl;

  // Test 1: Initialization
  Bulletproofs bp;
  bp.initialize();
  std::cout << "✅ Test 1: Initialization passed" << std::endl;

  // Test 2: Generate proof
  std::string proof = bp.generateProof(1000, 0, 1000000);
  assert(!proof.empty());
  std::cout << "✅ Test 2: Proof generation passed" << std::endl;

  // Test 3: Verify proof
  bool verified = bp.verifyProof(proof, 0, 1000000);
  assert(verified);
  std::cout << "✅ Test 3: Proof verification passed" << std::endl;

  // Test 4: Invalid proof verification
  bool invalid_verified = bp.verifyProof("invalid_proof", 0, 1000000);
  assert(!invalid_verified);
  std::cout << "✅ Test 4: Invalid proof detection passed" << std::endl;

  // Test 5: Aggregate proofs
  std::vector<std::string> proofs = {proof, proof, proof};
  std::string aggregated = bp.aggregateProofs(proofs);
  assert(!aggregated.empty());
  std::cout << "✅ Test 5: Proof aggregation passed" << std::endl;

  // Test 6: Edge case - empty aggregation
  std::vector<std::string> empty_proofs;
  std::string empty_aggregated = bp.aggregateProofs(empty_proofs);
  assert(empty_aggregated.empty());
  std::cout << "✅ Test 6: Empty aggregation passed" << std::endl;

  // Test 7: Out of range value
  std::string out_of_range_proof = bp.generateProof(2000000, 0, 1000000);
  assert(out_of_range_proof.empty());
  std::cout << "✅ Test 7: Out of range detection passed" << std::endl;

  std::cout << "\n🎉 All Bulletproofs tests passed!" << std::endl;
  return 0;
}
