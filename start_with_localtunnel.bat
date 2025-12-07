@echo off
echo ========================================
echo Starting BERT Summarizer with localtunnel
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
echo Installing localtunnel (if needed)...
venv\Scripts\python.exe -m pip install localtunnel --quiet 2>nul
if errorlevel 1 (
    echo Installing localtunnel globally...
    npm install -g localtunnel 2>nul
    if errorlevel 1 (
        echo.
        echo ERROR: Could not install localtunnel!
        echo Please install Node.js from https://nodejs.org/
        echo Then run: npm install -g localtunnel
        echo.
        pause
        exit /b 1
    )
)

echo.
echo Starting localtunnel...
echo This will create a public URL that anyone can access!
echo.
echo NOTE: You'll need to press Enter when prompted to accept the tunnel
echo.

REM Try using Python localtunnel first, then npm
venv\Scripts\python.exe -c "import subprocess; subprocess.Popen(['lt', '--port', '8000'], shell=True)" 2>nul
if errorlevel 1 (
    start "Localtunnel" cmd /k "lt --port 8000"
)

timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Check the localtunnel window for your public URL
echo It will look like: https://xxxx.loca.lt
echo.
echo Share this URL with your friend:
echo https://xxxx.loca.lt/summarizer.html
echo.
echo IMPORTANT: Keep both windows open!
echo.
pause

