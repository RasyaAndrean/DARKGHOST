@echo off
echo Verifying DarkGhost GitHub Upload...
echo ================================

REM Check if we're in the right directory
if not exist "CMakeLists.txt" (
    echo Error: Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Check Git status
echo Checking Git repository status...
git status --porcelain

REM Check for uncommitted changes
git diff-index --quiet HEAD -- || (
    echo Warning: You have uncommitted changes!
    echo Please commit or stash your changes before uploading.
    echo.
)

REM Check for untracked files
git ls-files --others --exclude-standard | findstr . > nul
if %errorlevel% equ 0 (
    echo Warning: You have untracked files!
    echo Please add or ignore these files before uploading.
    echo.
)

REM Check current branch
echo Current branch:
git branch --show-current

REM Check remote repository
echo Remote repository:
git remote -v

REM Check last commit
echo Last commit:
git log -1 --oneline

REM Verify key files exist
echo Verifying key files...
set MISSING_FILES=0

if not exist "src\core\blockchain.h" (
    echo ERROR: src\core\blockchain.h missing
    set /a MISSING_FILES+=1
)

if not exist "src\core\blockchain.cpp" (
    echo ERROR: src\core\blockchain.cpp missing
    set /a MISSING_FILES+=1
)

if not exist "src\consensus\randomx_v2.h" (
    echo ERROR: src\consensus\randomx_v2.h missing
    set /a MISSING_FILES+=1
)

if not exist "src\consensus\randomx_v2.cpp" (
    echo ERROR: src\consensus\randomx_v2.cpp missing
    set /a MISSING_FILES+=1
)

if not exist "src\privacy\ringct.h" (
    echo ERROR: src\privacy\ringct.h missing
    set /a MISSING_FILES+=1
)

if not exist "src\privacy\ringct.cpp" (
    echo ERROR: src\privacy\ringct.cpp missing
    set /a MISSING_FILES+=1
)

if not exist "src\privacy\bulletproofs.h" (
    echo ERROR: src\privacy\bulletproofs.h missing
    set /a MISSING_FILES+=1
)

if not exist "src\privacy\bulletproofs.cpp" (
    echo ERROR: src\privacy\bulletproofs.cpp missing
    set /a MISSING_FILES+=1
)

if not exist "src\wallet\stealth_address.h" (
    echo ERROR: src\wallet\stealth_address.h missing
    set /a MISSING_FILES+=1
)

if not exist "src\wallet\stealth_address.cpp" (
    echo ERROR: src\wallet\stealth_address.cpp missing
    set /a MISSING_FILES+=1
)

if not exist "src\wallet\cli_wallet.cpp" (
    echo ERROR: src\wallet\cli_wallet.cpp missing
    set /a MISSING_FILES+=1
)

if not exist "docs\ROADMAP_2025_2028.md" (
    echo ERROR: docs\ROADMAP_2025_2028.md missing
    set /a MISSING_FILES+=1
)

if not exist "scripts\fork_monero.bat" (
    echo ERROR: scripts\fork_monero.bat missing
    set /a MISSING_FILES+=1
)

if not exist "scripts\setup_dev.bat" (
    echo ERROR: scripts\setup_dev.bat missing
    set /a MISSING_FILES+=1
)

if %MISSING_FILES% gtr 0 (
    echo.
    echo Upload verification FAILED: %MISSING_FILES% files missing
    echo Please ensure all files are present before uploading to GitHub
    pause
    exit /b 1
)

echo.
echo Upload verification PASSED: All required files present
echo You can now safely upload to GitHub

echo.
echo Next steps:
echo 1. git add .
echo 2. git commit -m "Phase 0.1 implementation"
echo 3. git push origin main
echo.

pause