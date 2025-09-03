@echo off
echo Stopping DarkGhost 3-node Devnet...
echo ===================================

REM Check if docker-compose.devnet.yml exists
if not exist "docker-compose.devnet.yml" (
    echo Error: docker-compose.devnet.yml not found!
    echo Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Stop the devnet
echo Stopping 3-node devnet with Docker Compose...
docker-compose -f docker-compose.devnet.yml down

if %errorlevel% equ 0 (
    echo ✅ Devnet stopped successfully!
    echo.
    echo To start the devnet again:
    echo   scripts\devnet_up.bat
) else (
    echo ❌ Failed to stop devnet!
    pause
    exit /b 1
)

pause
