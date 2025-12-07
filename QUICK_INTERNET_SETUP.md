# 🌐 Quick Internet Access Setup

## ✅ Easiest Method: Using ngrok

### Step 1: Install ngrok
1. Download: https://ngrok.com/download
2. Extract `ngrok.exe` to your project folder (or add to PATH)
3. Sign up at https://ngrok.com/ (free)
4. Get your authtoken and run:
   ```powershell
   ngrok config add-authtoken YOUR_TOKEN
   ```

### Step 2: Start Everything
```powershell
.\start_with_ngrok.bat
```

This will:
- ✅ Start your BERT server
- ✅ Start ngrok tunnel
- ✅ Show you the public URL

### Step 3: Share the URL
ngrok will give you a URL like:
```
https://abc123.ngrok.io
```

**Share with your friend:**
```
https://abc123.ngrok.io/summarizer.html
```

**That's it!** Your friend can access from anywhere! 🎉

---

## ✅ Alternative: Using localtunnel (No Signup)

### Step 1: Install Node.js
Download from: https://nodejs.org/

### Step 2: Install localtunnel
```powershell
npm install -g localtunnel
```

### Step 3: Start Everything
```powershell
.\start_with_localtunnel.bat
```

### Step 4: Share the URL
localtunnel will give you a URL like:
```
https://abc123.loca.lt
```

**Share with your friend:**
```
https://abc123.loca.lt/summarizer.html
```

---

## 📋 What Your Friend Needs

**Nothing!** They just need:
- A web browser
- The URL you share with them
- Internet connection

They can:
- ✅ Paste text
- ✅ Upload PDFs
- ✅ Get summaries
- ✅ No installation needed!

---

## 🔧 Manual Setup (If Scripts Don't Work)

### Terminal 1: Start BERT Server
```powershell
.\start_server.bat
```

### Terminal 2: Start ngrok
```powershell
ngrok http 8080
```

### Terminal 3: Start Web Server (Optional)
```powershell
python start_web_server.py
```

Then share:
- **Via ngrok:** `https://your-ngrok-url.ngrok.io/summarizer.html`
- **Via web server + ngrok:** `https://your-ngrok-url.ngrok.io:8000/summarizer.html`

---

## ⚠️ Important Notes

1. **Keep servers running** - Don't close the terminal windows
2. **URLs change** - If you restart ngrok/localtunnel, you get a new URL
3. **Free tier limits** - ngrok free has connection limits
4. **Security** - Anyone with the URL can access (don't share publicly)

---

## 🎯 Summary

**Recommended: ngrok**
1. Install ngrok
2. Run: `.\start_with_ngrok.bat`
3. Share the URL

**Easiest: localtunnel**
1. Install Node.js
2. Run: `npm install -g localtunnel`
3. Run: `.\start_with_localtunnel.bat`
4. Share the URL

**Your friend can now use it from anywhere in the world!** 🌍

