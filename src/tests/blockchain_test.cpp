#include "../consensus/randomx_v2.h"
#include "../core/blockchain.h"
#include "../privacy/bulletproofs.h"
#include "../privacy/ringct.h"
#include "../wallet/stealth_address.h"
#include <iostream>

int main() {
  std::cout << "DarkGhost Core Components Test" << std::endl;
  std::cout << "==============================" << std::endl;

  // Test Blockchain
  std::cout << "\n1. Testing Blockchain..." << std::endl;
  Blockchain chain;
  chain.initialize();

  // Test supply
  std::cout << "Current supply: " << chain.getCurrentSupply() << " atomic units"
            << std::endl;

  // Test Consensus
  std::cout << "\n2. Testing RandomX v2..." << std::endl;
  RandomXv2 consensus;
  consensus.initialize();

  std::string test_data = "test_block_data";
  std::string hash = consensus.calculateHash(test_data);
  std::cout << "Generated hash: " << hash << std::endl;
  std::cout << "Hash verification: "
            << (consensus.verifyBlock(test_data, hash) ? "PASS" : "FAIL")
            << std::endl;

  // Test Privacy
  std::cout << "\n3. Testing RingCT..." << std::endl;
  RingCT ringct;
  ringct.initialize();

  std::vector<std::string> real_outputs = {"real1", "real2"};
  std::vector<std::vector<std::string>> decoy_sets = {
      {"decoy1", "decoy2", "decoy3", "decoy4", "decoy5", "decoy6", "decoy7",
       "decoy8", "decoy9", "decoy10"},
      {"decoy11", "decoy12", "decoy13", "decoy14", "decoy15", "decoy16",
       "decoy17", "decoy18", "decoy19", "decoy20"}};

  bool tx_created = ringct.createTransaction(real_outputs, decoy_sets,
                                             100000000, "recipient_address");
  std::cout << "Transaction creation: " << (tx_created ? "PASS" : "FAIL")
            << std::endl;

  // Test Bulletproofs
  std::cout << "\n4. Testing Bulletproofs..." << std::endl;
  Bulletproofs bulletproofs;
  bulletproofs.initialize();

  std::string proof = bulletproofs.generateProof(100000000, 0, 1000000000);
  std::cout << "Bulletproof generated: "
            << (proof.length() > 0 ? "PASS" : "FAIL") << std::endl;

  bool proof_valid = bulletproofs.verifyProof(proof, 0, 1000000000);
  std::cout << "Bulletproof verification: " << (proof_valid ? "PASS" : "FAIL")
            << std::endl;

  // Test Wallet
  std::cout << "\n5. Testing Stealth Address..." << std::endl;
  StealthAddress stealth;
  stealth.initialize();

  auto keys = stealth.generateKeyPair();
  std::cout << "Private key generated: "
            << (keys.first.length() > 0 ? "PASS" : "FAIL") << std::endl;
  std::cout << "Public key generated: "
            << (keys.second.length() > 0 ? "PASS" : "FAIL") << std::endl;

  std::string stealth_addr = stealth.generateAddress(keys.second);
  std::cout << "Stealth address generated: "
            << (stealth_addr.length() > 0 ? "PASS" : "FAIL") << std::endl;

  std::cout << "\nAll tests completed!" << std::endl;

  return 0;
}
