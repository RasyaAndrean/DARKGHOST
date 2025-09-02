@echo off
echo Starting DarkGhost Node...
echo =========================

REM Check if the executable exists
if not exist "build\darkghostd.exe" (
    echo Error: DarkGhost daemon not found!
    echo Please build the project first using build.bat
    pause
    exit /b 1
)

REM Create necessary directories
if not exist "logs" mkdir "logs"
if not exist "wallets" mkdir "wallets"

REM Start the node
echo Starting DarkGhost daemon...
echo Log output will be saved to logs/darkghost.log
echo Press Ctrl+C to stop the node
echo.

build\darkghostd.exe

pause
