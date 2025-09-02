@echo off
echo Verifying DarkGhost Logo Implementation...
echo ======================================

REM Check if assets directory exists
echo Checking assets directory...
if not exist "assets" (
    echo ERROR: assets directory not found
    exit /b 1
)

REM Check if logo.svg exists
echo Checking logo.svg file...
if not exist "assets\logo.svg" (
    echo ERROR: logo.svg not found in assets directory
    exit /b 1
)

REM Check if README.md contains logo reference
echo Checking README.md for logo reference...
findstr /C:"assets/logo.svg" README.md >nul
if %errorlevel% neq 0 (
    echo ERROR: Logo reference not found in README.md
    exit /b 1
)

REM Check Git status
echo Checking Git status...
git status --porcelain | findstr "assets\logo.svg" >nul
if %errorlevel% equ 0 (
    echo WARNING: logo.svg not committed
) else (
    echo Logo.svg is committed
)

git status --porcelain | findstr "README.md" >nul
if %errorlevel% equ 0 (
    echo WARNING: README.md not committed
) else (
    echo README.md is committed
)

echo.
echo Logo implementation verification PASSED
echo.
echo Assets directory: assets/
echo Logo file: assets/logo.svg
echo README updated: Yes
echo.
echo To view the logo:
echo 1. Open assets/logo.svg in a browser
echo 2. Check the updated README.md on GitHub

pause
