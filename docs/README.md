# DarkGhost [DG] - Hybrid Cryptocurrency

DarkGhost is a privacy-focused cryptocurrency that combines Bitcoin's UTXO model with Monero's privacy features.

## Key Features

- **UTXO Model**: Like Bitcoin, uses Unspent Transaction Outputs for transaction model
- **PoW Consensus**: Uses RandomX v2 algorithm (CPU-friendly, ASIC-resistant)
- **Privacy Features**: RingCT, Stealth Addresses, and Bulletproofs from Monero
- **Fixed Supply**: 100 million DG tokens (no tail emission)
- **Block Time**: 2 minutes (5x faster than Bitcoin)
- **Dynamic Block Size**: Scalable transaction capacity

## Technical Specifications

| Feature               | DarkGhost [DG]                          | Bitcoin (BTC)      | Monero (XMR)                    |
| --------------------- | --------------------------------------- | ------------------ | ------------------------------- |
| **Transaction Model** | UTXO                                    | UTXO               | Account-based (Ring Signatures) |
| **Consensus**         | PoW (RandomX v2)                        | PoW (SHA-256)      | PoW (RandomX)                   |
| **Privacy**           | RingCT + Stealth Address + Bulletproofs | None               | RingCT + Stealth Address        |
| **Supply**            | 100 million (fixed)                     | 21 million (fixed) | Unlimited (tail emission)       |
| **Block Time**        | 2 minutes                               | 10 minutes         | 2 minutes                       |
| **Scalability**       | Dynamic block size                      | Limited block size | Dynamic block size              |

## Development Progress

### Sprint 0.2 (September 2025)

- [Sprint 0.2 Summary](SPRINT_0_2_SUMMARY.md)
- [Sprint 0.2 Deliverables](SPRINT_0_2_DELIVERABLES.md)
- [RandomX v2 Tweaks](RANDOMX_V2_TWEAKS.md)
- [Devnet Explorer](DEVNET_EXPLORER.md)
- [RFC-001 Ring Size Vote](RFC-001_RING_SIZE_VOTE.md)

## Roadmap

### Phase 0 (Months 1-2)

- Fork Monero
- Remove tail emission
- Add UTXO model

### Phase 1 (Months 3-4)

- Public testnet
- Faucet
- RingCT + Bulletproofs

### Phase 2 (Months 5-6)

- GUI wallet
- Mobile wallet
- Blockchain explorer

### Phase 3 (Month 7)

- Mainnet launch
- Mining pools
- Exchange listings

### Phase 4 (Months 8-12)

- Atomic swaps (BTC/DG)
- Hardware wallet support

## Mining Configuration

Example XMRig configuration:

```bash
./xmrig -a rx/dg -o pool.darkghost.network:3333 -u WALLET_ADDRESS.WORKER_NAME -p x
```

## Community

- **GitHub**: `github.com/darkghost-network/darkghost-core`
- **Wallet**: `darkghost-gui` (fork of Feather Wallet)
- **Explorer**: `explorer.darkghost.network` (fork of xmrchain.net)
- **Mining Pool**: `pool.darkghost.network`
- **Discord**: `discord.gg/darkghost`
- **Telegram**: `t.me/darkghostcoin`
- **Reddit**: `r/darkghost`
