# How to Use the HTML Summarizer

## ✅ Quick Start

1. **Make sure your server is running:**
   ```powershell
   .\start_server.bat
   ```

2. **Open `summarizer.html` in your web browser:**
   - Double-click the file, or
   - Right-click → Open with → Your browser

3. **Use the form:**
   - Paste your text in the text area
   - Choose summary type (sentence count or percentage)
   - Click "Generate Summary"
   - View your summary!

---

## Features

- ✅ Beautiful, modern interface
- ✅ Real-time character count
- ✅ Choose summary by sentence count or percentage
- ✅ Loading indicator while processing
- ✅ Error handling with helpful messages
- ✅ Responsive design (works on mobile too!)

---

## Summary Options

### By Sentence Count
- Choose how many sentences you want in the summary
- Example: 3 sentences, 5 sentences, etc.

### By Percentage
- Choose what percentage of sentences to include
- Example: 0.2 = 20% of sentences, 0.5 = 50% of sentences

---

## Troubleshooting

### "Failed to generate summary - Make sure the server is running"
- **Solution:** Start the server first:
  ```powershell
  .\start_server.bat
  ```

### Summary doesn't appear
- Check the browser console (F12) for errors
- Make sure the server is running on port 8080
- Try refreshing the page

### CORS errors
- The server should have CORS enabled (it does by default)
- If you see CORS errors, make sure `flask-cors` is installed

---

## Tips

1. **Longer text = better summaries** - The summarizer works best with multiple paragraphs
2. **Experiment with settings** - Try different sentence counts or percentages
3. **Keep server running** - Don't close the server terminal while using the HTML page

---

## That's It!

Just open `summarizer.html` in your browser and start summarizing! 🎉


