"""
Summarize text from a file
Edit input_text.txt with your text, then run this script
"""

import requests

# File containing your text
INPUT_FILE = "input_text.txt"
NUM_SENTENCES = 3  # Adjust this number

print("=" * 60)
print("Summarizing text from file...")
print("=" * 60)

try:
    # Read text from file
    with open(INPUT_FILE, 'r', encoding='utf-8') as f:
        text = f.read()
    
    if not text.strip():
        print(f"\nERROR: {INPUT_FILE} is empty!")
        print(f"Please add your text to {INPUT_FILE} and try again.")
    else:
        print(f"\nText loaded: {len(text)} characters")
        print(f"Requesting summary with {NUM_SENTENCES} sentences...")
        print("\n" + "=" * 60)
        print("SUMMARY:")
        print("=" * 60)
        
        # Make request to API
        response = requests.post(
            "http://localhost:8080/summarize_by_sentence",
            params={
                "num_sentences": NUM_SENTENCES,
                "min_length": 25,
                "max_length": 500
            },
            data=text,
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
            
except FileNotFoundError:
    print(f"\nERROR: File '{INPUT_FILE}' not found!")
    print(f"Please create {INPUT_FILE} and add your text to it.")
except requests.exceptions.ConnectionError:
    print("\nERROR: Cannot connect to server!")
    print("Make sure the server is running:")
    print("  Run: .\\start_server.bat")
except Exception as e:
    print(f"\nError: {e}")


