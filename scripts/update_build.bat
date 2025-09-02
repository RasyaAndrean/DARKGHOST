@echo off
echo Updating DarkGhost Build...
echo =========================

REM Check if we're in the right directory
if not exist "CMakeLists.txt" (
    echo Error: Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Pull latest changes
echo Pulling latest changes...
git pull

REM Clean build directory
echo Cleaning build directory...
if exist "build" (
    rmdir /s /q "build"
)
mkdir "build"

REM Build the project
echo Building project...
cd build
cmake .. -G "MinGW Makefiles"
mingw32-make

if exist "darkghostd.exe" (
    echo.
    echo Update successful!
    echo Executables updated:
    echo   - darkghostd.exe (Main node)
    echo   - darkghost_wallet.exe (CLI wallet)
    echo   - darkghost_test.exe (Test suite)
    echo   - darkghost_benchmark.exe (Benchmark tool)
) else (
    echo.
    echo Update failed!
    echo Check the error messages above.
)

cd ..

echo.
echo Build update complete!
pause