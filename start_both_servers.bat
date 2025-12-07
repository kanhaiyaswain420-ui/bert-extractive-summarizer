@echo off
echo ========================================
echo Starting BERT Summarizer + Web Server
echo ========================================
echo.

REM Check if venv exists
if not exist "venv\Scripts\python.exe" (
    echo ERROR: Virtual environment not found!
    echo Please run setup_project.bat first
    pause
    exit /b 1
)

echo Starting BERT Summarizer API server...
start "BERT API Server" cmd /k "venv\Scripts\python.exe server.py"

timeout /t 3 /nobreak >nul

echo.
echo Starting Web Server (for HTML access)...
start "Web Server" cmd /k "python start_web_server.py"

echo.
echo ========================================
echo Both servers are starting!
echo ========================================
echo.
echo BERT API Server: http://localhost:8080
echo Web Server: http://localhost:8000/summarizer.html
echo.
echo Check the server windows for network IP address
echo.
pause


