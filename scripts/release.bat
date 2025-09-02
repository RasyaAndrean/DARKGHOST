@echo off
echo DarkGhost Release Script
echo ======================

REM Check if we're in the right directory
if not exist "CMakeLists.txt" (
    echo Error: Please run this script from the DarkGhost root directory
    pause
    exit /b 1
)

REM Get version from darkghost.h
for /f "tokens=3" %%a in ('findstr "DARKGHOST_VERSION" src/darkghost.h') do set VERSION=%%a
set VERSION=%VERSION:"=%

echo Creating release for DarkGhost v%VERSION%...

REM Create release directory
set RELEASE_DIR=release-v%VERSION%
if exist "%RELEASE_DIR%" (
    echo Removing existing release directory...
    rmdir /s /q "%RELEASE_DIR%"
)
mkdir "%RELEASE_DIR%"

REM Build project
echo Building project...
if not exist "build" mkdir "build"
cd build
cmake .. -G "MinGW Makefiles"
mingw32-make

if not exist "darkghostd.exe" (
    echo Error: Build failed!
    cd ..
    pause
    exit /b 1
)

echo Build successful!

REM Copy executables to release directory
echo Copying executables...
copy "darkghostd.exe" "..\%RELEASE_DIR%\"
copy "darkghost_wallet.exe" "..\%RELEASE_DIR%\"
copy "darkghost_test.exe" "..\%RELEASE_DIR%\"
copy "darkghost_benchmark.exe" "..\%RELEASE_DIR%\"

REM Copy documentation
echo Copying documentation...
cd ..
mkdir "%RELEASE_DIR%\docs"
xcopy "docs\*.md" "%RELEASE_DIR%\docs\" /E /I

REM Copy scripts
echo Copying scripts...
mkdir "%RELEASE_DIR%\scripts"
copy "scripts\*.bat" "%RELEASE_DIR%\scripts\"
copy "scripts\*.sh" "%RELEASE_DIR%\scripts\"
copy "scripts\*.py" "%RELEASE_DIR%\scripts\"

REM Copy configuration files
echo Copying configuration files...
copy "darkghost.conf.example" "%RELEASE_DIR%\"
copy "pool.conf" "%RELEASE_DIR%\"
copy "README.md" "%RELEASE_DIR%\"
copy "LICENSE" "%RELEASE_DIR%\"

REM Create release archive
echo Creating release archive...
tar -czf "darkghost-v%VERSION%-win64.tar.gz" "%RELEASE_DIR%"

echo.
echo Release v%VERSION% created successfully!
echo Archive: darkghost-v%VERSION%-win64.tar.gz
echo.

pause