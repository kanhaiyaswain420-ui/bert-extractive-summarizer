# Running the Complete BERT Extractive Summarizer Project

This guide will help you set up and run the entire project, including the web service API.

## Quick Start (3 Steps)

### Step 1: Setup the Project

Open PowerShell in the project directory and run:

```powershell
.\setup_project.ps1
```

This script will:
- Create a virtual environment
- Install all dependencies
- Install Flask for the web service
- Download required models and data
- Set up everything needed to run

**Note:** If you get an execution policy error, run this first:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Step 2: Start the Web Server

Run the server startup script:

```powershell
.\run_server.ps1
```

Or manually:
```powershell
.\venv\Scripts\Activate.ps1
python server.py
```

The server will start on `http://localhost:8080`

### Step 3: Test the API

Open a **new PowerShell window** (keep the server running) and test the API:

```powershell
.\venv\Scripts\Activate.ps1
python test_api.py
```

Or use curl/Postman to make requests directly.

---

## Manual Setup (Alternative)

If you prefer to set up manually:

### 1. Create Virtual Environment
```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

### 2. Install Dependencies
```powershell
pip install -r requirements.txt
pip install Flask flask-cors nltk
pip install -e .
```

### 3. Download Required Data
```powershell
python -c "import nltk; nltk.download('punkt')"
python -m spacy download en_core_web_sm
```

### 4. Run the Server
```powershell
python server.py
```

---

## API Endpoints

Once the server is running, you can use these endpoints:

### 1. Health Check
```
GET http://localhost:8080/
```

### 2. Summarize by Ratio
```
POST http://localhost:8080/summarize_by_ratio?ratio=0.2&min_length=25&max_length=500
Content-Type: text/plain

[Your text here]
```

**Parameters:**
- `ratio` (float): Ratio of sentences (0.0 to 1.0), default: 0.2
- `min_length` (int): Minimum sentence length, default: 25
- `max_length` (int): Maximum sentence length, default: 500

### 3. Summarize by Sentence Count
```
POST http://localhost:8080/summarize_by_sentence?num_sentences=5&min_length=25&max_length=500
Content-Type: text/plain

[Your text here]
```

**Parameters:**
- `num_sentences` (int): Number of sentences to return, default: 5
- `min_length` (int): Minimum sentence length, default: 25
- `max_length` (int): Maximum sentence length, default: 500

---

## Server Options

You can customize the server with command-line arguments:

```powershell
python server.py -model bert-base-uncased -port 8080 -host 0.0.0.0
```

**Available Options:**
- `-model`: BERT model to use (default: `bert-base-uncased`)
  - Options: `bert-base-uncased`, `bert-large-uncased`, `distilbert-base-uncased`, etc.
- `-port`: Port number (default: `8080`)
- `-host`: Host address (default: `0.0.0.0`)
- `-hidden`: Hidden layer to use (default: `-2`)
- `-reduce`: Reduction method - `mean`, `median`, or `max` (default: `mean`)
- `-greediness`: NeuralCoref greediness (default: `0.45`)

**Example with custom model:**
```powershell
python server.py -model distilbert-base-uncased -port 5000
```

---

## Testing the API

### Using the Test Script

```powershell
.\venv\Scripts\Activate.ps1
python test_api.py
```

### Using curl (PowerShell)

```powershell
$body = "Your text to summarize here..."
Invoke-RestMethod -Uri "http://localhost:8080/summarize_by_ratio?ratio=0.2" -Method Post -Body $body -ContentType "text/plain"
```

### Using Python requests

```python
import requests

url = "http://localhost:8080/summarize_by_ratio"
params = {"ratio": 0.2}
headers = {"Content-Type": "text/plain"}
text = "Your long text here..."

response = requests.post(url, params=params, data=text, headers=headers)
result = response.json()
print(result['summary'])
```

### Using Postman

1. Method: `POST`
2. URL: `http://localhost:8080/summarize_by_ratio?ratio=0.2`
3. Headers: `Content-Type: text/plain`
4. Body: Select "raw" and paste your text

---

## Project Structure

```
bert-extractive-summarizer/
├── setup_project.ps1      # Setup script (run this first)
├── run_server.ps1          # Server startup script
├── test_api.py            # API test script
├── server.py              # Flask web server
├── summarizer/            # Core summarizer package
├── examples/              # Example scripts
├── requirements.txt       # Main dependencies
└── RUN_PROJECT.md         # This file
```

---

## Troubleshooting

### Port Already in Use
If port 8080 is already in use:
```powershell
python server.py -port 5000
```

### Module Not Found Errors
Make sure the virtual environment is activated:
```powershell
.\venv\Scripts\Activate.ps1
```

### Model Download Issues
The first run will download BERT models (can be 400MB+). Ensure you have:
- Internet connection
- Sufficient disk space
- Patience (download can take time)

### Memory Issues
If you run out of memory, use a smaller model:
```powershell
python server.py -model distilbert-base-uncased
```

### Execution Policy Error
If PowerShell scripts are blocked:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## Next Steps

- Try different models (`distilbert-base-uncased` is faster)
- Experiment with different ratios and sentence counts
- Integrate the API into your own applications
- Check out `examples/summarize.py` for command-line usage

---

## Support

For issues or questions:
- Check the main README.md
- Review the example scripts in `examples/`
- Check the project's GitHub repository


