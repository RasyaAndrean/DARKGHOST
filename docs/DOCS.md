# DarkGhost Documentation

## Project Structure

See [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) for detailed project structure.

## Core Components

### 1. Blockchain (UTXO Model)

See [UTXO_MODEL.md](UTXO_MODEL.md) for detailed UTXO model implementation.

### 2. Consensus (RandomX v2)

See [RANDOMX_V2.md](RANDOMX_V2.md) for detailed RandomX v2 implementation.

### 3. Privacy Features

See [PRIVACY_FEATURES.md](PRIVACY_FEATURES.md) for detailed privacy features implementation.

## Building DarkGhost

See [DEVELOPMENT_SETUP.md](DEVELOPMENT_SETUP.md) for detailed development environment setup.

### Windows

```cmd
build.bat
```

### Linux/macOS

```bash
make
```

## Configuration

The `darkghost.conf` file contains all node configuration options:

- Network settings
- Consensus parameters
- Privacy settings
- Wallet configuration
- Logging options

## Wallet

See [CLI_WALLET.md](CLI_WALLET.md) for detailed CLI wallet usage.

DarkGhost includes a CLI wallet for basic operations:

- Address generation
- Balance checking
- Sending and receiving transactions
- Stealth address creation

## Mining

DarkGhost supports CPU mining with XMRig:

```bash
./xmrig -a rx/dg -o pool.darkghost.network:3333 -u WALLET_ADDRESS.WORKER_NAME -p x
```

## Testing

See [TESTING.md](TESTING.md) for detailed testing framework.

## GitHub Actions

See [GITHUB_ACTIONS.md](GITHUB_ACTIONS.md) for CI/CD pipeline details.
