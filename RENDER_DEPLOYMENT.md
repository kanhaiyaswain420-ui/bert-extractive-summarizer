# 🎨 Render Deployment Guide - Step by Step

This guide will help you deploy your BERT Summarizer to Render so your friend can access it from anywhere!

---

## 📋 Prerequisites

1. **GitHub Account** (free) - https://github.com/
2. **Render Account** (free) - https://render.com/
3. **Git installed** on your computer

---

## 🚀 Step-by-Step Deployment

### Step 1: Prepare Your Code

Your code is already prepared! I've created:
- ✅ `render.yaml` - Render configuration file
- ✅ `requirements.txt` - All dependencies including Flask

### Step 2: Push to GitHub

If you haven't already, you need to push your code to GitHub:

#### 2a. Initialize Git (if not already done)

```powershell
# Check if git is initialized
git status

# If not initialized, run:
git init
```

#### 2b. Create .gitignore (if needed)

Make sure `.gitignore` includes:
```
venv/
__pycache__/
*.pyc
.env
```

#### 2c. Add and Commit Files

```powershell
# Add all files
git add .

# Commit
git commit -m "Prepare for Render deployment"
```

#### 2d. Create GitHub Repository

1. Go to: https://github.com/new
2. Create a new repository (e.g., `bert-summarizer`)
3. **Don't** initialize with README (you already have files)
4. Click "Create repository"

#### 2e. Push to GitHub

```powershell
# Add your GitHub repo (replace YOUR_USERNAME and REPO_NAME)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**Example:**
```powershell
git remote add origin https://github.com/john/bert-summarizer.git
git branch -M main
git push -u origin main
```

---

### Step 3: Sign Up for Render

1. Go to: https://render.com/
2. Click **"Get Started for Free"** or **"Sign Up"**
3. Sign up with your **GitHub account** (easiest way)
4. Authorize Render to access your GitHub

---

### Step 4: Create New Web Service

1. In Render dashboard, click **"New +"** button
2. Select **"Web Service"**
3. Connect your GitHub account (if not already connected)
4. Select your repository (the one you just pushed)

---

### Step 5: Configure Render

Render will auto-detect settings, but verify:

#### 5a. Basic Settings

- **Name:** `bert-summarizer` (or any name you like)
- **Environment:** `Python 3`
- **Region:** Choose closest to you (e.g., `Oregon (US West)`)
- **Branch:** `main` (or `master`)

#### 5b. Build & Deploy Settings

- **Build Command:** `pip install -r requirements.txt`
- **Start Command:** `python server.py`

**Or use the `render.yaml` file** (I've created it for you):
- Render will automatically use `render.yaml` if present
- No need to manually configure!

#### 5c. Environment Variables

Render automatically sets `PORT` environment variable. Your `server.py` already uses it!

**Optional:** Add custom environment variables if needed:
- Go to **Environment** tab
- Add any variables you need

---

### Step 6: Deploy

1. Click **"Create Web Service"**
2. Render will start building automatically
3. Watch the **Logs** tab for progress
4. First deployment takes 5-10 minutes (downloading models)

---

### Step 7: Get Your Public URL

1. Once deployed, Render gives you a URL automatically
2. It looks like: `https://bert-summarizer.onrender.com`
3. You can also set a custom name in **Settings** → **Custom Domain**

---

### Step 8: Share with Your Friend! 🎉

Share this URL:
```
https://your-app-name.onrender.com/summarizer.html
```

**That's it!** Your friend can now access it from anywhere!

---

## 🔧 Troubleshooting

### Build Fails

**Error: "Module not found"**
- Make sure `requirements.txt` includes all dependencies
- Check Render build logs for specific errors
- Verify Python version (Render uses Python 3.9+)

**Error: "Port already in use"**
- Render sets PORT automatically - your code should use `os.environ.get('PORT')`
- ✅ Already fixed in your `server.py`!

**Error: "Out of memory"**
- Render free tier: 512MB RAM
- BERT models need ~500MB
- If it fails, upgrade to paid plan or optimize model

### App Crashes

**Check Logs:**
1. Go to Render dashboard
2. Click on your service
3. Go to **Logs** tab
4. Look for error messages

**Common Issues:**
- Model download timeout - Render will retry
- Memory issues - Check logs for OOM errors
- Missing dependencies - Check requirements.txt

### Slow First Request

**Normal!** First request:
- Downloads BERT model (~400MB)
- Loads model into memory
- Takes 30-60 seconds

**Subsequent requests:** Much faster (2-5 seconds)

### App Spins Down (Free Tier)

**Render free tier spins down after 15 minutes of inactivity**

**Solutions:**
1. **Upgrade to paid plan** - Always on ($7/month)
2. **Use a keep-alive service** - Ping your app every 10 minutes
3. **Accept the delay** - First request after spin-down takes 30-60 seconds

**Keep-alive options:**
- Use a service like https://uptimerobot.com/
- Set it to ping your URL every 10 minutes
- Free tier available

---

## 📊 Monitoring

### View Logs
- Render dashboard → Your service → **Logs** tab
- Real-time logs available
- Historical logs stored

### View Metrics
- Render dashboard → Your service → **Metrics** tab
- See CPU, Memory, Network usage
- Request count and response times

### Restart App
- Render dashboard → Your service → **Manual Deploy** → **Clear build cache & deploy**

---

## 🔄 Updating Your App

1. Make changes to your code
2. Commit and push to GitHub:
   ```powershell
   git add .
   git commit -m "Update app"
   git push
   ```
3. Render automatically redeploys!

**Or manually trigger:**
- Render dashboard → **Manual Deploy** → **Deploy latest commit**

---

## 💰 Render Pricing

**Free Tier:**
- 512MB RAM
- 0.1 CPU
- Spins down after 15 min inactivity
- Free SSL certificate
- Enough for this app!

**Starter Plan ($7/month):**
- Always on (no spin-down)
- 512MB RAM
- Better for production

**Standard Plan ($25/month):**
- More resources
- Better performance

---

## ✅ Checklist

Before deploying, make sure:
- [ ] Code is pushed to GitHub
- [ ] `render.yaml` exists (✅ Created)
- [ ] `requirements.txt` includes Flask, flask-cors, nltk (✅ Check)
- [ ] `server.py` uses `PORT` environment variable (✅ Already done)
- [ ] `.gitignore` excludes `venv/` and `__pycache__/` (✅ Check)

---

## 🎯 Quick Commands Reference

```powershell
# Initialize git (if needed)
git init

# Add files
git add .

# Commit
git commit -m "Initial commit"

# Add GitHub remote (replace with your repo)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# Push to GitHub
git branch -M main
git push -u origin main

# Update requirements.txt (if needed)
# Already includes: Flask, flask-cors, nltk, gunicorn
```

---

## 🆘 Need Help?

1. **Render Docs:** https://render.com/docs
2. **Render Community:** https://community.render.com/
3. **Check Build Logs:** Render dashboard → Your service → Logs

---

## 🎉 Success!

Once deployed, your friend can:
- ✅ Access from anywhere
- ✅ Paste text to summarize
- ✅ Upload PDF files
- ✅ No installation needed!

**Your permanent URL:**
```
https://your-app-name.onrender.com/summarizer.html
```

**Note:** Free tier spins down after inactivity. First request after spin-down may take 30-60 seconds.

Enjoy! 🚀

