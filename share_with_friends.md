# How to Share Your Summarizer with Friends

## 🚀 Quick Setup (3 Steps)

### Step 1: Find Your Computer's IP Address

**On Windows (PowerShell or CMD):**
```powershell
ipconfig
```
Look for "IPv4 Address" under your active network adapter (usually starts with 192.168.x.x or 10.x.x.x)

**Or use this command:**
```powershell
ipconfig | findstr "IPv4"
```

**Example output:**
```
IPv4 Address. . . . . . . . . . . : 192.168.1.100
```

### Step 2: Start Your Server

```powershell
.\start_server.bat
```

The server will run on: `http://0.0.0.0:8080` (accessible from network)

### Step 3: Share the HTML File

**Option A: Share the HTML file directly**
1. Send `summarizer.html` to your friend
2. Tell them to open it in their browser
3. They need to add `?server=http://YOUR_IP:8080` to the URL

**Example:** If your IP is `192.168.1.100`, they should open:
```
file:///path/to/summarizer.html?server=http://192.168.1.100:8080
```

**Option B: Use a simple web server (Easier!)**
See "Method 2" below for the easiest way.

---

## 📋 Method 1: Direct File Sharing

### For You (Server Owner):

1. **Find your IP address:**
   ```powershell
   ipconfig | findstr "IPv4"
   ```
   Note your IP (e.g., `192.168.1.100`)

2. **Start the server:**
   ```powershell
   .\start_server.bat
   ```

3. **Share the HTML file:**
   - Send `summarizer.html` to your friend
   - Tell them your IP address

### For Your Friend:

1. **Open the HTML file** in their browser
2. **Add your IP to the URL:**
   - Right-click the file → Open with → Browser
   - In the address bar, add: `?server=http://YOUR_IP:8080`
   
   **Example:**
   ```
   file:///C:/Users/Friend/Downloads/summarizer.html?server=http://192.168.1.100:8080
   ```

3. **Use it!** They can now paste text or upload PDFs

---

## 🌐 Method 2: Simple Web Server (Recommended - Easiest!)

### Step 1: Create a Simple Server Script

I'll create a simple Python HTTP server for you.

### Step 2: Start Both Servers

**Terminal 1 - BERT Summarizer API:**
```powershell
.\start_server.bat
```

**Terminal 2 - Web Server (serves HTML):**
```powershell
python -m http.server 8000
```

### Step 3: Share the Link

Tell your friend to open in their browser:
```
http://YOUR_IP:8000/summarizer.html
```

**Example:** If your IP is `192.168.1.100`:
```
http://192.168.1.100:8000/summarizer.html
```

**That's it!** They can use it directly without any setup!

---

## 🔧 Method 3: Use Flask to Serve HTML (Best for Production)

I'll create a simple Flask route to serve the HTML file automatically.

---

## 📝 Quick Reference

| What | Your Computer | Friend's Computer |
|------|---------------|-------------------|
| **IP Address** | Find with `ipconfig` | Not needed |
| **Server** | Run `.\start_server.bat` | Not needed |
| **HTML File** | Share `summarizer.html` | Open in browser |
| **Access** | `http://localhost:8080` | `http://YOUR_IP:8080` |

---

## 🔒 Security Notes

- **Local Network Only:** This works on your local network (same WiFi/router)
- **Firewall:** Windows Firewall might block connections. If your friend can't connect:
  - Go to Windows Defender Firewall
  - Allow Python through firewall
  - Or temporarily disable firewall for testing

- **Internet Access:** For friends outside your network, you'd need:
  - Port forwarding on your router
  - Or use a service like ngrok (see below)

---

## 🌍 Access from Internet (Advanced)

If you want friends from anywhere to access it:

### Using ngrok (Free):

1. **Download ngrok:** https://ngrok.com/download
2. **Start your server:**
   ```powershell
   .\start_server.bat
   ```
3. **In another terminal, run ngrok:**
   ```powershell
   ngrok http 8080
   ```
4. **Share the ngrok URL** (e.g., `https://abc123.ngrok.io`) with your friend
5. **Update HTML** to use the ngrok URL

---

## ✅ Testing

1. **On your computer:**
   - Open `http://localhost:8080/` - Should see "Hello, World!"

2. **On friend's computer (same network):**
   - Open `http://YOUR_IP:8080/` - Should see "Hello, World!"

3. **If it works, share the HTML file!**

---

## 🎯 Summary

**Easiest Method:**
1. Find your IP: `ipconfig | findstr "IPv4"`
2. Start server: `.\start_server.bat`
3. Share HTML file + your IP address
4. Friend opens HTML and adds `?server=http://YOUR_IP:8080` to URL

**Or use the web server method for automatic URL detection!**


