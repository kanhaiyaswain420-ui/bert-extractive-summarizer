# How to Run BERT Extractive Summarizer on Windows

This guide will help you set up and run the BERT extractive summarizer on your Windows PC.

## Prerequisites

1. **Python 3.7+** - Make sure Python is installed. Check by running:
   ```powershell
   python --version
   ```

2. **pip** - Python package manager (usually comes with Python)

## Installation Steps

### Step 1: Create a Virtual Environment (Recommended)

Open PowerShell in the project directory and run:

```powershell
python -m venv venv
```

Activate the virtual environment:

```powershell
.\venv\Scripts\Activate.ps1
```

If you get an execution policy error, run this first:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Step 2: Install Dependencies

Install the required packages:

```powershell
pip install -r requirements.txt
```

**Note:** The requirements.txt includes some specific versions. If you encounter issues:
- You may need to install PyTorch separately (especially if you have a GPU)
- Some packages might need to be installed individually

### Step 3: Install the Package

Install the package in development mode:

```powershell
pip install -e .
```

Or install it directly:

```powershell
pip install bert-extractive-summarizer
```

## Running the Summarizer

### Option 1: Use as a Python Library (Recommended for Testing)

Create a simple test script `test_summarizer.py`:

```python
from summarizer import Summarizer

# Your text to summarize
body = '''
The Chrysler Building, the famous art deco New York skyscraper, will be sold for a small fraction of its previous sales price.
The deal, first reported by The Real Deal, was for $150 million, according to a source familiar with the deal.
Mubadala, an Abu Dhabi investment fund, purchased 90% of the building for $800 million in 2008.
Real estate firm Tishman Speyer had owned the other 10%.
The buyer is RFR Holding, a New York real estate company.
'''

# Create the summarizer model
model = Summarizer()

# Generate summary (returns 20% of sentences by default)
result = model(body, ratio=0.2)

# Print the summary
print('\n'.join(result))
```

Run it:

```powershell
python test_summarizer.py
```

### Option 2: Run the Example Script

The example script requires a text file. Create a text file with your content, then run:

```powershell
python examples/summarize.py -path your_text_file.txt
```

### Option 3: Run as a Web Service

Start the Flask server:

```powershell
python server.py
```

The server will start on `http://localhost:8080` by default.

You can customize the model and other options:

```powershell
python server.py -model bert-base-uncased -port 8080
```

Then make POST requests to:
- `http://localhost:8080/summarize_by_ratio?ratio=0.2`
- `http://localhost:8080/summarize_by_sentence?num_sentences=5`

## Troubleshooting

### Common Issues:

1. **PyTorch Installation**: If you have a GPU, you might want to install PyTorch with CUDA support:
   ```powershell
   pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
   ```

2. **Spacy Model**: You may need to download the spacy model:
   ```powershell
   python -m spacy download en_core_web_sm
   ```

3. **NLTK Data**: The server requires NLTK punkt tokenizer, which should download automatically.

4. **Memory Issues**: If you run out of memory, try using a smaller model:
   ```python
   model = Summarizer('distilbert-base-uncased')  # Smaller, faster model
   ```

## Quick Start Example

Here's the fastest way to get started:

1. Open PowerShell in the project folder
2. Create and activate virtual environment:
   ```powershell
   python -m venv venv
   .\venv\Scripts\Activate.ps1
   ```
3. Install dependencies:
   ```powershell
   pip install -r requirements.txt
   pip install -e .
   ```
4. Create a test file `quick_test.py`:
   ```python
   from summarizer import Summarizer
   text = "Your long text here..."
   model = Summarizer()
   print('\n'.join(model(text, num_sentences=3)))
   ```
5. Run it:
   ```powershell
   python quick_test.py
   ```

## Notes

- The first run will download the BERT model (can be several hundred MB)
- Processing time depends on your hardware and text length
- GPU acceleration is automatic if CUDA is available


