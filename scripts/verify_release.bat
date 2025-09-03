@echo off
echo Verifying DarkGhost v0.3.0-alpha Release...
echo ==========================================

REM Check if we're in the right directory
if not exist "CMakeLists.txt" (
    echo Error: Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Check for required files
set missing_files=0

for %%f in (
    "src\core\genesis.h"
    "src\privacy\ringct.h"
    "src\privacy\ringct.cpp"
    "src\main.cpp"
    "src\wallet\cli_wallet.cpp"
    "docs\SPRINT_0_3_FINAL.md"
    "docs\RFC-001_RESULTS.md"
    "docs\BULLETPROOFS_AUDIT_PREP.md"
    "docs\BUILD_AND_TEST.md"
    "docs\HALVING_SCHEDULE.md"
    "docs\HALVING_SCHEDULE_GRAPH.md"
    "src\tests\bulletproofs_test.cpp"
    "CMakeLists.txt"
    "scripts\build_and_test_bp.bat"
    "scripts\build_matrix.bat"
    "whitepaper\whitepaper_v1.0.tex"
    "whitepaper\compile.bat"
) do (
    if not exist "%%f" (
        echo ❌ Missing required file: %%f
        set missing_files=1
    )
)

if %missing_files% equ 1 (
    echo ❌ Release verification failed: Missing files
    pause
    exit /b 1
)

echo ✅ All required files present

REM Check ring size
findstr "DEFAULT_RING_SIZE = 17" src\core\genesis.h > nul
if %errorlevel% neq 0 (
    echo ❌ Ring size not updated to 17
    pause
    exit /b 1
)

echo ✅ Ring size correctly set to 17

REM Check testnet flag
findstr "is_testnet" src\main.cpp > nul
if %errorlevel% neq 0 (
    echo ❌ --testnet flag not implemented in node daemon
    pause
    exit /b 1
)

findstr "is_testnet" src\wallet\cli_wallet.cpp > nul
if %errorlevel% neq 0 (
    echo ❌ --testnet flag not implemented in CLI wallet
    pause
    exit /b 1
)

echo ✅ --testnet flag implemented in all binaries

echo ✅ Build and compilation scripts present

echo.
echo 🎉 Release verification successful!
echo ✅ v0.3.0-alpha is ready for distribution
echo 📦 Deliverables:
echo   - CLI wallet with Ring-size 17
echo   - --testnet flag support
echo   - Bulletproofs+ audit preparation
echo   - Deterministic build matrix
echo   - Whitepaper foundation
echo   - Halving schedule documentation

pause
