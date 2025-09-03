@echo off
echo Verifying Sprint 0.2 Deliverables...
echo ====================================

REM Counter for verification
set total_checks=0
set passed_checks=0

REM Function to check file existence
:check_file
set /a total_checks+=1
if exist "%1" (
    echo ✅ %1 exists
    set /a passed_checks+=1
) else (
    echo ❌ %1 missing
)
goto :eof

REM Function to check directory existence
:check_dir
set /a total_checks+=1
if exist "%1" (
    echo ✅ %1 exists
    set /a passed_checks+=1
) else (
    echo ❌ %1 missing
)
goto :eof

REM Check core implementation files
echo Checking core implementation files...
call :check_file "src\consensus\randomx_v2.h"
call :check_file "src\consensus\randomx_v2.cpp"
call :check_file "docs\RANDOMX_V2_TWEAKS.md"

REM Check devnet configuration
echo.
echo Checking devnet configuration...
call :check_file "docker-compose.devnet.yml"
call :check_file "darkghost.conf.node1"
call :check_file "darkghost.conf.node2"
call :check_file "darkghost.conf.node3"

REM Check scripts
echo.
echo Checking scripts...
call :check_file "scripts\devnet_up.sh"
call :check_file "scripts\devnet_down.sh"
call :check_file "scripts\devnet_up.bat"
call :check_file "scripts\devnet_down.bat"
call :check_file "scripts\start_explorer.sh"
call :check_file "scripts\start_explorer.bat"
call :check_file "scripts\faucet_bot.py"
call :check_file "scripts\test_devnet.sh"
call :check_file "scripts\test_devnet.bat"

REM Check explorer
echo.
echo Checking explorer...
call :check_dir "explorer"
call :check_file "explorer\package.json"
call :check_file "explorer\README.md"
call :check_file "explorer\app.js"
call :check_dir "explorer\app"
call :check_dir "explorer\app\routes"
call :check_dir "explorer\app\views"
call :check_dir "explorer\app\public"
call :check_dir "explorer\app\lib"

REM Check GitHub templates
echo.
echo Checking GitHub templates...
call :check_dir ".github\ISSUE_TEMPLATE"
call :check_file ".github\ISSUE_TEMPLATE\rfc_template.md"
call :check_file ".github\ISSUE_TEMPLATE\rfc-001-ring-size-vote.md"

REM Check documentation
echo.
echo Checking documentation...
call :check_file "docs\DEVNET_EXPLORER.md"
call :check_file "docs\RFC-001_RING_SIZE_VOTE.md"
call :check_file "docs\SPRINT_0_2_SUMMARY.md"
call :check_file "docs\SPRINT_0_2_DELIVERABLES.md"
call :check_file "PHASE_02_COMPLETION.md"

REM Summary
echo.
echo ====================================
echo Verification Summary:
echo Total checks: %total_checks%
echo Passed checks: %passed_checks%
echo Failed checks: %failed_checks%

if %passed_checks% equ %total_checks% (
    echo ✅ All checks passed! Sprint 0.2 deliverables are complete.
    exit /b 0
) else (
    echo ❌ Some checks failed. Please review the missing files.
    exit /b 1
)
