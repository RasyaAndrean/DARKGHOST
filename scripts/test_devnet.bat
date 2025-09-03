@echo off
echo Testing DarkGhost Devnet Setup...
echo ================================

REM Check if docker-compose.devnet.yml exists
if not exist "docker-compose.devnet.yml" (
    echo Error: docker-compose.devnet.yml not found!
    echo Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Check if Docker is installed
where docker >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Docker is not installed!
    pause
    exit /b 1
)

REM Check if Docker Compose is installed
where docker-compose >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Docker Compose is not installed!
    pause
    exit /b 1
)

REM Check if configuration files exist
set missing_configs=0
if not exist "darkghost.conf.node1" (
    echo Error: darkghost.conf.node1 not found!
    set missing_configs=1
)

if not exist "darkghost.conf.node2" (
    echo Error: darkghost.conf.node2 not found!
    set missing_configs=1
)

if not exist "darkghost.conf.node3" (
    echo Error: darkghost.conf.node3 not found!
    set missing_configs=1
)

if %missing_configs% equ 1 (
    echo Missing configuration files!
    pause
    exit /b 1
)

REM Check if scripts exist
set missing_scripts=0
if not exist "scripts\devnet_up.bat" (
    echo Error: scripts\devnet_up.bat not found!
    set missing_scripts=1
)

if not exist "scripts\devnet_down.bat" (
    echo Error: scripts\devnet_down.bat not found!
    set missing_scripts=1
)

if %missing_scripts% equ 1 (
    echo Missing scripts!
    pause
    exit /b 1
)

REM Check if explorer files exist
if not exist "explorer" (
    echo Warning: explorer directory not found!
) else (
    if not exist "explorer\package.json" (
        echo Warning: explorer\package.json not found!
    )
)

REM Check if faucet bot exists
if not exist "scripts\faucet_bot.py" (
    echo Warning: scripts\faucet_bot.py not found!
)

echo ✅ All files are in place!
echo ✅ Devnet setup is ready for testing!

echo.
echo To start the devnet, run:
echo   scripts\devnet_up.bat
echo.
echo To test the explorer, run:
echo   scripts\start_explorer.bat
echo.
echo To test the faucet bot:
echo   python scripts\faucet_bot.py

pause
