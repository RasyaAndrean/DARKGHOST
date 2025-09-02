@echo off
echo DarkGhost New Directory Structure
echo ===============================
echo.

echo Root Directory:
dir /b | findstr /v "src build docs scripts"
echo.

echo Source Code (src/):
dir src /b
echo.

echo Build Directory (build/):
dir build /b | findstr /v "src"
echo.

echo Documentation (docs/):
dir docs /b | findstr /r /c:"\.md$" | find /c /v ""
echo Markdown files found
echo.

echo Scripts (scripts/):
dir scripts /b | findstr /r /c:"\.\(bat\|sh\)$" | find /c /v ""
echo Script files found
echo.

echo Core Components (src/core/):
dir src\core /b
echo.

echo Consensus Algorithm (src/consensus/):
dir src\consensus /b
echo.

echo Privacy Features (src/privacy/):
dir src\privacy /b
echo.

echo Wallet Functionality (src/wallet/):
dir src\wallet /b
echo.

echo Test Suite (src/tests/):
dir src\tests /b
echo.

pause
