@echo off
echo ========================================
echo Restarting Localtunnel
echo ========================================
echo.

echo Checking if server is running...
netstat -an | findstr ":8080" | findstr "LISTENING" >nul
if errorlevel 1 (
    echo.
    echo ERROR: Server is not running on port 8080!
    echo Please start the server first: .\start_server.bat
    echo.
    pause
    exit /b 1
)

echo Server is running!
echo.
echo Starting localtunnel...
echo.
echo IMPORTANT:
echo 1. Wait for the URL to appear (may take 10-20 seconds)
echo 2. You may need to press Enter to accept the connection
echo 3. The URL will look like: https://xxxx.loca.lt
echo.
echo After you get the URL, open in browser:
echo https://xxxx.loca.lt/summarizer.html
echo.
echo ========================================
echo.

lt --port 8080

pause

