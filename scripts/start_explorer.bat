@echo off
echo Starting DarkGhost Devnet Explorer...
echo ===================================

REM Check if we're in the right directory
if not exist "explorer\package.json" (
    echo Error: Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Install dependencies if needed
if not exist "explorer\node_modules" (
    echo Installing explorer dependencies...
    cd explorer
    npm install
    cd ..
)

REM Copy config if it doesn't exist
if not exist "explorer\config.js" (
    echo Creating explorer configuration...
    copy explorer\config.example.js explorer\config.js
)

REM Start the explorer
echo Starting explorer...
cd explorer
npm start
