#!/bin/bash

echo "Verifying Sprint 0.2 Deliverables..."
echo "===================================="

# Counter for verification
total_checks=0
passed_checks=0

# Function to check file existence
check_file() {
    total_checks=$((total_checks + 1))
    if [ -f "$1" ]; then
        echo "✅ $1 exists"
        passed_checks=$((passed_checks + 1))
    else
        echo "❌ $1 missing"
    fi
}

# Function to check directory existence
check_dir() {
    total_checks=$((total_checks + 1))
    if [ -d "$1" ]; then
        echo "✅ $1 exists"
        passed_checks=$((passed_checks + 1))
    else
        echo "❌ $1 missing"
    fi
}

# Check core implementation files
echo "Checking core implementation files..."
check_file "src/consensus/randomx_v2.h"
check_file "src/consensus/randomx_v2.cpp"
check_file "docs/RANDOMX_V2_TWEAKS.md"

# Check devnet configuration
echo -e "\nChecking devnet configuration..."
check_file "docker-compose.devnet.yml"
check_file "darkghost.conf.node1"
check_file "darkghost.conf.node2"
check_file "darkghost.conf.node3"

# Check scripts
echo -e "\nChecking scripts..."
check_file "scripts/devnet_up.sh"
check_file "scripts/devnet_down.sh"
check_file "scripts/devnet_up.bat"
check_file "scripts/devnet_down.bat"
check_file "scripts/start_explorer.sh"
check_file "scripts/start_explorer.bat"
check_file "scripts/faucet_bot.py"
check_file "scripts/test_devnet.sh"
check_file "scripts/test_devnet.bat"

# Check explorer
echo -e "\nChecking explorer..."
check_dir "explorer"
check_file "explorer/package.json"
check_file "explorer/README.md"
check_file "explorer/app.js"
check_dir "explorer/app"
check_dir "explorer/app/routes"
check_dir "explorer/app/views"
check_dir "explorer/app/public"
check_dir "explorer/app/lib"

# Check GitHub templates
echo -e "\nChecking GitHub templates..."
check_dir ".github/ISSUE_TEMPLATE"
check_file ".github/ISSUE_TEMPLATE/rfc_template.md"
check_file ".github/ISSUE_TEMPLATE/rfc-001-ring-size-vote.md"

# Check documentation
echo -e "\nChecking documentation..."
check_file "docs/DEVNET_EXPLORER.md"
check_file "docs/RFC-001_RING_SIZE_VOTE.md"
check_file "docs/SPRINT_0_2_SUMMARY.md"
check_file "docs/SPRINT_0_2_DELIVERABLES.md"
check_file "PHASE_02_COMPLETION.md"

# Summary
echo -e "\n===================================="
echo "Verification Summary:"
echo "Total checks: $total_checks"
echo "Passed checks: $passed_checks"
echo "Failed checks: $((total_checks - passed_checks))"

if [ $passed_checks -eq $total_checks ]; then
    echo "✅ All checks passed! Sprint 0.2 deliverables are complete."
    exit 0
else
    echo "❌ Some checks failed. Please review the missing files."
    exit 1
fi
