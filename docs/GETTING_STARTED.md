# Getting Started with DarkGhost

Welcome to DarkGhost! This guide will help you get started with the privacy-focused cryptocurrency that combines Bitcoin's UTXO model with Monero's privacy features.

## Table of Contents

1. [System Requirements](#system-requirements)
2. [Installation](#installation)
3. [Running a Node](#running-a-node)
4. [Setting Up a Wallet](#setting-up-a-wallet)
5. [Mining DarkGhost](#mining-darkghost)
6. [Sending Your First Transaction](#sending-your-first-transaction)
7. [Next Steps](#next-steps)

## System Requirements

### Minimum Requirements

- **CPU**: Modern x86-64 processor with 2+ cores
- **RAM**: 4 GB RAM
- **Storage**: 50 GB free disk space (SSD recommended)
- **OS**: Windows 10+, Ubuntu 18.04+, macOS 10.14+
- **Internet**: Broadband connection

### Recommended Requirements

- **CPU**: 4+ cores, 8+ threads
- **RAM**: 8 GB RAM or more
- **Storage**: 100 GB SSD
- **OS**: Latest stable versions
- **Internet**: High-speed connection

## Installation

### Windows

1. Download the latest release from GitHub
2. Extract the archive to your preferred location
3. Run `build.bat` to compile the software:
   ```cmd
   build.bat
   ```

### Linux/macOS

1. Clone the repository:

   ```bash
   git clone https://github.com/darkghost-network/darkghost-core.git
   cd darkghost-core
   ```

2. Build using Make:

   ```bash
   make
   ```

   Or using CMake:

   ```bash
   cmake .
   make
   ```

## Running a Node

### Initial Setup

1. Create necessary directories:

   ```bash
   mkdir wallets logs
   ```

2. Copy the example configuration:

   ```bash
   cp darkghost.conf.example darkghost.conf
   ```

3. Edit `darkghost.conf` with your preferences

### Starting the Node

**Windows:**

```cmd
run_node.bat
```

**Linux/macOS:**

```bash
./build/darkghostd
```

### Node Synchronization

The first time you run the node, it will need to synchronize with the network:

- **Testnet**: 1-2 hours
- **Mainnet**: 6-12 hours (depending on hardware and network)

You can monitor progress in the log files located in the `logs/` directory.

## Setting Up a Wallet

### Creating a New Wallet

1. Run the CLI wallet:

   ```bash
   ./build/darkghost_wallet
   ```

2. Follow the prompts to create a new wallet:
   - Choose a secure password
   - Write down your 24-word seed phrase
   - Store the seed phrase securely (offline storage recommended)

### Restoring a Wallet

If you have an existing seed phrase:

1. Run the CLI wallet:

   ```bash
   ./build/darkghost_wallet
   ```

2. Select the restore option
3. Enter your seed phrase when prompted
4. Set a new password for the restored wallet

### Wallet Security Best Practices

1. **Seed Phrase**: Store in multiple secure locations
2. **Passwords**: Use strong, unique passwords
3. **Backups**: Regularly backup wallet files
4. **Updates**: Keep wallet software updated
5. **Encryption**: Always use wallet encryption

## Mining DarkGhost

### Prerequisites

1. A DarkGhost wallet address for payouts
2. XMRig or compatible mining software
3. Stable internet connection

### Using XMRig

1. Download XMRig from https://github.com/xmrig/xmrig/releases

2. Create a configuration file (`config.json`):

   ```json
   {
     "autosave": true,
     "cpu": true,
     "opencl": false,
     "cuda": false,
     "pools": [
       {
         "coin": null,
         "algo": "rx/dg",
         "url": "pool.darkghost.network:3333",
         "user": "YOUR_WALLET_ADDRESS.YOUR_WORKER_NAME",
         "pass": "x",
         "tls": false,
         "keepalive": true
       }
     ]
   }
   ```

3. Run XMRig:
   ```bash
   ./xmrig
   ```

### Mining Pool Options

- **Official Pool**: pool.darkghost.network
- **Port**: 3333 (TCP), 3334 (SSL)
- **Fee**: 1%

### Mining Performance Tips

1. **CPU Affinity**: Assign specific cores to mining threads
2. **Background Processes**: Close unnecessary applications
3. **Cooling**: Ensure adequate cooling for sustained performance
4. **Power**: Use reliable power supply units

## Sending Your First Transaction

### Using the CLI Wallet

1. Start the wallet:

   ```bash
   ./build/darkghost_wallet
   ```

2. Check your balance:

   ```
   DarkGhost> balance
   ```

3. Send coins:

   ```
   DarkGhost> send
   Recipient address: DG1YourRecipientAddressHere
   Amount (DG): 10.5
   ```

4. Confirm the transaction with your password

### Transaction Privacy

DarkGhost automatically applies privacy features:

- **RingCT**: Mixes your transaction with decoy outputs
- **Stealth Addresses**: Creates one-time addresses for recipients
- **Bulletproofs**: Reduces transaction size and verification time

## Next Steps

### Explore the Ecosystem

1. **Block Explorer**: Visit explorer.darkghost.network
2. **Community**: Join our Discord at discord.gg/darkghost
3. **Mining Pools**: Check pool.darkghost.network
4. **Documentation**: Review all documentation files in the repo

### Advanced Features

1. **View Keys**: Enable transaction scanning without spending ability
2. **Multiple Wallets**: Create separate wallets for different purposes
3. **Node Configuration**: Optimize your node for your specific needs
4. **Pool Mining**: Join a mining pool for more consistent rewards

### Stay Updated

1. **GitHub**: Watch the repository for updates
2. **Social Media**: Follow our official channels
3. **Community Forums**: Participate in discussions
4. **Release Notes**: Check CHANGELOG.md for new features

## Troubleshooting

### Common Issues

1. **Node Won't Sync**

   - Check internet connection
   - Verify firewall settings
   - Check system time accuracy
   - Review log files for errors

2. **Wallet Connection Issues**

   - Ensure node is running
   - Check RPC configuration
   - Verify wallet and node versions match

3. **Mining Problems**
   - Verify pool connection details
   - Check wallet address format
   - Monitor system resources

### Getting Help

1. **Documentation**: Review all guide files
2. **Community**: Ask in Discord or Telegram
3. **GitHub Issues**: Report bugs and problems
4. **FAQ**: Check frequently asked questions

## Useful Commands

### Node Commands

```bash
# Start node
./build/darkghostd

# Check node status
./build/darkghostd --status

# Stop node
./build/darkghostd --stop
```

### Wallet Commands

```bash
# Start wallet
./build/darkghost_wallet

# Wallet interface commands:
# help     - Show available commands
# address  - Display wallet address
# balance  - Show wallet balance
# send     - Send DG to another address
# receive  - Generate stealth address
# exit     - Close the wallet
```

### Test Commands

```bash
# Run unit tests
./build/darkghost_test
```

## Configuration Files

### Main Configuration

- **File**: `darkghost.conf`
- **Location**: Root directory
- **Purpose**: Node configuration settings

### Wallet Configuration

- **Directory**: `wallets/`
- **Files**: Wallet-specific data and keys
- **Security**: Keep private and backed up

### Log Files

- **Directory**: `logs/`
- **Files**: `darkghost.log`
- **Purpose**: Debugging and monitoring

## System Maintenance

### Regular Tasks

1. **Backups**: Regular wallet and configuration backups
2. **Updates**: Keep software updated to latest versions
3. **Monitoring**: Check node and wallet status regularly
4. **Security**: Review and update security settings

### Performance Optimization

1. **Storage**: Use SSD for blockchain data
2. **Memory**: Ensure adequate RAM
3. **Network**: Maintain stable internet connection
4. **CPU**: Monitor processor usage

## Legal and Compliance

### Important Considerations

1. **Local Laws**: Ensure compliance with local regulations
2. **Tax Reporting**: Maintain transaction records
3. **AML/KYC**: Follow applicable financial regulations
4. **Consumer Protection**: Understand your rights and responsibilities

### Privacy vs. Compliance

DarkGhost provides strong privacy features, but users must balance privacy with legal compliance requirements in their jurisdiction.

## Feedback and Contributions

### Reporting Issues

1. **GitHub Issues**: Report bugs and problems
2. **Community Forums**: Discuss issues with other users
3. **Documentation**: Suggest improvements to guides

### Contributing

1. **Code**: Submit pull requests with improvements
2. **Documentation**: Help improve guides and manuals
3. **Translation**: Translate content to other languages
4. **Testing**: Help test new features and releases

Thank you for choosing DarkGhost! We're excited to have you join our community of privacy-focused cryptocurrency users.
