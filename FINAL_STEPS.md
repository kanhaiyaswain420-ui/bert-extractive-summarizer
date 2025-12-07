# Final Steps to Run Your Project

## ✅ Quick Fix - Use These Commands

### **Option 1: Use Batch File (Easiest - No PowerShell Issues!)**

Just double-click or run:
```cmd
start_server.bat
```

This will:
- Check if everything is set up
- Download missing NLTK data
- Start the server

---

### **Option 2: Use Command Prompt (CMD) Instead of PowerShell**

Open **Command Prompt** (not PowerShell) and run:

```cmd
cd "F:\New project\bert-extractive-summarizer"
venv\Scripts\python.exe server.py
```

**No `.\` needed in CMD!**

---

### **Option 3: Fix PowerShell and Run**

In PowerShell, use this syntax (without `.\`):

```powershell
venv\Scripts\python.exe server.py
```

Or use the full path:
```powershell
& "F:\New project\bert-extractive-summarizer\venv\Scripts\python.exe" server.py
```

---

## Fix Missing NLTK Data (If Server Shows 500 Errors)

Run this **once** to download the missing NLTK resource:

**In CMD:**
```cmd
venv\Scripts\python.exe -c "import nltk; nltk.download('punkt_tab')"
```

**In PowerShell:**
```powershell
venv\Scripts\python.exe -c "import nltk; nltk.download('punkt_tab')"
```

---

## Complete Working Steps

### **Step 1: Download NLTK Data**
```cmd
venv\Scripts\python.exe -c "import nltk; nltk.download('punkt_tab')"
```

### **Step 2: Start Server**

**Easiest way:**
```cmd
start_server.bat
```

**Or manually:**
```cmd
venv\Scripts\python.exe server.py
```

### **Step 3: Test (Open New Terminal)**

```cmd
venv\Scripts\python.exe test_api.py
```

---

## What I Fixed

1. ✅ Updated `server.py` to automatically download `punkt_tab`
2. ✅ Created `start_server.bat` - simple batch file to start everything
3. ✅ Provided CMD alternatives (no PowerShell execution policy issues)

---

## Recommended: Use Command Prompt (CMD)

**PowerShell has execution policy issues. Use CMD instead:**

1. Press `Win + R`
2. Type `cmd` and press Enter
3. Navigate to your project:
   ```cmd
   cd "F:\New project\bert-extractive-summarizer"
   ```
4. Run:
   ```cmd
   start_server.bat
   ```

**That's it!** The server will start and you'll see:
```
Running on http://127.0.0.1:8080
```

---

## Test Your Server

Once running, open a **new CMD window** and test:

```cmd
cd "F:\New project\bert-extractive-summarizer"
venv\Scripts\python.exe test_api.py
```

Or test manually:
```cmd
curl -X POST "http://localhost:8080/summarize_by_ratio?ratio=0.2" -H "Content-Type: text/plain" -d "Your text here..."
```

---

## Summary

**Easiest way to run:**
1. Open Command Prompt (CMD)
2. Run: `start_server.bat`
3. Done! Server is running at http://localhost:8080

**No PowerShell needed!** 🎉


