#!/bin/bash

echo "DarkGhost Project Structure (After Phase 0.1)"
echo "=========================================="

echo
echo "Root Directory:"
echo "----------------"
find . -name "logs" -prune -o -name "wallets" -prune -o -name "build" -prune -o -print | sed 's/[^/]*\//|   /g'

echo
echo "Documentation Files:"
echo "-------------------"
ls docs/*.md

echo
echo "Source Files:"
echo "------------"
find src -name "*.h" -o -name "*.cpp" | sort

echo
echo "Script Files:"
echo "------------"
find scripts -name "*.bat" -o -name "*.sh" -o -name "*.py" | sort

echo
echo "Configuration Files:"
echo "-------------------"
find . -name "*.yml" -o -name "*.txt" -o -name "*.conf*" | grep -v "build/"

echo
echo "New Files Added in Phase 0.1:"
echo "----------------------------"
echo "docs/ROADMAP_2025_2028.md"
echo "docs/GENESIS_PARAMETERS.md"
echo "docs/PROJECT_STATUS.md"
echo "docs/GITHUB_ACTIONS.md"
echo "docs/CLI_WALLET.md"
echo "docs/RANDOMX_V2.md"
echo "docs/PRIVACY_FEATURES.md"
echo "docs/UTXO_MODEL.md"
echo "docs/TESTING.md"
echo "docs/DEVELOPMENT_SETUP.md"
echo "docs/COMMUNITY.md"
echo "docs/ARCHITECTURE.md"
echo "scripts/fork_monero.bat"
echo "scripts/fork_monero.sh"
echo "scripts/setup_dev.bat"
echo "scripts/setup_dev.sh"
echo "scripts/update_build.bat"
echo "scripts/verify_structure.bat"
echo "scripts/faucet_bot.py"
echo "scripts/README.md"
echo "src/core/genesis.h"
echo ".github/workflows/build.yml"

echo
echo "Next Steps:"
echo "1. Run 'chmod +x scripts/setup_dev.sh && scripts/setup_dev.sh' to set up your development environment"
echo "2. Run 'make' or 'cmake . && make' to build the project"
echo "3. Run './build/darkghost_test' to verify the build"
echo "4. Join our Discord and Telegram dev channels (coming soon)"