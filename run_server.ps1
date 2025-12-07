# Run script for BERT Extractive Summarizer Web Service
# This script starts the Flask web server

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Starting BERT Summarizer Web Service" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if virtual environment exists
if (-not (Test-Path "venv")) {
    Write-Host "ERROR: Virtual environment not found!" -ForegroundColor Red
    Write-Host "Please run .\setup_project.ps1 first" -ForegroundColor Red
    exit 1
}

# Activate virtual environment
Write-Host "Activating virtual environment..." -ForegroundColor Yellow
& .\venv\Scripts\Activate.ps1

# Check if server.py exists
if (-not (Test-Path "server.py")) {
    Write-Host "ERROR: server.py not found!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Starting Flask server..." -ForegroundColor Yellow
Write-Host "Server will be available at: http://localhost:8080" -ForegroundColor Green
Write-Host ""
Write-Host "Endpoints:" -ForegroundColor Cyan
Write-Host "  POST http://localhost:8080/summarize_by_ratio?ratio=0.2" -ForegroundColor White
Write-Host "  POST http://localhost:8080/summarize_by_sentence?num_sentences=5" -ForegroundColor White
Write-Host ""
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

# Run the server
python server.py


