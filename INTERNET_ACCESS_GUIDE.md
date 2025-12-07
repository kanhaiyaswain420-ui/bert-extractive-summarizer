# How to Share Your Summarizer Over the Internet

## 🌐 Quick Start - 3 Methods

### **Method 1: Using ngrok (Recommended - Most Stable)**

#### Step 1: Install ngrok
1. Download from: https://ngrok.com/download
2. Extract `ngrok.exe`
3. Add to PATH or place in your project folder

#### Step 2: Start Your Server
```powershell
.\start_server.bat
```

#### Step 3: Start ngrok
```powershell
ngrok http 8080
```

#### Step 4: Share the URL
ngrok will show you a URL like:
```
https://abc123.ngrok.io
```

Share with your friend:
```
https://abc123.ngrok.io/summarizer.html
```

**That's it!** Your friend can access it from anywhere!

---

### **Method 2: Using localtunnel (No Signup Required)**

#### Step 1: Install Node.js (if not installed)
Download from: https://nodejs.org/

#### Step 2: Install localtunnel
```powershell
npm install -g localtunnel
```

#### Step 3: Start Your Server
```powershell
.\start_server.bat
```

#### Step 4: Start localtunnel
```powershell
lt --port 8080
```

#### Step 5: Share the URL
localtunnel will show you a URL like:
```
https://abc123.loca.lt
```

Share with your friend:
```
https://abc123.loca.lt/summarizer.html
```

---

### **Method 3: Automated Setup Script**

#### Step 1: Start Your Server
```powershell
.\start_server.bat
```

#### Step 2: Run Setup Script
```powershell
python setup_internet_access.py
```

Follow the prompts to choose ngrok or localtunnel.

---

## 📋 Detailed Instructions

### **Using ngrok (Best Option)**

#### Why ngrok?
- ✅ Most stable and reliable
- ✅ Free tier available
- ✅ Web interface to monitor traffic
- ✅ Custom domains (paid)

#### Setup:

1. **Sign up (free):**
   - Go to https://ngrok.com/
   - Sign up for free account
   - Get your authtoken

2. **Configure ngrok:**
   ```powershell
   ngrok config add-authtoken YOUR_AUTH_TOKEN
   ```

3. **Start your BERT server:**
   ```powershell
   .\start_server.bat
   ```

4. **Start ngrok:**
   ```powershell
   ngrok http 8080
   ```

5. **Get your URL:**
   - Check the ngrok terminal window
   - Or open: http://localhost:4040
   - Copy the "Forwarding" URL (e.g., `https://abc123.ngrok.io`)

6. **Share with friend:**
   ```
   https://abc123.ngrok.io/summarizer.html
   ```

#### ngrok Web Interface:
- Open: http://localhost:4040
- See all requests in real-time
- Inspect requests/responses
- Replay requests

---

### **Using localtunnel (Easiest - No Signup)**

#### Why localtunnel?
- ✅ No signup required
- ✅ Quick setup
- ✅ Free

#### Setup:

1. **Install Node.js:**
   - Download from: https://nodejs.org/
   - Install it

2. **Install localtunnel:**
   ```powershell
   npm install -g localtunnel
   ```

3. **Start your BERT server:**
   ```powershell
   .\start_server.bat
   ```

4. **Start localtunnel:**
   ```powershell
   lt --port 8080
   ```

5. **Get your URL:**
   - localtunnel will show a URL like: `https://abc123.loca.lt`
   - You may need to press Enter to accept

6. **Share with friend:**
   ```
   https://abc123.loca.lt/summarizer.html
   ```

---

## 🚀 Quick Commands

### **Start Everything with ngrok:**
```powershell
.\start_with_ngrok.bat
```

### **Start Everything with localtunnel:**
```powershell
.\start_with_localtunnel.bat
```

---

## ⚠️ Important Notes

### **Security:**
- ⚠️ Anyone with the URL can access your server
- ⚠️ Don't share the URL publicly
- ⚠️ Consider adding authentication for production use

### **Limitations:**
- **ngrok free tier:** Limited connections, URLs change on restart
- **localtunnel:** URLs change on restart, may require accepting connection

### **Performance:**
- First request may be slow (cold start)
- Large PDFs may take time to process
- Keep your computer and server running

### **Stability:**
- URLs change when you restart the tunnel
- Share the new URL if you restart
- Consider paid ngrok for static URLs

---

## 🔧 Troubleshooting

### **"ngrok not found"**
- Make sure ngrok.exe is in your PATH
- Or place it in the project folder
- Or use full path: `C:\path\to\ngrok.exe http 8080`

### **"Cannot connect to server"**
- Make sure BERT server is running: `.\start_server.bat`
- Check if port 8080 is available
- Try a different port: `ngrok http 5000` (and update server port)

### **"localtunnel not found"**
- Install Node.js first
- Then: `npm install -g localtunnel`
- Make sure npm is in your PATH

### **Friend can't access**
- Make sure your computer is on
- Make sure server is running
- Make sure tunnel is running
- Check firewall settings
- Try the URL yourself first

---

## 📱 Testing

1. **Test locally first:**
   - Open: `http://localhost:8080/`
   - Should see "Hello, World!"

2. **Test with tunnel:**
   - Open: `https://your-tunnel-url.ngrok.io/`
   - Should see "Hello, World!"

3. **Test HTML:**
   - Open: `https://your-tunnel-url.ngrok.io/summarizer.html`
   - Should see the form

4. **Test from phone (different network):**
   - Use mobile data (not same WiFi)
   - Open the tunnel URL
   - Should work!

---

## 🎯 Summary

**Easiest Method:**
1. Install ngrok: https://ngrok.com/download
2. Run: `.\start_with_ngrok.bat`
3. Share the ngrok URL with your friend

**No Installation Method:**
1. Install Node.js: https://nodejs.org/
2. Run: `npm install -g localtunnel`
3. Run: `.\start_with_localtunnel.bat`
4. Share the localtunnel URL with your friend

**Your friend can now access from anywhere in the world!** 🌍

