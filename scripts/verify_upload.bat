@echo off
echo Verifying DarkGhost GitHub Upload...
echo ==================================

REM Check Git status
echo Checking Git status...
git status

echo.
echo Checking remote repository...
git remote -v

echo.
echo Checking commit history...
git log --oneline -3

echo.
echo Checking tags...
git tag -l

echo.
echo Upload verification complete!
echo.
echo Repository URL: https://github.com/RasyaAndrean/DARKGHOST.git
echo Tag: v1.0.0
echo.
echo To view the repository online, visit:
echo https://github.com/RasyaAndrean/DARKGHOST

pause