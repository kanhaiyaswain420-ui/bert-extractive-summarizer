"""
Simple script to summarize your own text using the API
"""

import requests

# Your text to summarize
my_text = """
Artificial intelligence has revolutionized many industries in recent years. 
Machine learning algorithms can now process vast amounts of data and make 
predictions with remarkable accuracy. Deep learning, a subset of machine 
learning, uses neural networks to solve complex problems. Natural language 
processing allows computers to understand and generate human language. 
Computer vision enables machines to interpret and understand visual information. 
These technologies are being applied in healthcare, finance, transportation, 
and many other fields. The future of AI looks promising with continued 
advancements in research and development.
"""

# API endpoint
url = "http://localhost:8080/summarize_by_sentence"

# Parameters
params = {
    "num_sentences": 3,  # Get 3 sentences
    "min_length": 25,
    "max_length": 500
}

# Headers
headers = {"Content-Type": "text/plain"}

# Make request
print("Sending request to API...")
print("=" * 60)
response = requests.post(url, params=params, data=my_text, headers=headers)

if response.status_code == 200:
    result = response.json()
    print("\nSUMMARY:")
    print("-" * 60)
    print(result['summary'])
    print("-" * 60)
else:
    print(f"Error: {response.status_code}")
    print(response.text)


