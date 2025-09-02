@echo off
title DarkGhost Monero Fork Setup

echo DarkGhost Monero Fork Setup
echo ==========================

REM Check if we're in the right directory
if not exist "CMakeLists.txt" (
    echo Error: Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Create branch for DarkGhost v0.1.0
echo Creating darkghost-v0.1.0 branch...
git checkout -b darkghost-v0.1.0

REM Update project name and description
echo Updating project name and description...
powershell -Command "(gc README.md) -replace 'DarkGhost', 'DarkGhost [DG]' | Out-File -encoding UTF8 README.md"
powershell -Command "(gc README.md) -replace 'DarkGhost Core', 'DarkGhost [DG] Core' | Out-File -encoding UTF8 README.md"

REM Update version information
echo Updating version information...
powershell -Command "(gc src/darkghost.h) -replace 'DARKGHOST_VERSION \"1.0.0\"', 'DARKGHOST_VERSION \"0.1.0-alpha\"' | Out-File -encoding UTF8 src/darkghost.h"

REM Update supply information
echo Updating supply information...
powershell -Command "(gc src/darkghost.h) -replace '10000000000000000ULL', '10000000000000000ULL // 100 million DG in atomic units' | Out-File -encoding UTF8 src/darkghost.h"

REM Update block time
echo Updating block time...
powershell -Command "(gc src/darkghost.h) -replace 'DARKGHOST_BLOCK_TIME 120', 'DARKGHOST_BLOCK_TIME 120 // 2 minutes' | Out-File -encoding UTF8 src/darkghost.h"

REM Update ring size
echo Updating ring size...
powershell -Command "(gc src/darkghost.h) -replace 'DARKGHOST_RING_SIZE 11', 'DARKGHOST_RING_SIZE 11 // 10 decoys + 1 real' | Out-File -encoding UTF8 src/darkghost.h"

echo.
echo Monero fork setup completed!
echo Next steps:
echo 1. Review and update genesis parameters
echo 2. Change magic bytes
echo 3. Update ticker symbols
echo 4. Adjust emission schedule
echo.
pause