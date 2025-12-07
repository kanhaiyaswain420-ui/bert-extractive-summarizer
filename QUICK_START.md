# Quick Start Guide - BERT Extractive Summarizer

## ✅ Current Status
Your server is running at: **http://localhost:8080**

---

## Simple Steps to Run the Project

### **Step 1: Setup (Already Done! ✅)**
```powershell
.\setup_project.bat
```

### **Step 2: Install PyTorch (If needed)**
```powershell
.\venv\Scripts\python.exe -m pip install torch sentencepiece
```

### **Step 3: Start the Server**

**Option A: Using Python directly**
```powershell
.\venv\Scripts\python.exe server.py
```

**Option B: Using batch file**
```cmd
run_server.bat
```

**What you'll see:**
- Model downloading (first time only)
- "Using Model: bert-base-uncased"
- "Running on http://127.0.0.1:8080"

**⚠️ Keep the server terminal open!**

### **Step 4: Test the API**

**Open a NEW terminal window** and run:

```powershell
cd "F:\New project\bert-extractive-summarizer"
.\venv\Scripts\python.exe test_api.py
```

---

## Restart Server After Code Changes

If you made changes to `server.py`:

1. **Stop the server:** Press `Ctrl+C` in the server terminal
2. **Start again:**
   ```powershell
   .\venv\Scripts\python.exe server.py
   ```

---

## Quick Test Commands

### Test 1: Health Check
```powershell
Invoke-WebRequest -Uri "http://localhost:8080/" -Method GET
```

### Test 2: Summarize Text
```powershell
$text = "The Chrysler Building, the famous art deco New York skyscraper, will be sold for a small fraction of its previous sales price. The deal, first reported by The Real Deal, was for $150 million."

Invoke-RestMethod -Uri "http://localhost:8080/summarize_by_ratio?ratio=0.5" -Method Post -Body $text -ContentType "text/plain"
```

---

## API Endpoints

1. **GET** `http://localhost:8080/` - Health check
2. **POST** `http://localhost:8080/summarize_by_ratio?ratio=0.2` - Summarize by percentage
3. **POST** `http://localhost:8080/summarize_by_sentence?num_sentences=5` - Summarize by sentence count

---

## Troubleshooting

### Server shows 500 error?
1. Restart the server (Ctrl+C, then start again)
2. Check the server terminal for error messages
3. Make sure PyTorch is installed: `.\venv\Scripts\python.exe -m pip install torch`

### "Module not found"?
```powershell
.\venv\Scripts\python.exe -m pip install [module_name]
```

### Port already in use?
```powershell
.\venv\Scripts\python.exe server.py -port 5000
```

---

## That's It! 🎉

Your project is ready to use. The server is running and waiting for requests!
