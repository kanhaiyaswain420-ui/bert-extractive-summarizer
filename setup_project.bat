@echo off
echo ========================================
echo BERT Extractive Summarizer Setup
echo ========================================
echo.

REM Check if Python is installed
echo Checking Python installation...
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH!
    echo Please install Python 3.7+ from https://www.python.org/
    pause
    exit /b 1
)

python --version
echo.

REM Create virtual environment
echo Creating virtual environment...
if exist "venv" (
    echo Virtual environment already exists. Skipping...
) else (
    python -m venv venv
    echo Virtual environment created!
)
echo.

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Upgrade pip
echo.
echo Upgrading pip...
python -m pip install --upgrade pip

REM Install main requirements
echo.
echo Installing main requirements...
echo This may take several minutes...
pip install -r requirements.txt

REM Install Flask and flask-cors for the web service
echo.
echo Installing Flask and dependencies for web service...
pip install Flask flask-cors nltk

REM Install the package in development mode
echo.
echo Installing bert-extractive-summarizer package...
pip install -e .

REM Download NLTK data
echo.
echo Downloading NLTK data...
python -c "import nltk; nltk.download('punkt')"

REM Download spacy model (if needed)
echo.
echo Checking spacy model...
python -c "import spacy; spacy.load('en_core_web_sm')" 2>nul
if errorlevel 1 (
    echo Downloading spacy model...
    python -m spacy download en_core_web_sm
)

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo To run the web service, use:
echo   run_server.bat
echo.
echo Or manually:
echo   venv\Scripts\activate.bat
echo   python server.py
echo.
pause


