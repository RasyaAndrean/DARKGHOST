@echo off
echo DarkGhost Project Structure
echo =========================
echo.

echo Main Directory:
dir /b | findstr /v "build docs"
echo.

echo Source Code (src/):
dir src /b
echo.

echo Build Directory (build/):
dir build /b | findstr /v "src"
echo.

echo Build Source (build/src/):
dir build\src /b
echo.

echo Documentation (docs/):
dir docs /b
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
