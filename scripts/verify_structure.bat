@echo off
echo Verifying DarkGhost Directory Structure...
echo ========================================

REM Check for required directories
echo Checking directories...
if not exist "src" (
    echo ERROR: src directory missing
    exit /b 1
)
if not exist "build" (
    echo ERROR: build directory missing
    exit /b 1
)
if not exist "docs" (
    echo ERROR: docs directory missing
    exit /b 1
)
if not exist "scripts" (
    echo ERROR: scripts directory missing
    exit /b 1
)

echo All main directories present

REM Check for documentation files
echo Checking documentation files...
set "doc_count=0"
for /f %%i in ('dir /b docs\*.md ^| find /c /v ""') do set doc_count=%%i
if %doc_count% LSS 20 (
    echo WARNING: Expected at least 20 documentation files, found %doc_count%
) else (
    echo Documentation files present (%doc_count% files)
)

REM Check for script files
echo Checking script files...
set "script_count=0"
for /f %%i in ('dir /b scripts\*.bat scripts\*.sh ^| find /c /v ""') do set script_count=%%i
if %script_count% LSS 5 (
    echo WARNING: Expected at least 5 script files, found %script_count%
) else (
    echo Script files present (%script_count% files)
)

REM Check for source files
echo Checking source code...
if not exist "src\core\blockchain.h" (
    echo ERROR: Core blockchain header missing
    exit /b 1
)
if not exist "src\consensus\randomx_v2.h" (
    echo ERROR: Consensus header missing
    exit /b 1
)
if not exist "src\privacy\ringct.h" (
    echo ERROR: Privacy header missing
    exit /b 1
)
if not exist "src\wallet\stealth_address.h" (
    echo ERROR: Wallet header missing
    exit /b 1
)

echo Source code files present

echo.
echo Structure verification PASSED
echo.
echo Directory structure:
echo ====================
dir /b
echo.
echo Source directory:
echo ================
dir src /b
echo.
echo Documentation directory:
echo =======================
dir docs /b | findstr /r /c:"\.md$" | find /c /v ""
echo.
echo Scripts directory:
echo =================
dir scripts /b | findstr /r /c:"\.\(bat\|sh\)$" | find /c /v ""

pause
