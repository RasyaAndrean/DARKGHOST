@echo off
echo Building and Testing Bulletproofs Implementation...
echo ==================================================

REM Check if we're in the right directory
if not exist "CMakeLists.txt" (
    echo Error: Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Create build directory if it doesn't exist
if not exist "build" (
    echo Creating build directory...
    mkdir build
)

REM Build the project
echo Building project...
cd build
cmake .. > nul 2>&1
mingw32-make bulletproofs_test > nul 2>&1

if %errorlevel% neq 0 (
    echo ❌ Build failed!
    cd ..
    pause
    exit /b 1
)

echo ✅ Build successful!

REM Run the tests
echo Running Bulletproofs tests...
bulletproofs_test.exe

if %errorlevel% equ 0 (
    echo ✅ All Bulletproofs tests passed!
) else (
    echo ❌ Some tests failed!
    cd ..
    pause
    exit /b 1
)

cd ..
echo 🎉 Bulletproofs implementation is ready for audit!

pause
