@echo off
echo Starting BERT Summarizer Server...
echo.

REM Check if venv exists
if not exist "venv\Scripts\python.exe" (
    echo ERROR: Virtual environment not found!
    echo Please run setup_project.bat first
    pause
    exit /b 1
)

REM Download NLTK data if needed
echo Checking NLTK data...
venv\Scripts\python.exe -c "import nltk; nltk.download('punkt_tab', quiet=True)" 2>nul

echo.
echo Starting server on http://localhost:8080
echo Press Ctrl+C to stop
echo.

REM Start the server
venv\Scripts\python.exe server.py

pause


