# Fix: Virtual Environment Activation Error

If you're getting errors activating the virtual environment in PowerShell, here are **3 working solutions**:

## Solution 1: Use CMD Instead of PowerShell (Easiest)

**Open Command Prompt (CMD)** instead of PowerShell, then:

```cmd
cd "F:\New project\bert-extractive-summarizer"
venv\Scripts\activate.bat
```

This will work without any execution policy issues!

---

## Solution 2: Use the Batch File Activation Script

I've created `activate_venv.bat` for you. Just double-click it or run:

```cmd
activate_venv.bat
```

---

## Solution 3: Bypass PowerShell Policy for This Script Only

In PowerShell, use this command to activate without changing system settings:

```powershell
& .\venv\Scripts\Activate.ps1
```

Or use the full path with bypass:

```powershell
powershell -ExecutionPolicy Bypass -File .\venv\Scripts\Activate.ps1
```

---

## Solution 4: Use Python Directly (No Activation Needed)

You can also run Python commands directly without activating:

```powershell
.\venv\Scripts\python.exe -m pip install -r requirements.txt
.\venv\Scripts\python.exe server.py
```

---

## Complete Setup & Run (CMD Method - Recommended)

**Step 1: Open Command Prompt (CMD)**

**Step 2: Navigate to project:**
```cmd
cd "F:\New project\bert-extractive-summarizer"
```

**Step 3: Run setup:**
```cmd
setup_project.bat
```

**Step 4: Activate and run server:**
```cmd
venv\Scripts\activate.bat
python server.py
```

---

## Quick Reference

| Task | PowerShell (with issues) | CMD (works) |
|------|---------------------------|-------------|
| Activate venv | `.\venv\Scripts\Activate.ps1` | `venv\Scripts\activate.bat` |
| Run setup | `.\setup_project.ps1` | `setup_project.bat` |
| Run server | `.\run_server.ps1` | `run_server.bat` |

**Recommendation:** Use CMD (Command Prompt) instead of PowerShell to avoid all these issues!


