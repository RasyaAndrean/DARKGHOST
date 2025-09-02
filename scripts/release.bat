@echo off
setlocal

REM DarkGhost Release Script for Windows
REM This script creates a new release of DarkGhost

if "%1"=="" (
    echo Usage: release.bat ^<version^>
    echo Example: release.bat 1.0.0
    pause
    exit /b 1
)

set VERSION=%1
set RELEASE_DIR=releases

echo Creating DarkGhost release v%VERSION%

REM Create release directory
if not exist "%RELEASE_DIR%" mkdir "%RELEASE_DIR%"
if not exist "%RELEASE_DIR%\v%VERSION%" mkdir "%RELEASE_DIR%\v%VERSION%"

REM Build the project
echo Building DarkGhost...
call build.bat

REM Create platform-specific packages
echo Creating Windows package...

REM Create a directory for the release files
if not exist "release_temp" mkdir "release_temp"
if not exist "release_temp\build" mkdir "release_temp\build"

REM Copy necessary files
copy "build\darkghostd.exe" "release_temp\build\" >nul
copy "build\darkghost_wallet.exe" "release_temp\build\" >nul
copy "build\darkghost_test.exe" "release_temp\build\" >nul
copy "darkghost.conf.example" "release_temp\" >nul
copy "README.md" "release_temp\" >nul
copy "DOCS.md" "release_temp\" >nul
copy "GETTING_STARTED.md" "release_temp\" >nul
copy "CHANGELOG.md" "release_temp\" >nul

REM Create ZIP archive
echo Creating ZIP archive...
powershell -command "Compress-Archive -Path release_temp\* -DestinationPath %RELEASE_DIR%\v%VERSION%\darkghost-windows-x64-v%VERSION%.zip -Force"

REM Create release notes
echo Creating release notes...
(
echo # DarkGhost v%VERSION% Release Notes
echo.
echo ## Highlights
echo.
echo - [Feature] Core blockchain implementation
echo - [Feature] RandomX v2 consensus algorithm
echo - [Feature] RingCT privacy features
echo - [Feature] Stealth address implementation
echo - [Feature] Bulletproofs range proofs
echo - [Feature] CLI wallet functionality
echo.
echo ## Changelog
echo.
echo ### Added
echo - Initial project structure
echo - Core blockchain with UTXO model
echo - Privacy features (RingCT, Stealth Addresses, Bulletproofs)
echo - Wallet implementation
echo - Build system
echo - Documentation
echo - Test suite
echo.
echo ### Changed
echo - None (Initial release)
echo.
echo ### Fixed
echo - None (Initial release)
echo.
echo ## Installation
echo.
echo ### Windows
echo.
echo 1. Extract the ZIP archive
echo 2. Navigate to the build directory
echo 3. Run darkghostd.exe
echo.
echo ## System Requirements
echo.
echo - Windows 10 or later
echo - 4GB RAM minimum
echo - 50GB free disk space
echo - Internet connection
echo.
echo ## Documentation
echo.
echo See the following files for detailed documentation:
echo - README.md: Project overview
echo - DOCS.md: Technical documentation
echo - GETTING_STARTED.md: Installation and usage guide
echo - CHANGELOG.md: Version history
echo.
echo ## Support
echo.
echo For support, visit:
echo - Discord: discord.gg/darkghost
echo - GitHub: https://github.com/darkghost-network/darkghost-core
echo - Website: https://darkghost.network
) > "%RELEASE_DIR%\v%VERSION%\release-notes-v%VERSION%.md"

REM Clean up temporary files
echo Cleaning up...
rmdir /s /q "release_temp"

echo.
echo Release v%VERSION% created successfully!
echo Files are located in %RELEASE_DIR%\v%VERSION%
pause
