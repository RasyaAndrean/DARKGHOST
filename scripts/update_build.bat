@echo off
echo Updating Build Directory...
echo =========================

REM Check if build directory exists
if not exist "..\build" (
    echo Creating build directory...
    mkdir "..\build"
)

REM Copy source files to build directory
echo Copying source files to build directory...
xcopy "..\src" "..\build\src\" /E /Y /Q

REM Copy build scripts to build directory
echo Copying build scripts...
copy "..\scripts\build.bat" "..\build\" /Y
copy "..\scripts\run_node.bat" "..\build\" /Y
copy "..\scripts\run_wallet.bat" "..\build\" /Y
copy "..\scripts\run_tests.bat" "..\build\" /Y

REM Copy build configuration files
echo Copying build configuration...
copy "..\Makefile" "..\build\" /Y
copy "..\CMakeLists.txt" "..\build\" /Y

echo.
echo Build directory updated successfully!
echo.
echo To build DarkGhost:
echo   cd ..\build
echo   build.bat

pause
