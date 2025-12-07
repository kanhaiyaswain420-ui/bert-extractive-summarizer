"""
Simple script to summarize YOUR text
Just edit the text below and run this script!
"""

import requests

# ============================================
# PUT YOUR TEXT HERE - Edit this section!
# ============================================
MY_TEXT = """
Put your long text here that you want to summarize.
You can paste multiple paragraphs.
The summarizer will extract the most important sentences.
Just replace everything between the triple quotes with your own text.
"""

# ============================================
# Configuration - Adjust these if needed
# ============================================
NUM_SENTENCES = 3  # How many sentences in the summary
# Or use RATIO instead: ratio = 0.2  # 20% of sentences

# API endpoint
URL = "http://localhost:8080/summarize_by_sentence"

# ============================================
# Don't edit below this line
# ============================================

print("=" * 60)
print("BERT Text Summarizer")
print("=" * 60)
print(f"\nOriginal text length: {len(MY_TEXT)} characters")
print(f"Requesting summary with {NUM_SENTENCES} sentences...")
print("\n" + "=" * 60)
print("SUMMARY:")
print("=" * 60)

try:
    # Make request to API
    response = requests.post(
        URL,
        params={
            "num_sentences": NUM_SENTENCES,
            "min_length": 25,
            "max_length": 500
        },
        data=MY_TEXT,
        headers={"Content-Type": "text/plain"}
    )
    
    if response.status_code == 200:
        result = response.json()
        print("\n" + result['summary'])
        print("\n" + "=" * 60)
        print("Summary complete!")
    else:
        print(f"\nError: {response.status_code}")
        print(response.text)
        
except requests.exceptions.ConnectionError:
    print("\nERROR: Cannot connect to server!")
    print("Make sure the server is running:")
    print("  Run: .\\start_server.bat")
except Exception as e:
    print(f"\nError: {e}")


