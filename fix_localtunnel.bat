@echo off
echo ========================================
echo Fixing Localtunnel Connection
echo ========================================
echo.

REM Check if server is running
netstat -an | findstr ":8080" >nul
if errorlevel 1 (
    echo ERROR: BERT server is not running on port 8080!
    echo.
    echo Starting BERT server now...
    start "BERT API Server" cmd /k "venv\Scripts\python.exe server.py"
    timeout /t 5 /nobreak >nul
    echo Server should be starting...
    echo.
) else (
    echo Server is running on port 8080
    echo.
)

echo Starting localtunnel...
echo.
echo IMPORTANT: 
echo 1. Wait for the URL to appear
echo 2. You may need to press Enter to accept
echo 3. The URL will look like: https://xxxx.loca.lt
echo.
echo After you get the URL, access:
echo https://xxxx.loca.lt/summarizer.html
echo.

lt --port 8080

pause

