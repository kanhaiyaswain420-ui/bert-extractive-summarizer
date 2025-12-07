"""
Quick test script for BERT Extractive Summarizer
Run this after installation to verify everything works.
"""

from summarizer import Summarizer

# Sample text to summarize
sample_text = '''
The Chrysler Building, the famous art deco New York skyscraper, will be sold for a small fraction of its previous sales price.
The deal, first reported by The Real Deal, was for $150 million, according to a source familiar with the deal.
Mubadala, an Abu Dhabi investment fund, purchased 90% of the building for $800 million in 2008.
Real estate firm Tishman Speyer had owned the other 10%.
The buyer is RFR Holding, a New York real estate company.
Officials with Tishman and RFR did not immediately respond to a request for comments.
It's unclear when the deal will close.
The building sold fairly quickly after being publicly placed on the market only two months ago.
The sale was handled by CBRE Group.
The incentive to sell the building at such a huge loss was due to the soaring rent the owners pay to Cooper Union, a New York college, for the land under the building.
The rent is rising from $7.75 million last year to $32.5 million this year to $41 million in 2028.
Meantime, rents in the building itself are not rising nearly that fast.
While the building is an iconic landmark in the New York skyline, it is competing against newer office towers with large floor-to-ceiling windows and all the modern amenities.
Still the building is among the best known in the city, even to people who have never been to New York.
It is famous for its triangle-shaped, vaulted windows worked into the stylized crown, along with its distinctive eagle gargoyles near the top.
'''

def main():
    print("Initializing BERT Summarizer...")
    print("(This may take a moment on first run as it downloads the model)\n")
    
    try:
        # Initialize the summarizer
        model = Summarizer()
        
        print("Generating summary...\n")
        print("=" * 60)
        print("SUMMARY (3 sentences):")
        print("=" * 60)
        
        # Generate summary with 3 sentences
        result = model(sample_text, num_sentences=3)
        
        # Print the summary
        for sentence in result:
            print(sentence)
        
        print("\n" + "=" * 60)
        print("Test completed successfully!")
        print("=" * 60)
        
    except Exception as e:
        print(f"\nError: {e}")
        print("\nMake sure you have:")
        print("1. Installed all dependencies: pip install -r requirements.txt")
        print("2. Installed the package: pip install -e .")
        print("3. Have an internet connection (for downloading models)")

if __name__ == '__main__':
    main()


