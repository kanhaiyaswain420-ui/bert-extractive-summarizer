# 🚀 Deployment Guide - Share Your Summarizer with Friends

## Quick Options Summary

| Method | Setup Time | Cost | Requires Your PC | Best For |
|--------|-----------|------|------------------|----------|
| **ngrok** | 5 min | Free | ✅ Yes | Quick testing |
| **localtunnel** | 3 min | Free | ✅ Yes | Quick testing |
| **Render** | 10 min | Free tier | ❌ No | Permanent deployment ⭐ |
| **Fly.io** | 15 min | Free tier | ❌ No | Permanent deployment |
| **Heroku** | 15 min | Paid plans | ❌ No | Permanent deployment |
| **Netlify** | ❌ | - | - | ❌ Not suitable (see below) |

*Heroku free tier discontinued, but paid plans available

**⚠️ Note about Netlify:** Netlify is designed for static sites and serverless functions with strict time/memory limits. This Flask app with BERT models requires long-running processes and large memory, making Netlify unsuitable. Use Render instead.

---

## 🌐 Method 1: ngrok (Quick & Easy - Temporary)

**Best for:** Quick sharing, testing, temporary access

### Setup Steps:

1. **Download ngrok:**
   - Go to: https://ngrok.com/download
   - Download and extract `ngrok.exe`
   - Place it in your project folder (you already have it!)

2. **Sign up (free):**
   - Go to: https://ngrok.com/
   - Create a free account
   - Get your authtoken from the dashboard

3. **Configure ngrok:**
   ```powershell
   .\ngrok.exe config add-authtoken YOUR_AUTH_TOKEN
   ```

4. **Start everything:**
   ```powershell
   .\start_with_ngrok.bat
   ```

5. **Get your URL:**
   - Check the ngrok window, or
   - Open: http://localhost:4040
   - Copy the URL (e.g., `https://abc123.ngrok.io`)

6. **Share with your friend:**
   ```
   https://abc123.ngrok.io/summarizer.html
   ```

**✅ Done!** Your friend can access from anywhere!

**⚠️ Note:** 
- URL changes each time you restart
- Your computer must stay on
- Free tier has connection limits

---

## 🌐 Method 2: localtunnel (No Signup - Temporary)

**Best for:** Quick sharing without signup

### Setup Steps:

1. **Install Node.js** (if not installed):
   - Download: https://nodejs.org/
   - Install it

2. **Install localtunnel:**
   ```powershell
   npm install -g localtunnel
   ```

3. **Start everything:**
   ```powershell
   .\start_with_localtunnel.bat
   ```

4. **Get your URL:**
   - Check the localtunnel window
   - URL looks like: `https://abc123.loca.lt`
   - Press Enter if prompted to accept

5. **Share with your friend:**
   ```
   https://abc123.loca.lt/summarizer.html
   ```

**✅ Done!**

**⚠️ Note:**
- URL changes each time you restart
- Your computer must stay on
- May require accepting connection each time

---

## ☁️ Method 3: Render (Permanent - Recommended ⭐)

**Best for:** Permanent deployment, easy setup, free tier

### Setup Steps:

1. **Sign up:**
   - Go to: https://render.com/
   - Sign up with GitHub

2. **Create new Web Service:**
   - Click "New +" → "Web Service"
   - Connect your GitHub repo

3. **Configure:**
   - Render auto-detects Python and uses `render.yaml` (already created!)
   - **Build Command:** `pip install -r requirements.txt` (auto-filled)
   - **Start Command:** `python server.py` (auto-filled)
   - **Environment:** Python 3

4. **Deploy:**
   - Click "Create Web Service"
   - Render will build and deploy automatically
   - Get your public URL (e.g., `https://your-app.onrender.com`)

5. **Share with your friend:**
   ```
   https://your-app.onrender.com/summarizer.html
   ```

**✅ Done!** Permanent deployment!

**💰 Cost:** Free tier available (spins down after 15 min inactivity)

**📚 Full Guide:** See `RENDER_DEPLOYMENT.md` for detailed instructions!

---

## ☁️ Method 4: Fly.io (Permanent - Docker-based)

---

## ❌ Why Not Netlify?

**Netlify is NOT suitable for this project because:**

1. **Time Limits:** Netlify Functions have 10-second timeout (free tier), 26 seconds (paid)
   - BERT model loading takes 10-30 seconds
   - Summarization can take 5-15 seconds per request
   - You'll hit timeout limits constantly

2. **Memory Limits:** 128MB free, 1024MB paid
   - BERT models need 500MB+ RAM
   - Multiple requests = memory issues

3. **Cold Starts:** Each request loads the model from scratch
   - First request: 30+ seconds
   - Subsequent requests: Still slow due to model size

4. **Architecture Mismatch:** 
   - Netlify = Static sites + Serverless functions
   - This app = Long-running Flask server with persistent models

**Use Railway or Render instead!** They're designed for this type of application.

---

## ☁️ Method 5: Heroku (Permanent)

**Best for:** Docker-based deployments, good performance

### Setup Steps:

1. **Install Fly CLI:**
   - Download: https://fly.io/docs/getting-started/installing-flyctl/

2. **Sign up:**
   ```powershell
   fly auth signup
   ```

3. **Create app:**
   ```powershell
   fly launch
   ```

4. **Deploy:**
   ```powershell
   fly deploy
   ```

5. **Share with your friend:**
   ```
   https://your-app.fly.dev/summarizer.html
   ```

**💰 Cost:** Free tier includes 3 shared VMs

---


**Best for:** Permanent deployment (paid plans)

### Setup Steps:

1. **Sign up:**
   - Go to: https://heroku.com/
   - Create account

2. **Install Heroku CLI:**
   - Download: https://devcenter.heroku.com/articles/heroku-cli

3. **Create Procfile:**
   ```
   web: python server.py --port $PORT
   ```

4. **Deploy:**
   ```powershell
   heroku login
   heroku create your-app-name
   git push heroku main
   ```

5. **Share with your friend:**
   ```
   https://your-app-name.herokuapp.com/summarizer.html
   ```

**💰 Cost:** Paid plans available (free tier discontinued)

---

## 🔧 Updating server.py for Cloud Deployment

For cloud platforms, you need to use the `PORT` environment variable:

```python
import os

# In server.py, change this line:
parser.add_argument('-port', dest='port', help='', default=8000)

# To:
parser.add_argument('-port', dest='port', help='', default=int(os.environ.get('PORT', 8000)))
```

Or modify the `app.run()` line:
```python
port = int(os.environ.get('PORT', 8000))
app.run(host='0.0.0.0', port=port)
```

---

## 📋 Comparison

### Temporary Solutions (ngrok/localtunnel):
- ✅ Quick setup (5 minutes)
- ✅ Free
- ❌ Requires your PC to be on
- ❌ URL changes on restart
- ❌ Not suitable for production

### Permanent Solutions (Render/Heroku):
- ✅ Permanent URL
- ✅ No need to keep your PC on
- ✅ More reliable
- ✅ Better for sharing with multiple friends
- ⚠️ May have free tier limitations (Render spins down after inactivity)
- ⚠️ Takes 10-15 minutes to set up

---

## 🎯 Recommended Approach

**For quick testing:** Use ngrok or localtunnel

**For permanent sharing:** Use Render (see `RENDER_DEPLOYMENT.md` for full guide)

---

## 🚀 Quick Start Commands

### ngrok:
```powershell
.\start_with_ngrok.bat
```

### localtunnel:
```powershell
.\start_with_localtunnel.bat
```

### Manual ngrok:
```powershell
.\start_server.bat
# In another terminal:
.\ngrok.exe http 8000
```

### Manual localtunnel:
```powershell
.\start_server.bat
# In another terminal:
lt --port 8000
```

---

## ⚠️ Important Notes

1. **Security:** Anyone with the URL can access your server. Don't share publicly.

2. **Model Size:** BERT models are large (~400MB). First deployment may take time.

3. **Memory:** Cloud platforms may have memory limits. Check platform requirements.

4. **Cold Starts:** Free tiers may spin down after inactivity. First request may be slow.

5. **File Uploads:** Make sure your platform supports file uploads (most do).

---

## 🆘 Troubleshooting

### ngrok not working?
- Make sure server is running on port 8000
- Check ngrok authtoken is configured
- Try: `.\ngrok.exe http 8000 --log=stdout`

### localtunnel not working?
- Make sure Node.js is installed
- Check server is running: `http://localhost:8000/`
- Try: `lt --port 8000 --print-requests`

### Cloud deployment failing?
- Check build logs for errors
- Verify `requirements.txt` is complete
- Make sure `PORT` environment variable is used
- Check platform memory/disk limits

---

## 📞 Need Help?

Check the platform documentation:
- Render: https://render.com/docs (see `RENDER_DEPLOYMENT.md` for full guide)
- Heroku: https://devcenter.heroku.com/
- ngrok: https://ngrok.com/docs

**📚 Full Deployment Guides:**
- **Render:** `RENDER_DEPLOYMENT.md` - Complete step-by-step guide
- **Render Quick Start:** `RENDER_QUICK_START.md` - 5-step quick guide

