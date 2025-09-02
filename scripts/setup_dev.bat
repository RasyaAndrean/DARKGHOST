@echo off
echo Setting up DarkGhost Development Environment...
echo =============================================

REM Check if we're in the right directory
if not exist "CMakeLists.txt" (
    echo Error: Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Create necessary directories
echo Creating directories...
if not exist "build" mkdir "build"
if not exist "wallets" mkdir "wallets"
if not exist "logs" mkdir "logs"

REM Initialize git submodules if any
echo Initializing submodules...
git submodule init
git submodule update

REM Install dependencies (Windows)
echo Installing dependencies...
where g++ >nul 2>&1
if %errorlevel% neq 0 (
    echo Warning: g++ not found. Please install MinGW-w64
    echo Download from: https://www.mingw-w64.org/downloads/
)

where cmake >nul 2>&1
if %errorlevel% neq 0 (
    echo Warning: CMake not found. Please install CMake
    echo Download from: https://cmake.org/download/
)

REM Build the project
echo Building project...
cd build
cmake .. -G "MinGW Makefiles"
mingw32-make

if exist "darkghostd.exe" (
    echo.
    echo Build successful!
    echo Executables created:
    echo   - darkghostd.exe (Main node)
    echo   - darkghost_wallet.exe (CLI wallet)
    echo   - darkghost_test.exe (Test suite)
    echo   - darkghost_benchmark.exe (Benchmark tool)
    echo.
    echo To run the DarkGhost node:
    echo   darkghostd.exe
    echo.
    echo To run the CLI wallet:
    echo   darkghost_wallet.exe
    echo.
    echo To run tests:
    echo   darkghost_test.exe
) else (
    echo.
    echo Build failed!
    echo Check the error messages above.
)

cd ..

echo.
echo Development environment setup complete!
echo Next steps:
echo 1. Review the documentation in docs/
echo 2. Run the test suite to verify installation
echo 3. Join our Discord and Telegram dev channels
pause