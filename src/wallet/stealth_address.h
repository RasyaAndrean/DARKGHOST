#ifndef DARKGHOST_STEALTH_ADDRESS_H
#define DARKGHOST_STEALTH_ADDRESS_H

#include <string>
#include <vector>

// Stealth Address implementation for privacy
class StealthAddress {
public:
  StealthAddress();
  ~StealthAddress();

  void initialize();

  // Generate a one-time stealth address for a transaction
  std::string generateAddress(const std::string &recipient_public_key);

  // Scan for transactions belonging to a recipient
  std::vector<std::string>
  scanTransactions(const std::string &view_key,
                   const std::vector<std::string> &blockchain_transactions);

  // Generate key pairs for wallet
  std::pair<std::string, std::string> generateKeyPair();

private:
  std::string scan_key;
  std::string spend_key;
};

#endif // DARKGHOST_STEALTH_ADDRESS_H
