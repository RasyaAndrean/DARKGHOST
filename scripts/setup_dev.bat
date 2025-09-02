@echo off
echo Setting up DarkGhost Development Environment...
echo ===============================================

REM Check if we're on Windows
echo Checking operating system...
ver | find "Windows" >nul
if %errorlevel% neq 0 (
    echo This script is designed for Windows systems.
    echo For Linux/macOS, please refer to the documentation.
    pause
    exit /b 1
)

echo.
echo Installing dependencies...
echo ========================

REM Check if Git is installed
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo Warning: Git not found. Please install Git from https://git-scm.com/
) else (
    echo Git: Found
)

REM Check if CMake is installed
where cmake >nul 2>&1
if %errorlevel% neq 0 (
    echo Warning: CMake not found. Please install CMake from https://cmake.org/
) else (
    echo CMake: Found
)

REM Check if GCC/MinGW is installed
where g++ >nul 2>&1
if %errorlevel% neq 0 (
    echo Warning: g++ not found. Please install MinGW-w64 from https://www.mingw-w64.org/
) else (
    echo GCC/MinGW: Found
)

echo.
echo Creating directory structure...
echo =============================

REM Create necessary directories
if not exist "build" mkdir "build"
if not exist "logs" mkdir "logs"
if not exist "wallets" mkdir "wallets"

echo Directories created:
echo - build: Compilation output
echo - logs: Log files
echo - wallets: Wallet storage

echo.
echo Setting up configuration...
echo ==========================

REM Copy example configuration if it doesn't exist
if not exist "darkghost.conf" (
    copy "darkghost.conf.example" "darkghost.conf" >nul
    echo Main configuration file created from example
) else (
    echo Main configuration file already exists
)

echo.
echo Development environment setup complete!
echo ======================================

echo Next steps:
echo 1. Review the darkghost.conf file
echo 2. Run build.bat to compile the project
echo 3. Run run_node.bat to start the node
echo 4. Run the CLI wallet with build\darkghost_wallet.exe

echo.
echo For more information, see:
echo - DOCS.md: Technical documentation
echo - GETTING_STARTED.md: Installation guide
echo - CONTRIBUTING.md: Development guidelines

pause
