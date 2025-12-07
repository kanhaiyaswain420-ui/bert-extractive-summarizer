@echo off
echo ========================================
echo Starting BERT Summarizer with ngrok
echo ========================================
echo.

REM Check if venv exists
if not exist "venv\Scripts\python.exe" (
    echo ERROR: Virtual environment not found!
    echo Please run setup_project.bat first
    pause
    exit /b 1
)

REM Check if ngrok exists
where ngrok >nul 2>&1
if errorlevel 1 (
    echo.
    echo ERROR: ngrok is not installed!
    echo.
    echo Please install ngrok:
    echo 1. Download from: https://ngrok.com/download
    echo 2. Extract ngrok.exe to a folder in your PATH
    echo    OR extract to this project folder
    echo.
    echo Alternatively, you can use localtunnel (no installation needed)
    echo Run: start_with_localtunnel.bat
    echo.
    pause
    exit /b 1
)

echo Starting BERT Summarizer API server...
start "BERT API Server" cmd /k "venv\Scripts\python.exe server.py"

timeout /t 3 /nobreak >nul

echo.
echo Starting ngrok tunnel...
echo This will create a public URL that anyone can access!
echo.
start "ngrok Tunnel" cmd /k "ngrok http 8080"

timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo 1. Check the ngrok window for your public URL
echo    It will look like: https://xxxx-xxxx-xxxx.ngrok.io
echo.
echo 2. Share this URL with your friend:
echo    https://xxxx-xxxx-xxxx.ngrok.io/summarizer.html
echo.
echo 3. Or use the ngrok web interface:
echo    http://localhost:4040
echo.
echo IMPORTANT: Keep both windows open!
echo.
pause

