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
echo For YOU (local access):
echo   Flask Server: http://localhost:8000/summarizer.html
echo   Simple Server: http://localhost:8001/summarizer.html
echo.
echo For YOUR FRIEND (same network):
echo   Find your IP address by running: ipconfig ^| findstr "IPv4"
echo   Then share: http://YOUR_IP:8000/summarizer.html
echo.
echo RECOMMENDED: Use Flask server (port 8000) - it handles everything!
echo.
echo The Flask server window will show your network IP address.
echo Check both server windows for connection details.
echo.
pause


