# Simple Start Guide - Just Copy & Paste!

## ✅ In PowerShell, Use This:

```powershell
.\start_server.bat
```

**Note:** PowerShell requires `.\` before script names!

---

## ✅ Or Run These Commands One by One:

### Step 1: Download NLTK Data
```powershell
venv\Scripts\python.exe -c "import nltk; nltk.download('punkt_tab', quiet=True)"
```

### Step 2: Start Server
```powershell
venv\Scripts\python.exe server.py
```

---

## ✅ Or Use Command Prompt (CMD) - No `.\` Needed!

Open **Command Prompt** (not PowerShell):

```cmd
start_server.bat
```

Or:
```cmd
venv\Scripts\python.exe server.py
```

---

## Quick Reference

| Terminal | Command |
|----------|---------|
| PowerShell | `.\start_server.bat` |
| CMD | `start_server.bat` |

**PowerShell needs `.\` - CMD doesn't!**


