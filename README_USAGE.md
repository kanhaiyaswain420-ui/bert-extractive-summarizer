# How to Use Your BERT Summarizer

## ✅ Your Server is Running!

Server URL: **http://localhost:8080**

---

## Quick Examples

### **Example 1: Summarize Your Own Text**

Create a file `my_summarizer.py` and run:

```powershell
.\venv\Scripts\python.exe my_summarizer.py
```

### **Example 2: Use PowerShell**

```powershell
$text = "Your long text here that you want to summarize..."
$result = Invoke-RestMethod -Uri "http://localhost:8080/summarize_by_ratio?ratio=0.2" -Method Post -Body $text -ContentType "text/plain"
$result.summary
```

### **Example 3: Summarize a Text File**

```python
import requests

# Read your file
with open('your_file.txt', 'r', encoding='utf-8') as f:
    text = f.read()

# Summarize
response = requests.post(
    "http://localhost:8080/summarize_by_sentence",
    params={"num_sentences": 5},
    data=text,
    headers={"Content-Type": "text/plain"}
)

print(response.json()["summary"])
```

---

## API Endpoints

### **1. Health Check**
```powershell
Invoke-WebRequest -Uri "http://localhost:8080/" -Method GET
```

### **2. Summarize by Ratio (Percentage)**
```powershell
$text = "Your text here..."
Invoke-RestMethod -Uri "http://localhost:8080/summarize_by_ratio?ratio=0.2" -Method Post -Body $text -ContentType "text/plain"
```

**Parameters:**
- `ratio`: 0.0 to 1.0 (e.g., 0.2 = 20% of sentences)
- `min_length`: Minimum sentence length (default: 25)
- `max_length`: Maximum sentence length (default: 500)

### **3. Summarize by Sentence Count**
```powershell
$text = "Your text here..."
Invoke-RestMethod -Uri "http://localhost:8080/summarize_by_sentence?num_sentences=5" -Method Post -Body $text -ContentType "text/plain"
```

**Parameters:**
- `num_sentences`: Number of sentences to return (e.g., 5)
- `min_length`: Minimum sentence length (default: 25)
- `max_length`: Maximum sentence length (default: 500)

---

## Python Examples

### **Basic Usage**
```python
import requests

text = "Your long text here..."
response = requests.post(
    "http://localhost:8080/summarize_by_ratio",
    params={"ratio": 0.2},
    data=text,
    headers={"Content-Type": "text/plain"}
)

summary = response.json()["summary"]
print(summary)
```

### **Summarize Multiple Texts**
```python
import requests

texts = [
    "First long article...",
    "Second long article...",
    "Third long article..."
]

for i, text in enumerate(texts, 1):
    response = requests.post(
        "http://localhost:8080/summarize_by_sentence",
        params={"num_sentences": 3},
        data=text,
        headers={"Content-Type": "text/plain"}
    )
    print(f"\nSummary {i}:")
    print(response.json()["summary"])
```

### **Summarize from File**
```python
import requests

def summarize_file(file_path, num_sentences=5):
    with open(file_path, 'r', encoding='utf-8') as f:
        text = f.read()
    
    response = requests.post(
        "http://localhost:8080/summarize_by_sentence",
        params={"num_sentences": num_sentences},
        data=text,
        headers={"Content-Type": "text/plain"}
    )
    
    return response.json()["summary"]

# Use it
summary = summarize_file("article.txt", num_sentences=3)
print(summary)
```

---

## Integration Examples

### **Web Application (Flask)**
```python
from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

@app.route('/summarize', methods=['POST'])
def summarize():
    text = request.json.get('text')
    num_sentences = request.json.get('num_sentences', 5)
    
    # Call your BERT summarizer API
    response = requests.post(
        "http://localhost:8080/summarize_by_sentence",
        params={"num_sentences": num_sentences},
        data=text,
        headers={"Content-Type": "text/plain"}
    )
    
    return jsonify(response.json())

if __name__ == '__main__':
    app.run(port=5000)
```

### **Command Line Tool**
```python
import requests
import sys

if len(sys.argv) < 2:
    print("Usage: python summarize.py <text_file> [num_sentences]")
    sys.exit(1)

file_path = sys.argv[1]
num_sentences = int(sys.argv[2]) if len(sys.argv) > 2 else 5

with open(file_path, 'r', encoding='utf-8') as f:
    text = f.read()

response = requests.post(
    "http://localhost:8080/summarize_by_sentence",
    params={"num_sentences": num_sentences},
    data=text,
    headers={"Content-Type": "text/plain"}
)

print(response.json()["summary"])
```

---

## Tips

1. **Keep server running**: The server must stay running in one terminal
2. **Test first**: Use `test_api.py` to verify everything works
3. **Adjust parameters**: Try different `ratio` or `num_sentences` values
4. **Error handling**: Always check `response.status_code == 200`

---

## Next Steps

1. ✅ Server is running
2. ✅ API is tested and working
3. 📝 Create your own scripts using the examples above
4. 🔗 Integrate into your applications
5. 🎯 Experiment with different summarization parameters

**Your BERT Extractive Summarizer is ready to use!** 🎉


