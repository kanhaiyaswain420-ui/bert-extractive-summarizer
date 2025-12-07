# Setup script for BERT Extractive Summarizer - Full Project
# Run this script to set up the entire project on Windows

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "BERT Extractive Summarizer Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
Write-Host "Checking Python installation..." -ForegroundColor Yellow
try {
    $pythonVersion = python --version 2>&1
    Write-Host "Found: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Python is not installed or not in PATH!" -ForegroundColor Red
    Write-Host "Please install Python 3.7+ from https://www.python.org/" -ForegroundColor Red
    exit 1
}

# Create virtual environment
Write-Host ""
Write-Host "Creating virtual environment..." -ForegroundColor Yellow
if (Test-Path "venv") {
    Write-Host "Virtual environment already exists. Skipping..." -ForegroundColor Yellow
} else {
    python -m venv venv
    Write-Host "Virtual environment created!" -ForegroundColor Green
}

# Activate virtual environment
Write-Host ""
Write-Host "Activating virtual environment..." -ForegroundColor Yellow
& .\venv\Scripts\Activate.ps1

# Upgrade pip
Write-Host ""
Write-Host "Upgrading pip..." -ForegroundColor Yellow
python -m pip install --upgrade pip

# Install main requirements
Write-Host ""
Write-Host "Installing main requirements..." -ForegroundColor Yellow
Write-Host "This may take several minutes..." -ForegroundColor Yellow
pip install -r requirements.txt

# Install Flask and flask-cors for the web service
Write-Host ""
Write-Host "Installing Flask and dependencies for web service..." -ForegroundColor Yellow
pip install Flask flask-cors nltk

# Install the package in development mode
Write-Host ""
Write-Host "Installing bert-extractive-summarizer package..." -ForegroundColor Yellow
pip install -e .

# Download NLTK data
Write-Host ""
Write-Host "Downloading NLTK data..." -ForegroundColor Yellow
python -c "import nltk; nltk.download('punkt')"

# Download spacy model (if needed)
Write-Host ""
Write-Host "Checking spacy model..." -ForegroundColor Yellow
python -c "import spacy; spacy.load('en_core_web_sm')" 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Downloading spacy model..." -ForegroundColor Yellow
    python -m spacy download en_core_web_sm
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "To run the web service, use:" -ForegroundColor Cyan
Write-Host "  .\run_server.ps1" -ForegroundColor White
Write-Host ""
Write-Host "Or manually:" -ForegroundColor Cyan
Write-Host "  .\venv\Scripts\Activate.ps1" -ForegroundColor White
Write-Host "  python server.py" -ForegroundColor White
Write-Host ""


