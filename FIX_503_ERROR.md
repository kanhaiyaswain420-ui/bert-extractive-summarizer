# Fix 503 Service Unavailable Error

## 🔍 The Problem

You're getting `503 Service Unavailable` which means:
- ✅ Localtunnel is working (you got a URL)
- ❌ But it can't connect to your server on port 8080

## ✅ Quick Fix

### Step 1: Make Sure Server is Running

Check if you see a window titled "BERT API Server" - it should be running.

If not, start it:
```powershell
.\start_server.bat
```

Wait for it to show: `Running on http://127.0.0.1:8080`

### Step 2: Restart Localtunnel

1. **Close the localtunnel window** (if it's open)
2. **Open a new PowerShell window**
3. **Run:**
   ```powershell
   lt --port 8080
   ```
4. **Wait for the URL** - it might be different from before
5. **Press Enter** if it asks you to accept

### Step 3: Test the New URL

Try the new URL in your browser:
```
https://new-url.loca.lt/summarizer.html
```

---

## 🔧 Alternative: Use the Fix Script

I created a fix script for you:

```powershell
.\fix_localtunnel.bat
```

This will:
- Check if server is running
- Start it if needed
- Start localtunnel properly

---

## 🧪 Test Your Server First

Before using localtunnel, test locally:

1. **Open in browser:**
   ```
   http://localhost:8080/
   ```
   Should show: "Hello, World!"

2. **Test HTML:**
   ```
   http://localhost:8080/summarizer.html
   ```
   Should show the form

If these work, then the issue is with localtunnel connection.

---

## 🔄 Complete Restart (If Nothing Works)

### Step 1: Stop Everything
- Close all server windows
- Close localtunnel window

### Step 2: Start Server Fresh
```powershell
.\start_server.bat
```

Wait until you see: `Running on http://127.0.0.1:8080`

### Step 3: Start Localtunnel Fresh
Open a **NEW** PowerShell window:
```powershell
cd "F:\New project\bert-extractive-summarizer"
lt --port 8080
```

### Step 4: Get New URL
- Wait for URL to appear
- Press Enter if prompted
- Use the NEW URL (it might be different)

---

## ⚠️ Common Issues

### Issue 1: Server Not Fully Started
**Solution:** Wait 10-15 seconds after starting server before starting localtunnel

### Issue 2: Port Already in Use
**Solution:** 
```powershell
# Check what's using port 8080
netstat -ano | findstr :8080

# Kill the process if needed, then restart
```

### Issue 3: Firewall Blocking
**Solution:** Temporarily disable Windows Firewall for testing

### Issue 4: Localtunnel Connection Timeout
**Solution:** 
- Restart localtunnel
- Get a fresh URL
- Make sure server is running BEFORE starting localtunnel

---

## ✅ Quick Test Checklist

- [ ] Server window shows "Running on http://127.0.0.1:8080"
- [ ] http://localhost:8080/ shows "Hello, World!"
- [ ] Localtunnel window shows a URL
- [ ] You pressed Enter in localtunnel window (if prompted)
- [ ] Using the URL from localtunnel (not an old one)

---

## 🎯 Recommended Steps Right Now

1. **Check server is running:**
   - Look for "BERT API Server" window
   - Should show "Running on http://127.0.0.1:8080"

2. **If server is running, restart localtunnel:**
   ```powershell
   lt --port 8080
   ```

3. **Get the NEW URL** and try it

4. **If still 503, try:**
   ```powershell
   .\fix_localtunnel.bat
   ```

---

## 📞 Still Not Working?

Try accessing directly:
```
http://localhost:8080/summarizer.html
```

If this works, the issue is definitely with localtunnel. Try:
- Restart localtunnel
- Get a fresh URL
- Make sure both server and localtunnel are running

