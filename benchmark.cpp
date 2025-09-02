#include "src/consensus/randomx_v2.h"
#include "src/core/blockchain.h"
#include "src/privacy/bulletproofs.h"
#include "src/privacy/ringct.h"
#include <chrono>
#include <iostream>
#include <vector>

class DarkGhostBenchmark {
public:
  DarkGhostBenchmark() {}
  ~DarkGhostBenchmark() {}

  void runAllBenchmarks() {
    std::cout << "DarkGhost Performance Benchmarks" << std::endl;
    std::cout << "================================" << std::endl;

    benchmarkBlockchain();
    benchmarkConsensus();
    benchmarkPrivacy();
    benchmarkTransactions();

    std::cout << "\nBenchmark completed!" << std::endl;
  }

private:
  void benchmarkBlockchain() {
    std::cout << "\n1. Blockchain Performance Test" << std::endl;

    Blockchain chain;
    auto start = std::chrono::high_resolution_clock::now();

    // Initialize blockchain
    chain.initialize();

    // Add multiple blocks
    for (int i = 0; i < 100; i++) {
      Block block;
      block.height = i + 1;
      block.prev_hash = "previous_hash";
      block.merkle_root = "merkle_root";
      block.timestamp = 1756742400 + i * 120; // 2-minute intervals
      block.nonce = i * 12345;
      block.reward = 5000000000; // 50 DG

      chain.addBlock(block);
    }

    auto end = std::chrono::high_resolution_clock::now();
    auto duration =
        std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

    std::cout << "   Blockchain initialization + 100 blocks: "
              << duration.count() << " ms" << std::endl;
    std::cout << "   Average block processing time: "
              << duration.count() / 100.0 << " ms" << std::endl;
  }

  void benchmarkConsensus() {
    std::cout << "\n2. Consensus Algorithm Performance Test" << std::endl;

    RandomXv2 consensus;
    consensus.initialize();

    // Benchmark hash calculation
    std::string test_data = "benchmark_block_data_for_testing_performance";

    auto start = std::chrono::high_resolution_clock::now();

    for (int i = 0; i < 1000; i++) {
      std::string hash = consensus.calculateHash(test_data + std::to_string(i));
      // Verify a subset to avoid optimizing away
      if (i % 100 == 0) {
        bool valid = consensus.verifyBlock(test_data + std::to_string(i), hash);
      }
    }

    auto end = std::chrono::high_resolution_clock::now();
    auto duration =
        std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

    std::cout << "   1000 hash calculations + 10 verifications: "
              << duration.count() << " ms" << std::endl;
    std::cout << "   Average hash calculation time: "
              << duration.count() / 1000.0 << " ms" << std::endl;
  }

  void benchmarkPrivacy() {
    std::cout << "\n3. Privacy Features Performance Test" << std::endl;

    RingCT ringct;
    ringct.initialize();

    Bulletproofs bulletproofs;
    bulletproofs.initialize();

    // Benchmark RingCT creation
    std::vector<std::string> real_outputs = {"real1", "real2", "real3"};
    std::vector<std::vector<std::string>> decoy_sets = {
        {"decoy1", "decoy2", "decoy3", "decoy4", "decoy5", "decoy6", "decoy7",
         "decoy8", "decoy9", "decoy10"},
        {"decoy11", "decoy12", "decoy13", "decoy14", "decoy15", "decoy16",
         "decoy17", "decoy18", "decoy19", "decoy20"},
        {"decoy21", "decoy22", "decoy23", "decoy24", "decoy25", "decoy26",
         "decoy27", "decoy28", "decoy29", "decoy30"}};

    auto start = std::chrono::high_resolution_clock::now();

    for (int i = 0; i < 100; i++) {
      ringct.createTransaction(real_outputs, decoy_sets, 100000000 + i,
                               "recipient" + std::to_string(i));
    }

    auto end = std::chrono::high_resolution_clock::now();
    auto duration =
        std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

    std::cout << "   100 RingCT transactions: " << duration.count() << " ms"
              << std::endl;
    std::cout << "   Average RingCT creation time: " << duration.count() / 100.0
              << " ms" << std::endl;

    // Benchmark Bulletproofs
    start = std::chrono::high_resolution_clock::now();

    std::vector<std::string> proofs;
    for (int i = 0; i < 100; i++) {
      std::string proof =
          bulletproofs.generateProof(100000000 + i, 0, 1000000000);
      proofs.push_back(proof);
    }

    end = std::chrono::high_resolution_clock::now();
    duration =
        std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

    std::cout << "   100 Bulletproofs generated: " << duration.count() << " ms"
              << std::endl;
    std::cout << "   Average proof generation time: "
              << duration.count() / 100.0 << " ms" << std::endl;

    // Benchmark proof verification
    start = std::chrono::high_resolution_clock::now();

    int valid_count = 0;
    for (const auto &proof : proofs) {
      if (bulletproofs.verifyProof(proof, 0, 1000000000)) {
        valid_count++;
      }
    }

    end = std::chrono::high_resolution_clock::now();
    duration =
        std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

    std::cout << "   " << valid_count
              << "/100 Bulletproofs verified: " << duration.count() << " ms"
              << std::endl;
    std::cout << "   Average proof verification time: "
              << duration.count() / 100.0 << " ms" << std::endl;
  }

  void benchmarkTransactions() {
    std::cout << "\n4. Transaction Processing Performance Test" << std::endl;

    // This would benchmark end-to-end transaction processing
    // including creation, verification, and addition to mempool
    std::cout << "   Transaction processing benchmark: Placeholder"
              << std::endl;
    std::cout << "   (Implementation would test full transaction lifecycle)"
              << std::endl;
  }
};

int main() {
  DarkGhostBenchmark benchmark;
  benchmark.runAllBenchmarks();

  return 0;
}
