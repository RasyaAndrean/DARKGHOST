#!/bin/bash

# DarkGhost Release Script
# This script creates a new release of DarkGhost

VERSION=$1
RELEASE_DIR="releases"

if [ -z "$VERSION" ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 1.0.0"
    exit 1
fi

echo "Creating DarkGhost release v$VERSION"

# Create release directory
mkdir -p $RELEASE_DIR/v$VERSION

# Build the project
echo "Building DarkGhost..."
make clean
make all
make benchmark

# Create platform-specific packages
echo "Creating platform packages..."

# Linux package
echo "Creating Linux package..."
tar -czf $RELEASE_DIR/v$VERSION/darkghost-linux-x64-v$VERSION.tar.gz \
    build/darkghostd \
    build/darkghost_wallet \
    build/darkghost_test \
    build/benchmark \
    darkghost.conf.example \
    README.md \
    DOCS.md \
    GETTING_STARTED.md \
    CHANGELOG.md

# Create checksums
echo "Creating checksums..."
cd $RELEASE_DIR/v$VERSION
sha256sum darkghost-linux-x64-v$VERSION.tar.gz > darkghost-linux-x64-v$VERSION.tar.gz.sha256

# Create release notes
echo "Creating release notes..."
cat > release-notes-v$VERSION.md << EOF
# DarkGhost v$VERSION Release Notes

## Highlights

- [Feature] Core blockchain implementation
- [Feature] RandomX v2 consensus algorithm
- [Feature] RingCT privacy features
- [Feature] Stealth address implementation
- [Feature] Bulletproofs range proofs
- [Feature] CLI wallet functionality

## Changelog

### Added
- Initial project structure
- Core blockchain with UTXO model
- Privacy features (RingCT, Stealth Addresses, Bulletproofs)
- Wallet implementation
- Build system
- Documentation
- Test suite

### Changed
- None (Initial release)

### Fixed
- None (Initial release)

## Installation

### Linux
\`\`\`bash
tar -xzf darkghost-linux-x64-v$VERSION.tar.gz
cd build
./darkghostd
\`\`\`

## System Requirements

- Linux x64 system
- 4GB RAM minimum
- 50GB free disk space
- Internet connection

## Verification

To verify the integrity of the download, check the SHA256 checksum:

\`\`\`bash
sha256sum -c darkghost-linux-x64-v$VERSION.tar.gz.sha256
\`\`\`

## Documentation

See the following files for detailed documentation:
- README.md: Project overview
- DOCS.md: Technical documentation
- GETTING_STARTED.md: Installation and usage guide
- CHANGELOG.md: Version history

## Support

For support, visit:
- Discord: discord.gg/darkghost
- GitHub: https://github.com/darkghost-network/darkghost-core
- Website: https://darkghost.network

EOF

echo "Release v$VERSION created successfully!"
echo "Files are located in $RELEASE_DIR/v$VERSION"
