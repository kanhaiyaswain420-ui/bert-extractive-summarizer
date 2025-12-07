@echo off
echo ========================================
echo ngrok Authtoken Setup
echo ========================================
echo.

REM Check if ngrok exists
if exist "ngrok.exe" (
    echo Found ngrok.exe in current folder
    set NGROK_CMD=ngrok.exe
) else (
    where ngrok >nul 2>&1
    if errorlevel 1 (
        echo ERROR: ngrok.exe not found!
        echo.
        echo Please:
        echo 1. Download ngrok from: https://ngrok.com/download
        echo 2. Extract ngrok.exe to this folder: %CD%
        echo 3. Run this script again
        echo.
        pause
        exit /b 1
    ) else (
        echo Found ngrok in PATH
        set NGROK_CMD=ngrok
    )
)

echo.
echo ========================================
echo Getting Your Authtoken
echo ========================================
echo.
echo 1. Go to: https://dashboard.ngrok.com/get-started/your-authtoken
echo 2. Sign up if you haven't (it's free!)
echo 3. Copy your authtoken
echo.
echo ========================================
echo.

set /p AUTHTOKEN="Paste your authtoken here and press Enter: "

if "%AUTHTOKEN%"=="" (
    echo.
    echo ERROR: No token entered!
    pause
    exit /b 1
)

echo.
echo Setting up authtoken...
%NGROK_CMD% config add-authtoken %AUTHTOKEN%

if errorlevel 1 (
    echo.
    echo ERROR: Failed to set authtoken!
    echo Please check:
    echo - Is the token correct?
    echo - Is ngrok working? Try: %NGROK_CMD% version
    pause
    exit /b 1
)

echo.
echo ========================================
echo Success!
echo ========================================
echo.
echo Your ngrok authtoken has been configured!
echo.
echo You can now use:
echo   .\start_with_ngrok.bat
echo.
echo Or manually:
echo   %NGROK_CMD% http 8080
echo.
pause

