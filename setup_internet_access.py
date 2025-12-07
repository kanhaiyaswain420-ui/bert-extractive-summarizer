"""
Setup script to create internet-accessible URL for your BERT Summarizer
Uses ngrok or localtunnel to create a public URL
"""

import subprocess
import sys
import time
import webbrowser
import requests
import json

def check_ngrok():
    """Check if ngrok is installed"""
    try:
        result = subprocess.run(['ngrok', 'version'], capture_output=True, text=True)
        return True
    except:
        return False

def check_localtunnel():
    """Check if localtunnel is available"""
    try:
        result = subprocess.run(['lt', '--version'], capture_output=True, text=True)
        return True
    except:
        return False

def start_ngrok():
    """Start ngrok tunnel"""
    print("Starting ngrok tunnel...")
    print("This will create a public URL accessible from anywhere!")
    print()
    
    # Start ngrok in background
    process = subprocess.Popen(['ngrok', 'http', '8080'], 
                              stdout=subprocess.PIPE, 
                              stderr=subprocess.PIPE)
    
    time.sleep(3)  # Wait for ngrok to start
    
    # Get ngrok URL from API
    try:
        response = requests.get('http://localhost:4040/api/tunnels')
        data = response.json()
        if data['tunnels']:
            public_url = data['tunnels'][0]['public_url']
            print("=" * 60)
            print("✅ ngrok tunnel created!")
            print("=" * 60)
            print(f"\n🌐 Public URL: {public_url}")
            print(f"\n📄 Share this with your friend:")
            print(f"   {public_url}/summarizer.html")
            print("\n" + "=" * 60)
            return public_url
    except:
        print("⚠️  Could not get ngrok URL automatically.")
        print("   Check the ngrok web interface: http://localhost:4040")
        print("   Or check the ngrok terminal window")
    
    return None

def start_localtunnel():
    """Start localtunnel"""
    print("Starting localtunnel...")
    print("This will create a public URL accessible from anywhere!")
    print()
    
    try:
        process = subprocess.Popen(['lt', '--port', '8080'], 
                                  stdout=subprocess.PIPE, 
                                  stderr=subprocess.PIPE,
                                  text=True)
        
        # Wait a bit for the URL
        time.sleep(5)
        
        # Try to read the URL from output
        print("=" * 60)
        print("✅ localtunnel started!")
        print("=" * 60)
        print("\n📄 Check the localtunnel window for your public URL")
        print("   It will look like: https://xxxx.loca.lt")
        print("\n📄 Share this with your friend:")
        print("   https://xxxx.loca.lt/summarizer.html")
        print("\n" + "=" * 60)
        
    except Exception as e:
        print(f"❌ Error starting localtunnel: {e}")
        print("\nPlease install localtunnel:")
        print("  npm install -g localtunnel")
        return None
    
    return None

def main():
    print("=" * 60)
    print("BERT Summarizer - Internet Access Setup")
    print("=" * 60)
    print()
    
    # Check if server is running
    try:
        response = requests.get('http://localhost:8080/', timeout=2)
        if response.status_code == 200:
            print("✅ BERT server is running on port 8080")
        else:
            print("⚠️  BERT server might not be running")
            print("   Please start it first: .\\start_server.bat")
    except:
        print("❌ BERT server is not running!")
        print("   Please start it first: .\\start_server.bat")
        print()
        input("Press Enter to exit...")
        return
    
    print()
    print("Choose tunneling method:")
    print("1. ngrok (requires installation, more stable)")
    print("2. localtunnel (no installation if you have Node.js)")
    print()
    
    choice = input("Enter choice (1 or 2): ").strip()
    
    if choice == '1':
        if check_ngrok():
            url = start_ngrok()
            if url:
                # Open ngrok web interface
                webbrowser.open('http://localhost:4040')
        else:
            print()
            print("❌ ngrok is not installed!")
            print()
            print("To install ngrok:")
            print("1. Download from: https://ngrok.com/download")
            print("2. Extract ngrok.exe")
            print("3. Add to PATH or place in this folder")
            print()
            input("Press Enter to exit...")
    
    elif choice == '2':
        if check_localtunnel():
            start_localtunnel()
        else:
            print()
            print("❌ localtunnel is not installed!")
            print()
            print("To install localtunnel:")
            print("1. Install Node.js from: https://nodejs.org/")
            print("2. Run: npm install -g localtunnel")
            print()
            input("Press Enter to exit...")
    else:
        print("Invalid choice!")
        input("Press Enter to exit...")

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nSetup cancelled.")
    except Exception as e:
        print(f"\nError: {e}")
        input("Press Enter to exit...")

