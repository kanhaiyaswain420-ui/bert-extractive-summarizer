# Step-by-Step Guide to Run BERT Extractive Summarizer

## ✅ Your server is already running!

Based on your terminal, the server is successfully running at:
- **http://127.0.0.1:8080**
- **http://localhost:8080**

---

## Complete Setup & Run Steps

### **Step 1: Setup (One-time only - Already Done!)**

```powershell
# Navigate to project folder
cd "F:\New project\bert-extractive-summarizer"

# Run setup script
.\setup_project.bat
```

**What it does:**
- Creates virtual environment
- Installs all dependencies
- Downloads required models

**Note:** If you see errors about torch or neuralcoref, that's okay - we'll install them separately.

### **Step 2: Install Missing Dependencies (If needed)**

If you get "ModuleNotFoundError: No module named 'torch'", run:

```powershell
.\venv\Scripts\python.exe -m pip install torch sentencepiece
```

### **Step 3: Start the Server**

```powershell
# Activate virtual environment and start server
.\venv\Scripts\python.exe server.py
```

**Or use the batch file:**
```cmd
run_server.bat
```

**What you'll see:**
- Model downloading (first time only, ~440MB)
- "Using Model: bert-base-uncased"
- "Running on http://127.0.0.1:8080"

**Keep this terminal window open!** The server must stay running.

---

## Step 4: Test the API

### **Option A: Use the Test Script (Easiest)**

Open a **NEW PowerShell window** and run:

```powershell
cd "F:\New project\bert-extractive-summarizer"
.\venv\Scripts\python.exe test_api.py
```

### **Option B: Test with PowerShell Commands**

```powershell
# Test 1: Health Check
Invoke-WebRequest -Uri "http://localhost:8080/" -Method GET

# Test 2: Summarize by Ratio (20% of sentences)
$text = "The Chrysler Building, the famous art deco New York skyscraper, will be sold for a small fraction of its previous sales price. The deal, first reported by The Real Deal, was for $150 million, according to a source familiar with the deal. Mubadala, an Abu Dhabi investment fund, purchased 90% of the building for $800 million in 2008. Real estate firm Tishman Speyer had owned the other 10%. The buyer is RFR Holding, a New York real estate company."

$result = Invoke-RestMethod -Uri "http://localhost:8080/summarize_by_ratio?ratio=0.2" -Method Post -Body $text -ContentType "text/plain"
$result.summary
```

### **Option C: Test with Python**

Create a file `test_quick.py`:

```python
import requests

text = "Your long text here that you want to summarize..."

response = requests.post(
    "http://localhost:8080/summarize_by_ratio",
    params={"ratio": 0.2},
    data=text,
    headers={"Content-Type": "text/plain"}
)

print(response.json()["summary"])
```

Run it:
```powershell
.\venv\Scripts\python.exe test_quick.py
```

---

## API Endpoints Reference

### **1. Health Check**
```
GET http://localhost:8080/
```

### **2. Summarize by Ratio**
```
POST http://localhost:8080/summarize_by_ratio?ratio=0.2&min_length=25&max_length=500
Content-Type: text/plain

[Your text here]
```

**Parameters:**
- `ratio` (0.0 to 1.0): Percentage of sentences to return (default: 0.2 = 20%)
- `min_length`: Minimum sentence length (default: 25)
- `max_length`: Maximum sentence length (default: 500)

### **3. Summarize by Sentence Count**
```
POST http://localhost:8080/summarize_by_sentence?num_sentences=5&min_length=25&max_length=500
Content-Type: text/plain

[Your text here]
```

**Parameters:**
- `num_sentences`: Number of sentences to return (default: 5)
- `min_length`: Minimum sentence length (default: 25)
- `max_length`: Maximum sentence length (default: 500)

---

## Quick Start Commands

### **Start Server:**
```powershell
.\venv\Scripts\python.exe server.py
```

### **Stop Server:**
Press `Ctrl+C` in the server terminal

### **Test API:**
```powershell
.\venv\Scripts\python.exe test_api.py
```

### **Use Custom Model:**
```powershell
.\venv\Scripts\python.exe server.py -model distilbert-base-uncased -port 5000
```

---

## Troubleshooting

### **Server won't start:**
1. Make sure virtual environment is activated
2. Install missing dependencies: `.\venv\Scripts\python.exe -m pip install torch sentencepiece`
3. Check if port 8080 is already in use

### **"Module not found" errors:**
```powershell
.\venv\Scripts\python.exe -m pip install [module_name]
```

### **Port already in use:**
```powershell
.\venv\Scripts\python.exe server.py -port 5000
```

### **Want to use a faster/smaller model:**
```powershell
.\venv\Scripts\python.exe server.py -model distilbert-base-uncased
```

---

## Example Usage

### **Summarize a text file:**
```python
from summarizer import Summarizer

# Read your text file
with open('your_file.txt', 'r', encoding='utf-8') as f:
    text = f.read()

# Create summarizer
model = Summarizer()

# Get summary (3 sentences)
summary = model(text, num_sentences=3)
print('\n'.join(summary))
```

### **Use via API:**
```python
import requests

with open('your_file.txt', 'r', encoding='utf-8') as f:
    text = f.read()

response = requests.post(
    "http://localhost:8080/summarize_by_sentence",
    params={"num_sentences": 3},
    data=text,
    headers={"Content-Type": "text/plain"}
)

print(response.json()["summary"])
```

---

## Summary

1. ✅ **Setup:** `.\setup_project.bat` (already done!)
2. ✅ **Start Server:** `.\venv\Scripts\python.exe server.py` (already running!)
3. ✅ **Test:** Open new terminal → `.\venv\Scripts\python.exe test_api.py`
4. ✅ **Use:** Make POST requests to `http://localhost:8080/summarize_by_ratio`

**Your server is ready to use!** 🎉


