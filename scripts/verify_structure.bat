@echo off
echo Verifying DarkGhost Project Structure...
echo ======================================

set ERROR_COUNT=0

REM Check required directories
echo Checking directories...
if not exist "src" (
    echo ERROR: src directory missing
    set /a ERROR_COUNT+=1
)
if not exist "docs" (
    echo ERROR: docs directory missing
    set /a ERROR_COUNT+=1
)
if not exist "scripts" (
    echo ERROR: scripts directory missing
    set /a ERROR_COUNT+=1
)

REM Check required source files
echo Checking source files...
if not exist "src\core\blockchain.h" (
    echo ERROR: src\core\blockchain.h missing
    set /a ERROR_COUNT+=1
)
if not exist "src\core\blockchain.cpp" (
    echo ERROR: src\core\blockchain.cpp missing
    set /a ERROR_COUNT+=1
)
if not exist "src\consensus\randomx_v2.h" (
    echo ERROR: src\consensus\randomx_v2.h missing
    set /a ERROR_COUNT+=1
)
if not exist "src\consensus\randomx_v2.cpp" (
    echo ERROR: src\consensus\randomx_v2.cpp missing
    set /a ERROR_COUNT+=1
)
if not exist "src\privacy\ringct.h" (
    echo ERROR: src\privacy\ringct.h missing
    set /a ERROR_COUNT+=1
)
if not exist "src\privacy\ringct.cpp" (
    echo ERROR: src\privacy\ringct.cpp missing
    set /a ERROR_COUNT+=1
)
if not exist "src\privacy\bulletproofs.h" (
    echo ERROR: src\privacy\bulletproofs.h missing
    set /a ERROR_COUNT+=1
)
if not exist "src\privacy\bulletproofs.cpp" (
    echo ERROR: src\privacy\bulletproofs.cpp missing
    set /a ERROR_COUNT+=1
)
if not exist "src\wallet\stealth_address.h" (
    echo ERROR: src\wallet\stealth_address.h missing
    set /a ERROR_COUNT+=1
)
if not exist "src\wallet\stealth_address.cpp" (
    echo ERROR: src\wallet\stealth_address.cpp missing
    set /a ERROR_COUNT+=1
)
if not exist "src\wallet\cli_wallet.cpp" (
    echo ERROR: src\wallet\cli_wallet.cpp missing
    set /a ERROR_COUNT+=1
)
if not exist "src\darkghost.h" (
    echo ERROR: src\darkghost.h missing
    set /a ERROR_COUNT+=1
)
if not exist "src\main.cpp" (
    echo ERROR: src\main.cpp missing
    set /a ERROR_COUNT+=1

)

REM Check build files
echo Checking build configuration...
if not exist "CMakeLists.txt" (
    echo ERROR: CMakeLists.txt missing
    set /a ERROR_COUNT+=1
)
if not exist "Makefile" (
    echo ERROR: Makefile missing
    set /a ERROR_COUNT+=1

)

REM Check documentation
echo Checking documentation...
if not exist "docs\README.md" (
    echo ERROR: docs\README.md missing
    set /a ERROR_COUNT+=1
)
if not exist "docs\ROADMAP_2025_2028.md" (
    echo ERROR: docs\ROADMAP_2025_2028.md missing
    set /a ERROR_COUNT+=1
)

REM Check scripts
echo Checking scripts...
if not exist "scripts\build.bat" (
    echo ERROR: scripts\build.bat missing
    set /a ERROR_COUNT+=1
)
if not exist "scripts\setup_dev.bat" (
    echo ERROR: scripts\setup_dev.bat missing
    set /a ERROR_COUNT+=1

)

echo.
echo Verification complete.
if %ERROR_COUNT% == 0 (
    echo SUCCESS: All required files and directories present
) else (
    echo FOUND %ERROR_COUNT% issues
)

pause
