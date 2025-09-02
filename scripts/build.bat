@echo off
echo Building DarkGhost Core for Windows...
echo ======================================

REM Check if g++ is available
where g++ >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: g++ not found. Please install MinGW-w64 or similar.
    echo Download from: https://www.mingw-w64.org/downloads/
    pause
    exit /b 1
)

REM Create build directory
if not exist "build" mkdir "build"

REM Compile source files
echo Compiling source files...
g++ -std=c++11 -Wall -Wextra -O2 -c src/main.cpp -o build/main.o
g++ -std=c++11 -Wall -Wextra -O2 -c src/core/blockchain.cpp -o build/blockchain.o
g++ -std=c++11 -Wall -Wextra -O2 -c src/consensus/randomx_v2.cpp -o build/randomx_v2.o
g++ -std=c++11 -Wall -Wextra -O2 -c src/privacy/ringct.cpp -o build/ringct.o
g++ -std=c++11 -Wall -Wextra -O2 -c src/wallet/stealth_address.cpp -o build/stealth_address.o

REM Link executable
echo Linking executable...
g++ build/main.o build/blockchain.o build/randomx_v2.o build/ringct.o build/stealth_address.o -o build/darkghostd.exe

REM Check if build was successful
if exist "build\darkghostd.exe" (
    echo.
    echo Build successful!
    echo Executable created: build\darkghostd.exe
    echo.
    echo To run the DarkGhost node:
    echo   cd build
    echo   darkghostd.exe
) else (
    echo.
    echo Build failed!
    echo Check the error messages above.
)

pause
