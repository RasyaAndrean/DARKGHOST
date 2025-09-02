# DarkGhost Mining Guide

## Overview

DarkGhost uses the RandomX v2 algorithm, a CPU-friendly and ASIC-resistant mining algorithm. This makes mining accessible to a wider range of participants using consumer hardware.

## Requirements

- **Hardware**: Modern CPU (Intel/AMD recommended)
- **Operating System**: Windows, Linux, or macOS
- **Software**: XMRig or compatible miner
- **Internet Connection**: Stable broadband connection
- **Wallet Address**: DarkGhost wallet address for payouts

## Mining with XMRig

### 1. Download XMRig

Download XMRig from the official website:
https://github.com/xmrig/xmrig/releases

### 2. Configure XMRig

Create a configuration file (`config.json`) with the following content:

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
  ],
  "cpu_threads_conf": [
    {
      "low_power_mode": false,
      "affine_to_cpu": 0
    },
    {
      "low_power_mode": false,
      "affine_to_cpu": 1
    }
  ]
}
```

### 3. Run XMRig

Windows:

```cmd
xmrig.exe
```

Linux/macOS:

```bash
./xmrig
```

### 4. Monitor Performance

XMRig will display real-time statistics including:

- Hashrate (H/s)
- Accepted shares
- Rejected shares
- Connection status

## Mining Pools

### Official Pool

- **URL**: pool.darkghost.network
- **Port**: 3333 (TCP), 3334 (SSL)
- **Fee**: 1%
- **Payout Scheme**: PPLNS
- **Minimum Payout**: 1 DG

### Pool Commands

- **Set wallet**: `setalgo rx/dg`
- **Worker name**: Append to wallet address with dot (.)
- **Password**: Not required (use 'x')

## Hardware Recommendations

### CPUs

| CPU Model         | Cores | Threads | Estimated Hashrate |
| ----------------- | ----- | ------- | ------------------ |
| Intel i7-10700K   | 8     | 16      | 2,000-2,500 H/s    |
| AMD Ryzen 7 3700X | 8     | 16      | 2,200-2,800 H/s    |
| Intel i9-12900K   | 16    | 24      | 4,000-5,000 H/s    |
| AMD Ryzen 9 5950X | 16    | 32      | 4,500-5,500 H/s    |

### Optimization Tips

1. **CPU Affinity**: Assign specific cores to mining threads
2. **Memory**: Ensure adequate RAM (8GB minimum)
3. **Cooling**: Maintain proper cooling for sustained performance
4. **Power**: Use reliable power supply units
5. **Background Processes**: Close unnecessary applications

## Troubleshooting

### Common Issues

1. **Low Hashrate**

   - Check CPU utilization
   - Verify thread configuration
   - Update XMRig to latest version

2. **Connection Problems**

   - Verify pool URL and port
   - Check firewall settings
   - Test internet connectivity

3. **High Rejection Rate**
   - Check wallet address format
   - Verify pool configuration
   - Update mining software

### Performance Monitoring

Key metrics to monitor:

- **Acceptance Rate**: Should be above 99%
- **Hashrate Stability**: Consistent performance
- **System Temperature**: Keep CPUs under 80°C
- **Memory Usage**: Adequate free memory

## Economics

### Block Reward

- **Initial Reward**: 50 DG per block
- **Halving**: Every 4 years (1051200 blocks)
- **Block Time**: 2 minutes

### Profitability Calculation

Factors affecting profitability:

1. **Hashrate**: Higher = more rewards
2. **Electricity Cost**: Varies by region
3. **Hardware Efficiency**: Watts per H/s
4. **Pool Fee**: Typically 1%
5. **Market Price**: DG to fiat exchange rate

### Example Calculation

```
Daily Earnings = (Your Hashrate / Network Hashrate) * Blocks per Day * Reward per Block
```

## Best Practices

### Security

- Use strong wallet passwords
- Enable two-factor authentication
- Regularly update mining software
- Monitor pool account activity

### Efficiency

- Optimize CPU settings for your hardware
- Maintain proper cooling
- Schedule maintenance during low network activity
- Join community forums for tips and updates

### Sustainability

- Consider renewable energy sources
- Use energy-efficient hardware
- Participate in carbon offset programs
- Support green mining initiatives

## Community Resources

- **Discord**: discord.gg/darkghost
- **Telegram**: t.me/darkghostcoin
- **Reddit**: r/darkghost
- **GitHub**: github.com/darkghost-network

## Legal Considerations

Ensure compliance with local regulations regarding:

- Cryptocurrency mining
- Electricity usage
- Tax obligations
- Business licensing requirements

Mining is legal in most jurisdictions, but regulations vary. Consult with legal professionals if needed.
