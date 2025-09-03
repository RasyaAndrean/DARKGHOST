# 🎉 DarkGhost v0.3.0-alpha Released!

## Major Privacy and Development Enhancements

**September 30, 2025** - The DarkGhost development team is proud to announce the release of **v0.3.0-alpha**, completing Sprint 0.3 with significant enhancements to privacy features and development infrastructure.

## 🚀 Key Highlights

### 🔐 Enhanced Privacy with Ring-size 17

Based on the community RFC-001 vote where 63.5% preferred enhanced privacy, we've increased the default ring size from 11 to 17 (16 decoys + 1 real). This provides significantly better resistance to statistical analysis and transaction linking.

### 🧪 Full Testnet Support

All DarkGhost binaries now support the `--testnet` flag, enabling proper development and testing environments separate from mainnet operations.

### 🔍 Security First Approach

The Bulletproofs+ implementation has been prepared for security audit with Trail-of-Bits, ensuring our range proof system meets the highest security standards.

### 🛠️ Developer Infrastructure

We've established a deterministic build matrix for reproducible builds across Windows, macOS, and Ubuntu platforms, laying the groundwork for verifiable releases.

## 📦 Complete Feature Set

### Privacy Features

- ✅ RingCT with Ring-size 17 default
- ✅ Bulletproofs+ range proofs
- ✅ Stealth addresses for transaction unlinkability
- ✅ Community-driven privacy parameters

### Development Tools

- ✅ --testnet flag for all binaries
- ✅ Comprehensive test suite
- ✅ Deterministic build matrix
- ✅ Updated build and testing documentation

### Documentation

- ✅ Whitepaper foundation (LaTeX template)
- ✅ Halving schedule with visualizations
- ✅ Sprint completion reports
- ✅ RFC voting results

## 📊 Technical Improvements

### Performance Impact

- Transaction size increased by ~50% for enhanced privacy
- Verification time slightly increased due to larger ring signatures
- Network bandwidth requirements increased for transaction propagation

### Security Enhancements

- Better resistance to statistical analysis
- Improved transaction unlinkability
- Foundation for comprehensive security audit

## 🛠 How to Upgrade

### Building from Source

```bash
git clone https://github.com/RasyaAndrean/DARKGHOST.git
cd DARKGHOST
mkdir build && cd build
cmake ..
make
```

### Running with Testnet

```bash
# Node daemon
./darkghostd --testnet

# CLI Wallet
./darkghost_wallet --testnet
```

## 📅 Roadmap Ahead

### Milestone 1: Public Testnet (October 2025)

- Genesis block ceremony on October 1
- Public testnet launch on October 2-3
- Community mining and testing

### Coming Soon

- v1.0.0-testnet release
- Mining pool reference implementation
- Exchange listing preparation
- Hardware wallet integration

## 🙏 Community Thanks

We want to thank our amazing community for their participation in the RFC-001 voting process and continued support. The 63.5% preference for Ring-size 17 demonstrates our commitment to community-driven development.

## 🔗 Resources

- **Documentation**: [docs/](docs/)
- **GitHub**: [https://github.com/RasyaAndrean/DARKGHOST](https://github.com/RasyaAndrean/DARKGHOST)
- **Discord**: [discord.gg/darkghost](https://discord.gg/darkghost)
- **Reddit**: [r/darkghost](https://reddit.com/r/darkghost)

---

_This is an alpha release intended for testing purposes. Please do not use with real funds until the mainnet launch._

**Download v0.3.0-alpha**: [https://github.com/RasyaAndrean/DARKGHOST/releases/tag/v0.3.0-alpha](https://github.com/RasyaAndrean/DARKGHOST/releases/tag/v0.3.0-alpha)

_Created with ❤️ by the DarkGhost Development Team_
_Lead Developer: Rasya Andrean <rasyaandrean@outlook.co.id>_
