@echo off
echo ========================================
echo Starting BERT Summarizer Web Service
echo ========================================
echo.

if not exist "venv" (
    echo ERROR: Virtual environment not found!
    echo Please run setup_project.ps1 first
    pause
    exit /b 1
)

echo Activating virtual environment...
call venv\Scripts\activate.bat

if not exist "server.py" (
    echo ERROR: server.py not found!
    pause
    exit /b 1
)

echo.
echo Starting Flask server...
echo Server will be available at: http://localhost:8080
echo.
echo Press Ctrl+C to stop the server
echo.

python server.py

pause


