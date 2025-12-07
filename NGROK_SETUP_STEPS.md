# Step-by-Step: ngrok Setup Guide

## 📋 Complete Setup Instructions

### Step 1: Download ngrok

1. Go to: https://ngrok.com/download
2. Download the Windows version
3. Extract the ZIP file
4. You'll get `ngrok.exe`

### Step 2: Place ngrok.exe

**Option A: In your project folder (Easiest)**
- Copy `ngrok.exe` to: `F:\New project\bert-extractive-summarizer\`
- This way you can run it directly

**Option B: Add to PATH (Advanced)**
- Copy `ngrok.exe` to a folder like `C:\ngrok\`
- Add that folder to your Windows PATH

### Step 3: Sign Up for ngrok (Free)

1. Go to: https://dashboard.ngrok.com/signup
2. Sign up with email (or use Google/GitHub)
3. Verify your email
4. You'll be taken to the dashboard

### Step 4: Get Your Authtoken

1. **After signing up, you'll see the dashboard**
2. **Look for "Your Authtoken"** or go to: https://dashboard.ngrok.com/get-started/your-authtoken
3. **Copy the token** - it looks like:
   ```
   2abc123def456ghi789jkl012mno345pqr678stu901vwx234yz
   ```

### Step 5: Run the Authtoken Command

**Open PowerShell or Command Prompt** in your project folder:

```powershell
cd "F:\New project\bert-extractive-summarizer"
```

**Then run:**
```powershell
.\ngrok.exe config add-authtoken YOUR_TOKEN_HERE
```

**Replace `YOUR_TOKEN_HERE` with your actual token!**

**Example:**
```powershell
.\ngrok.exe config add-authtoken 2abc123def456ghi789jkl012mno345pqr678stu901vwx234yz
```

**Or if ngrok is in your PATH:**
```powershell
ngrok config add-authtoken YOUR_TOKEN_HERE
```

### Step 6: Verify It Worked

Run:
```powershell
.\ngrok.exe version
```

You should see ngrok version info. If you see an error, ngrok might not be in the right place.

---

## 🎯 Quick Summary

1. **Download ngrok** → Extract `ngrok.exe`
2. **Place in project folder:** `F:\New project\bert-extractive-summarizer\`
3. **Sign up:** https://dashboard.ngrok.com/signup
4. **Get token:** https://dashboard.ngrok.com/get-started/your-authtoken
5. **Run in PowerShell:**
   ```powershell
   cd "F:\New project\bert-extractive-summarizer"
   .\ngrok.exe config add-authtoken YOUR_TOKEN
   ```

---

## 🔍 Where to Run the Command

### **Option 1: PowerShell (Recommended)**

1. Press `Win + X`
2. Click "Windows PowerShell" or "Terminal"
3. Navigate to your project:
   ```powershell
   cd "F:\New project\bert-extractive-summarizer"
   ```
4. Run the command:
   ```powershell
   .\ngrok.exe config add-authtoken YOUR_TOKEN
   ```

### **Option 2: Command Prompt (CMD)**

1. Press `Win + R`
2. Type `cmd` and press Enter
3. Navigate to your project:
   ```cmd
   cd "F:\New project\bert-extractive-summarizer"
   ```
4. Run the command:
   ```cmd
   ngrok.exe config add-authtoken YOUR_TOKEN
   ```

### **Option 3: From File Explorer**

1. Open File Explorer
2. Go to: `F:\New project\bert-extractive-summarizer`
3. In the address bar, type `powershell` and press Enter
4. Run:
   ```powershell
   .\ngrok.exe config add-authtoken YOUR_TOKEN
   ```

---

## ✅ After Running the Command

You should see:
```
Authtoken saved to configuration file: C:\Users\YourName\AppData\Local\ngrok\ngrok.yml
```

**That's it!** You only need to do this once.

---

## 🚀 Next Steps

After setting up the authtoken, you can:

1. **Start your server:**
   ```powershell
   .\start_server.bat
   ```

2. **Start ngrok:**
   ```powershell
   .\ngrok.exe http 8080
   ```

3. **Or use the automated script:**
   ```powershell
   .\start_with_ngrok.bat
   ```

---

## ❓ Troubleshooting

### "ngrok.exe not found"
- Make sure `ngrok.exe` is in your project folder
- Or use full path: `C:\path\to\ngrok.exe config add-authtoken YOUR_TOKEN`

### "Command not recognized"
- Make sure you're in the project folder
- Use `.\ngrok.exe` (with `.\`) if in the same folder

### "Invalid authtoken"
- Make sure you copied the entire token
- No extra spaces before/after
- Get a fresh token from the dashboard if needed

---

## 📝 Example Session

Here's what it looks like:

```powershell
PS F:\New project\bert-extractive-summarizer> .\ngrok.exe config add-authtoken 2abc123def456ghi789jkl012mno345pqr678stu901vwx234yz
Authtoken saved to configuration file: C:\Users\YourName\AppData\Local\ngrok\ngrok.yml

PS F:\New project\bert-extractive-summarizer> .\ngrok.exe version
ngrok version 3.x.x
```

**Done!** Now you can use ngrok! 🎉

