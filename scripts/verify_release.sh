#!/bin/bash

echo "Verifying DarkGhost v0.3.0-alpha Release..."
echo "=========================================="

# Check if we're in the right directory
if [ ! -f "CMakeLists.txt" ]; then
    echo "Error: Please run this script from the DarkGhost root directory"
    exit 1
fi

# Check for required files
required_files=(
    "src/core/genesis.h"
    "src/privacy/ringct.h"
    "src/privacy/ringct.cpp"
    "src/main.cpp"
    "src/wallet/cli_wallet.cpp"
    "docs/SPRINT_0_3_FINAL.md"
    "docs/RFC-001_RESULTS.md"
    "docs/BULLETPROOFS_AUDIT_PREP.md"
    "docs/BUILD_AND_TEST.md"
    "docs/HALVING_SCHEDULE.md"
    "docs/HALVING_SCHEDULE_GRAPH.md"
    "src/tests/bulletproofs_test.cpp"
    "CMakeLists.txt"
    "scripts/build_and_test_bp.sh"
    "scripts/build_and_test_bp.bat"
    "scripts/build_matrix.sh"
    "scripts/build_matrix.bat"
    "whitepaper/whitepaper_v1.0.tex"
    "whitepaper/compile.sh"
    "whitepaper/compile.bat"
)

missing_files=0
for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "❌ Missing required file: $file"
        missing_files=1
    fi
done

if [ $missing_files -eq 1 ]; then
    echo "❌ Release verification failed: Missing files"
    exit 1
fi

echo "✅ All required files present"

# Check ring size
if ! grep -q "DEFAULT_RING_SIZE = 17" src/core/genesis.h; then
    echo "❌ Ring size not updated to 17"
    exit 1
fi

echo "✅ Ring size correctly set to 17"

# Check testnet flag
if ! grep -q "is_testnet" src/main.cpp; then
    echo "❌ --testnet flag not implemented in node daemon"
    exit 1
fi

if ! grep -q "is_testnet" src/wallet/cli_wallet.cpp; then
    echo "❌ --testnet flag not implemented in CLI wallet"
    exit 1
fi

echo "✅ --testnet flag implemented in all binaries"

# Check for build scripts
if [ ! -x "scripts/build_and_test_bp.sh" ]; then
    echo "Warning: scripts/build_and_test_bp.sh not executable"
fi

if [ ! -x "scripts/build_matrix.sh" ]; then
    echo "Warning: scripts/build_matrix.sh not executable"
fi

if [ ! -x "whitepaper/compile.sh" ]; then
    echo "Warning: whitepaper/compile.sh not executable"
fi

echo "✅ Build and compilation scripts present"

echo
echo "🎉 Release verification successful!"
echo "✅ v0.3.0-alpha is ready for distribution"
echo "📦 Deliverables:"
echo "  - CLI wallet with Ring-size 17"
echo "  - --testnet flag support"
echo "  - Bulletproofs+ audit preparation"
echo "  - Deterministic build matrix"
echo "  - Whitepaper foundation"
echo "  - Halving schedule documentation"
