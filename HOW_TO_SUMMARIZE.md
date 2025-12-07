# How to Summarize Your Text - Quick Guide

## ✅ Your Server is Running!

Now you can summarize text in **3 easy ways**:

---

## **Method 1: Edit Python Script (Easiest!)**

### Step 1: Open `summarize_my_text.py`

### Step 2: Find this section and replace with your text:
```python
MY_TEXT = """
Put your long text here...
"""
```

### Step 3: Run it:
```powershell
.\venv\Scripts\python.exe summarize_my_text.py
```

**That's it!** The summary will appear.

---

## **Method 2: Use a Text File**

### Step 1: Edit `input_text.txt`
- Open `input_text.txt`
- Paste your text
- Save the file

### Step 2: Run:
```powershell
.\venv\Scripts\python.exe summarize_from_file.py
```

**Done!** Summary will be displayed.

---

## **Method 3: Use PowerShell Directly**

```powershell
$text = @"
Your long text here that you want to summarize.
You can paste multiple paragraphs.
Just put everything between @" and "@
"@

Invoke-RestMethod -Uri "http://localhost:8080/summarize_by_sentence?num_sentences=3" -Method Post -Body $text -ContentType "text/plain"
```

---

## **Method 4: Use Python Interactively**

Open Python and run:
```python
import requests

text = """Your text here..."""

response = requests.post(
    "http://localhost:8080/summarize_by_sentence",
    params={"num_sentences": 3},
    data=text,
    headers={"Content-Type": "text/plain"}
)

print(response.json()["summary"])
```

---

## **Adjust Summary Length**

### By Number of Sentences:
```python
params={"num_sentences": 5}  # Get 5 sentences
```

### By Percentage:
```python
params={"ratio": 0.2}  # Get 20% of sentences
```

---

## **Quick Examples**

### Example 1: Summarize Article
1. Copy article text
2. Paste into `summarize_my_text.py` (replace `MY_TEXT`)
3. Run: `.\venv\Scripts\python.exe summarize_my_text.py`

### Example 2: Summarize Document
1. Copy document text
2. Paste into `input_text.txt`
3. Run: `.\venv\Scripts\python.exe summarize_from_file.py`

### Example 3: Quick Test
```powershell
$text = "Your text here..."
Invoke-RestMethod -Uri "http://localhost:8080/summarize_by_sentence?num_sentences=3" -Method Post -Body $text -ContentType "text/plain"
```

---

## **Files You Can Use**

| File | Purpose |
|------|---------|
| `summarize_my_text.py` | Edit text directly in Python script |
| `input_text.txt` | Put your text in this file |
| `summarize_from_file.py` | Reads from `input_text.txt` |

---

## **Tips**

1. **Longer text = better summaries** (at least a few paragraphs)
2. **Adjust `NUM_SENTENCES`** to get more or fewer sentences
3. **Keep server running** - don't close the server terminal
4. **Try different values**: 3, 5, or 10 sentences

---

## **Troubleshooting**

### "Cannot connect to server"
- Make sure server is running: `.\start_server.bat`

### "File not found"
- Make sure `input_text.txt` exists in the project folder

### Summary is too short/long
- Adjust `NUM_SENTENCES` or `ratio` parameter

---

**Start with `summarize_my_text.py` - it's the easiest!** 🚀


