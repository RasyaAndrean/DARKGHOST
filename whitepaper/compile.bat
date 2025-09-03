@echo off
echo Compiling DarkGhost Whitepaper v1.0...
echo ======================================

REM Check if pdflatex is installed
where pdflatex >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: pdflatex not found. Please install LaTeX.
    pause
    exit /b 1
)

REM Compile the whitepaper
pdflatex whitepaper_v1.0.tex
pdflatex whitepaper_v1.0.tex  REM Run twice for proper TOC

if %errorlevel% equ 0 (
    echo ✅ Whitepaper compiled successfully!
    echo Output: whitepaper_v1.0.pdf
) else (
    echo ❌ Whitepaper compilation failed!
    pause
    exit /b 1
)

pause
