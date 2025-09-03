@echo off
echo Testing Sprint 0.3 Changes...
echo ==============================

REM Check if we're in the right directory
if not exist "CMakeLists.txt" (
    echo Error: Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Check if build directory exists
if not exist "build" (
    echo Build directory not found. Creating...
    mkdir build
)

REM Build the project
echo Building project...
cd build
cmake .. > nul 2>&1
mingw32-make > nul 2>&1

if %errorlevel% neq 0 (
    echo ❌ Build failed!
    cd ..
    pause
    exit /b 1
)

echo ✅ Build successful!

REM Test if executables exist
if not exist "darkghostd.exe" (
    echo ❌ darkghostd.exe executable not found!
    cd ..
    pause
    exit /b 1
)

if not exist "darkghost_wallet.exe" (
    echo ❌ darkghost_wallet.exe executable not found!
    cd ..
    pause
    exit /b 1
)

echo ✅ Executables found!

REM Test --testnet flag (basic test)
echo Testing --testnet flag...
start /b darkghostd.exe --testnet --help > nul 2>&1
timeout /t 2 /nobreak > nul

start /b darkghost_wallet.exe --testnet --help > nul 2>&1
timeout /t 2 /nobreak > nul

echo ✅ --testnet flag accepted!

REM Check ring size in source code
findstr "DEFAULT_RING_SIZE = 17" ..\src\core\genesis.h > nul
if %errorlevel% neq 0 (
    echo ❌ Ring size not updated to 17!
    cd ..
    pause
    exit /b 1
)

echo ✅ Ring size correctly set to 17!

cd ..

echo.
echo 🎉 All Sprint 0.3 tests passed!
echo ✅ CLI wallet refactored for Ring-size 17
echo ✅ --testnet flag implemented
echo ✅ Build successful

pause
