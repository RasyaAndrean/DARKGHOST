# DarkGhost Mining Guide

This document provides a comprehensive guide to mining DarkGhost (DG) using the RandomX v2 algorithm.

## Overview

DarkGhost uses the RandomX v2 proof-of-work (PoW) algorithm, which is designed to be CPU-friendly and ASIC-resistant. This guide covers everything from setting up a mining node to optimizing performance.

## Mining Algorithm

### RandomX v2
RandomX v2 is a CPU-friendly mining algorithm with the following characteristics:
- **ASIC Resistance**: Designed to resist specialized mining hardware
- **CPU Optimization**: Optimized for general-purpose CPUs
- **Memory Hard**: Requires significant memory to prevent ASIC development
- **Dynamic Difficulty**: Adjusts difficulty to maintain 2-minute block times

### Algorithm Specifications
- **Block Time**: 120 seconds (2 minutes)
- **Difficulty Adjustment**: Every 10 blocks
- **Dataset Size**: 2GB+ (similar to RandomX)
- **Cache Requirements**: 256KB L3 cache recommended

## Getting Started

### Prerequisites
- **DarkGhost Node**: Running full node
- **Mining Software**: Compatible mining software
- **Wallet Address**: DG wallet address for rewards
- **Internet Connection**: Stable internet connection

### System Requirements
- **CPU**: Modern CPU with AES-NI support
- **RAM**: 4GB+ RAM (8GB+ recommended)
- **Storage**: 50GB+ free disk space
- **OS**: Windows, Linux, or macOS

## Setting Up a Mining Node

### Installing DarkGhost Node
Follow the [DEVELOPMENT_SETUP.md](DEVELOPMENT_SETUP.md) guide to install the DarkGhost node.

### Configuring for Mining
Start the node with mining options:
```bash
# Start node with mining enabled
darkghostd --start-mining --mining-threads 4 --mining-address dg1miner...

# Or configure in darkghost.conf
echo "start-mining=1" >> darkghost.conf
echo "mining-threads=4" >> darkghost.conf
echo "mining-address=dg1miner..." >> darkghost.conf
```

### Mining Configuration Options
- `--start-mining`: Enable mining on startup
- `--mining-threads <n>`: Number of mining threads
- `--mining-address <address>`: Wallet address for rewards
- `--mining-sleep <ms>`: Sleep time between mining attempts

## Mining Software

### XMRig (Recommended)
XMRig is the recommended mining software for DarkGhost:

#### Installation
```bash
# Download XMRig
wget https://github.com/xmrig/xmrig/releases/download/v6.18.0/xmrig-6.18.0-linux-x64.tar.gz

# Extract
tar -xzf xmrig-6.18.0-linux-x64.tar.gz

# Navigate to directory
cd xmrig-6.18.0
```

#### Configuration
Create a configuration file (`config.json`):
```json
{
  "algo": "rx/dg",
  "coin": null,
  "url": "pool.darkghost.network:3333",
  "user": "dg1mineraddress.worker",
  "pass": "x",
  "rig-id": "worker1",
  "keepalive": true,
  "tls": false,
  "tls-fingerprint": null,
  "daemon": false,
  "self-select": null,
  "so-path": null,
  "cpu": {
    "enabled": true,
    "huge-pages": true,
    "hw-aes": null,
    "priority": null,
    "memory-pool": false,
    "yield": true,
    "max-threads-hint": 100,
    "asm": true,
    "argon2-impl": null,
    "astrobwt-max-size": 550,
    "cn/0": false,
    "cn-lite/0": false
  },
  "opencl": {
    "enabled": false,
    "cache": true,
    "loader": null,
    "platform": "AMD",
    "adl": true,
    "cn/0": false,
    "cn-lite/0": false
  },
  "cuda": {
    "enabled": false,
    "loader": null,
    "nvml": true,
    "cn/0": false,
    "cn-lite/0": false
  },
  "donate-level": 1,
  "donate-over-proxy": 1,
  "log-file": null,
  "pools": [
    {
      "algo": null,
      "coin": null,
      "url": "pool.darkghost.network:3333",
      "user": "dg1mineraddress.worker",
      "pass": "x",
      "rig-id": "worker1",
      "nicehash": false,
      "keepalive": true,
      "enabled": true,
      "tls": false,
      "tls-fingerprint": null,
      "daemon": false,
      "self-select": null
    }
  ]
}
```

#### Running XMRig
```bash
# Start mining
./xmrig

# Start mining with custom config
./xmrig -c config.json

# Start mining with command-line options
./xmrig -a rx/dg -o pool.darkghost.network:3333 -u dg1mineraddress.worker -p x
```

### Other Mining Software
- **XMRig-AMD**: For AMD GPU mining
- **XMRig-NVIDIA**: For NVIDIA GPU mining
- **CPUMiner**: Alternative CPU miner

## Pool Mining

### Public Mining Pools
- **DarkGhost Pool**: `pool.darkghost.network:3333`
- **Community Pool**: `community.darkghost.network:3333`
- **Solo Mining**: `localhost:18081` (your own node)

### Pool Configuration
Configure your miner to connect to a pool:
```bash
# XMRig pool configuration
./xmrig -a rx/dg -o pool.darkghost.network:3333 -u YOUR_WALLET_ADDRESS.WORKER_NAME -p x
```

### Pool Features
- **PPLNS**: Pay Per Last N Shares
- **SOLO**: Solo mining mode
- **PPS**: Pay Per Share (coming soon)
- **Mining Statistics**: Real-time mining statistics

## Solo Mining

### Requirements
- **Full Node**: Running DarkGhost full node
- **Synchronized**: Fully synchronized blockchain
- **Wallet**: Wallet address for rewards
- **Resources**: Sufficient system resources

### Configuration
Configure your node for solo mining:
```bash
# Start node with mining enabled
darkghostd --start-mining --mining-threads 4 --mining-address dg1youraddress...

# Or configure in darkghost.conf
echo "start-mining=1" >> darkghost.conf
echo "mining-threads=4" >> darkghost.conf
echo "mining-address=dg1youraddress..." >> darkghost.conf
```

### Advantages
- **Full Rewards**: Keep 100% of block rewards
- **No Pool Fees**: No pool fees deducted
- **Privacy**: Enhanced privacy for mining operations

### Disadvantages
- **Variance**: High reward variance
- **Resources**: Requires significant resources
- **Setup**: More complex setup process

## Performance Optimization

### CPU Optimization
- **Thread Count**: Use optimal thread count for your CPU
- **Affinity**: Set CPU affinity for mining threads
- **Priority**: Set process priority appropriately
- **Turbo Boost**: Enable CPU turbo boost

### Memory Optimization
- **Huge Pages**: Enable huge pages for better performance
- **Memory Pool**: Use memory pool for faster allocation
- **Cache**: Ensure adequate cache availability

### System Optimization
- **OS Tuning**: Tune OS for mining performance
- **Power Management**: Disable power saving features
- **Background Processes**: Minimize background processes
- **Network**: Ensure stable network connection

### XMRig Optimization
```bash
# Optimize for your CPU
./xmrig --cpu-max-threads-hint=75 --cpu-priority=3

# Enable huge pages
sudo sysctl -w vm.nr_hugepages=128

# Set CPU affinity
taskset -c 0-3 ./xmrig
```

## Monitoring and Statistics

### Real-time Monitoring
Monitor mining performance:
```bash
# View system resources
htop

# View mining statistics
watch -n 1 'cat /proc/cpuinfo | grep "cpu MHz"'

# View network statistics
iftop
```

### Mining Pool Statistics
Most pools provide web interfaces for monitoring:
- **Hashrate**: Current and average hashrate
- **Shares**: Accepted and rejected shares
- **Earnings**: Estimated earnings
- **Workers**: Worker status and performance

### Log Analysis
Analyze mining logs:
```bash
# View XMRig logs
tail -f xmrig.log

# Search for accepted shares
grep -i accepted xmrig.log

# View hashrate statistics
grep -i hashrate xmrig.log
```

## Troubleshooting

### Common Issues

#### Low Hashrate
**Symptoms**: Hashrate significantly lower than expected
**Solutions**:
- Check CPU utilization
- Enable huge pages
- Optimize thread count
- Update mining software

#### Connection Issues
**Symptoms**: Cannot connect to mining pool
**Solutions**:
- Check pool address and port
- Verify network connectivity
- Check firewall settings
- Try alternative pools

#### Rejected Shares
**Symptoms**: High rate of rejected shares
**Solutions**:
- Check mining software version
- Verify wallet address
- Check pool settings
- Reduce mining intensity

#### System Instability
**Symptoms**: System crashes or freezes
**Solutions**:
- Reduce mining intensity
- Improve cooling
- Check power supply
- Monitor system temperatures

### Performance Tuning
```bash
# Check CPU temperatures
sensors

# Monitor system load
uptime

# Check memory usage
free -h

# View detailed CPU information
lscpu
```

## Rewards and Economics

### Block Rewards
- **Initial Reward**: 50 DG per block
- **Halving**: Every 4 years (1,051,200 blocks)
- **No Tail Emission**: Fixed supply after all coins mined

### Reward Schedule
```
Height      Reward      Total Supply
0           50 DG       50 DG
1,051,200   25 DG       26,280,050 DG
2,102,400   12.5 DG     39,420,075 DG
...
```

### Mining Profitability
Factors affecting profitability:
- **Hashrate**: Your mining performance
- **Electricity Cost**: Cost of electricity
- **Hardware Cost**: Initial investment
- **Pool Fees**: Pool fee deductions
- **Market Price**: DG market price

### Calculating Profitability
Use mining calculators to estimate profitability:
- **Hashrate**: Your mining hashrate
- **Power Consumption**: Watts consumed
- **Electricity Cost**: Cost per kWh
- **Hardware Cost**: Initial investment

## Security Considerations

### Mining Security
- **Wallet Security**: Secure wallet storage
- **Pool Security**: Use reputable pools
- **Software Security**: Use official mining software
- **Network Security**: Secure network connections

### System Security
- **Updates**: Keep system updated
- **Firewall**: Configure firewall properly
- **Antivirus**: Use antivirus software
- **Backups**: Regular system backups

### Privacy
- **Tor**: Use Tor for enhanced privacy
- **VPNs**: Use VPNs for network privacy
- **Address Rotation**: Rotate wallet addresses
- **Network Isolation**: Isolate mining systems

## Advanced Topics

### Custom Pool Setup
Set up your own mining pool:
```bash
# Clone nodejs-pool repository
git clone https://github.com/darkghost/nodejs-pool.git

# Install dependencies
cd nodejs-pool
npm install

# Configure pool
cp config_examples/darkghost.json config.json
# Edit config.json with your settings

# Start pool
npm start
```

### Mining Farm Management
For large-scale mining operations:
- **Management Software**: Pool management software
- **Monitoring**: Centralized monitoring systems
- **Automation**: Automated management scripts
- **Redundancy**: Redundant systems and backups

### Overclocking
Advanced performance tuning:
- **CPU Overclocking**: CPU frequency tuning
- **Memory Overclocking**: RAM frequency tuning
- **Voltage Tuning**: Voltage optimization
- **Cooling**: Enhanced cooling solutions

## Resources

### Documentation
- [RANDOMX_V2.md](RANDOMX_V2.md) - RandomX v2 algorithm details
- [CLI.md](CLI.md) - Command-line interface
- [API.md](API.md) - API documentation
- [SECURITY.md](SECURITY.md) - Security guidelines

### Mining Software
- [XMRig](https://github.com/xmrig/xmrig) - CPU/GPU miner
- [XMRig-AMD](https://github.com/xmrig/xmrig-amd) - AMD GPU miner
- [XMRig-NVIDIA](https://github.com/xmrig/xmrig-nvidia) - NVIDIA GPU miner

### Tools
- [CPU-Z](https://www.cpuid.com/softwares/cpu-z.html) - CPU information
- [HWiNFO](https://www.hwinfo.com/) - Hardware monitoring
- [MSI Afterburner](https://www.msi.com/page/afterburner) - GPU monitoring
- [Hashrate Calculator](https://whattomine.com/) - Profitability calculator

### Community
- **Discord**: [DarkGhost Mining](https://discord.gg/darkghost)
- **Reddit**: [r/darkghost](https://reddit.com/r/darkghost)
- **Telegram**: [DarkGhost Miners](https://t.me/darkghostminers)
- **Forum**: [DarkGhost Community](https://community.darkghost.network)

## Last Updated

September 2, 2025

---