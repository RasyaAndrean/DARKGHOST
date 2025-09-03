#!/bin/bash

echo "Compiling DarkGhost Whitepaper v1.0..."
echo "======================================"

# Check if pdflatex is installed
if ! command -v pdflatex &> /dev/null; then
    echo "Error: pdflatex not found. Please install LaTeX."
    exit 1
fi

# Compile the whitepaper
pdflatex whitepaper_v1.0.tex
pdflatex whitepaper_v1.0.tex  # Run twice for proper TOC

if [ $? -eq 0 ]; then
    echo "✅ Whitepaper compiled successfully!"
    echo "Output: whitepaper_v1.0.pdf"
else
    echo "❌ Whitepaper compilation failed!"
    exit 1
fi
