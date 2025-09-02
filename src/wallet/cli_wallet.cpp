#include "../privacy/bulletproofs.h"
#include "../privacy/ringct.h"
#include "../wallet/stealth_address.h"
#include <iostream>
#include <string>

class CLIWallet {
public:
  CLIWallet() {}
  ~CLIWallet() {}

  void initialize() {
    std::cout << "DarkGhost CLI Wallet v1.0" << std::endl;
    std::cout << "========================" << std::endl;

    // Generate wallet keys
    auto keys = stealth.generateKeyPair();
    private_key = keys.first;
    public_key = keys.second;

    // Initialize bulletproofs
    bulletproofs.initialize();

    std::cout << "Wallet initialized successfully!" << std::endl;
    std::cout << "Public Key: " << public_key << std::endl;
    std::cout << "Use 'help' command for available options" << std::endl;
  }

  void run() {
    std::string command;

    while (true) {
      std::cout << "\nDarkGhost> ";
      std::getline(std::cin, command);

      if (command == "help") {
        showHelp();
      } else if (command == "address") {
        showAddress();
      } else if (command == "balance") {
        showBalance();
      } else if (command == "send") {
        sendTransaction();
      } else if (command == "receive") {
        receiveTransaction();
      } else if (command == "exit") {
        std::cout << "Exiting DarkGhost wallet..." << std::endl;
        break;
      } else {
        std::cout << "Unknown command. Type 'help' for available commands."
                  << std::endl;
      }
    }
  }

private:
  std::string private_key;
  std::string public_key;
  uint64_t balance = 1000000000; // 1000 DG in atomic units
  StealthAddress stealth;
  RingCT ringct;
  Bulletproofs bulletproofs;

  void showHelp() {
    std::cout << "Available commands:" << std::endl;
    std::cout << "  help     - Show this help message" << std::endl;
    std::cout << "  address  - Show wallet address" << std::endl;
    std::cout << "  balance  - Show wallet balance" << std::endl;
    std::cout << "  send     - Send DarkGhost coins" << std::endl;
    std::cout << "  receive  - Receive DarkGhost coins" << std::endl;
    std::cout << "  exit     - Exit the wallet" << std::endl;
  }

  void showAddress() {
    std::cout << "Wallet Address: " << public_key << std::endl;
    std::cout << "Stealth Address: " << stealth.generateAddress(public_key)
              << std::endl;
  }

  void showBalance() {
    double dg_balance = balance / 100000000.0; // Convert from atomic units
    std::cout << "Balance: " << dg_balance << " DG" << std::endl;
    std::cout << "Atomic Units: " << balance << std::endl;
  }

  void sendTransaction() {
    std::string recipient;
    double amount;

    std::cout << "Recipient address: ";
    std::getline(std::cin, recipient);

    std::cout << "Amount (DG): ";
    std::cin >> amount;
    std::cin.ignore(); // Clear the newline character

    uint64_t atomic_amount = static_cast<uint64_t>(amount * 100000000);

    if (atomic_amount > balance) {
      std::cout << "Insufficient balance!" << std::endl;
      return;
    }

    // Create transaction with RingCT
    std::vector<std::string> real_outputs = {"output1", "output2"};
    std::vector<std::vector<std::string>> decoy_sets = {
        {"decoy1", "decoy2", "decoy3", "decoy4", "decoy5", "decoy6", "decoy7",
         "decoy8", "decoy9", "decoy10"},
        {"decoy11", "decoy12", "decoy13", "decoy14", "decoy15", "decoy16",
         "decoy17", "decoy18", "decoy19", "decoy20"}};

    if (ringct.createTransaction(real_outputs, decoy_sets, atomic_amount,
                                 recipient)) {
      balance -= atomic_amount;
      std::cout << "Transaction sent successfully!" << std::endl;
      std::cout << "Amount: " << amount << " DG" << std::endl;
      std::cout << "Recipient: " << recipient << std::endl;
    } else {
      std::cout << "Failed to create transaction!" << std::endl;
    }
  }

  void receiveTransaction() {
    std::cout << "Generating new stealth address for receiving..." << std::endl;
    std::string stealth_addr = stealth.generateAddress(public_key);
    std::cout << "Share this address to receive DarkGhost coins:" << std::endl;
    std::cout << stealth_addr << std::endl;
  }
};

int main() {
  CLIWallet wallet;
  wallet.initialize();
  wallet.run();

  return 0;
}
