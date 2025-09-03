@echo off
echo Starting DarkGhost 3-node Devnet...
echo ===================================

REM Check if docker-compose.devnet.yml exists
if not exist "docker-compose.devnet.yml" (
    echo Error: docker-compose.devnet.yml not found!
    echo Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Create necessary directories
echo Creating data directories...
if not exist "data\node1" mkdir "data\node1"
if not exist "data\node2" mkdir "data\node2"
if not exist "data\node3" mkdir "data\node3"
if not exist "faucet_data" mkdir "faucet_data"

REM Start the devnet
echo Starting 3-node devnet with Docker Compose...
docker-compose -f docker-compose.devnet.yml up -d

if %errorlevel% equ 0 (
    echo.
    echo ✅ Devnet started successfully!
    echo.
    echo Nodes:
    echo   - Node 1 (Bootstrap): localhost:18080 (P2P), localhost:18081 (RPC)
    echo   - Node 2 (Peer):      localhost:18083 (P2P), localhost:18084 (RPC)
    echo   - Node 3 (Peer):      localhost:18086 (P2P), localhost:18087 (RPC)
    echo   - Faucet:             localhost:8080
    echo.
    echo To view logs:
    echo   docker-compose -f docker-compose.devnet.yml logs -f
    echo.
    echo To stop the devnet:
    echo   scripts\devnet_down.bat
) else (
    echo ❌ Failed to start devnet!
    pause
    exit /b 1
)

pause
