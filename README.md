# YT-DLP Download Toolkit

This folder is a ready-to-go video/audio downloader. Most of the setup is already done for you.

## What's included

| File | Purpose |
|---|---|
| `yt-dlp.exe` | The downloader itself |
| `ffmpeg.exe`, `ffprobe.exe`, `ffplay.exe` | Used to merge/convert video and audio |
| `download_video.bat` | Double-click to download a video as MP4 |
| `download_audio.bat` | Double-click to download audio as MP3 |
| `cookies.txt` | Empty by default — only needed for age-restricted videos (see below) |
| `out/` | Your downloads will appear here |

## Setup (one-time)

### 1. Extract this whole folder somewhere on your PC
Keep all the files together in the same folder — the scripts expect `yt-dlp.exe`, `ffmpeg.exe`, etc. to be right next to them. It doesn't matter what the folder is named or where it lives (Desktop, Documents, a USB drive — all fine).

### 2. Install Node.js
The scripts use `--js-runtimes node`, which requires Node.js to be installed on your system (this is the one thing **not** bundled in this zip).

- Download the **LTS version** from [nodejs.org](https://nodejs.org)
- Run the installer with default settings
- Restart any open terminal/PowerShell windows afterward

That's it — everything else (yt-dlp, ffmpeg) works out of the box.

## How to use it

1. Double-click **`download_video.bat`** (for video) or **`download_audio.bat`** (for audio/MP3)
2. A black window will open and ask for a URL — paste a YouTube link and press Enter
3. Wait for it to finish — the file will appear in the `out` folder
4. Playlists work too — just paste a playlist URL and every video/track will download into its own subfolder

## About `cookies.txt`

Some videos (age-restricted, or that require sign-in) won't download without proof you're logged into YouTube. That's what `cookies.txt` is for.

**The `cookies.txt` in this zip is intentionally empty.** Most videos will work fine without it. If you hit a "Sign in to confirm your age" error:

1. Install the **["Get cookies.txt LOCALLY"](https://chromewebstore.google.com/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc)** browser extension
2. Go to **youtube.com** while signed into your own YouTube account
3. Click the extension icon → **Export** → save it as `cookies.txt`, overwriting the one in this folder

> **⚠️ Important — do not share a filled-in `cookies.txt`**
> This file contains your personal YouTube login session. Anyone who has it can access your YouTube account. If you ever re-share this folder with someone else, make sure `cookies.txt` is empty (0 bytes) first — don't pass along your own.

## Keeping things up to date

YouTube changes things often, so yt-dlp needs occasional updates. To update:

1. Open PowerShell or Command Prompt in this folder
2. Run:
   ```
   .\yt-dlp.exe -U
   ```

This updates `yt-dlp.exe` in place — no need to re-download the whole toolkit.

## Troubleshooting

- **"Sign in to confirm your age"** → see the cookies section above
- **Formats missing / "n challenge solving failed"** → make sure Node.js is installed (step 2 above) and that you restarted your terminal after installing
- **Nothing happens / window closes instantly** → right-click the `.bat` file → "Edit" to check it wasn't corrupted, or run it from an open Command Prompt window to see the error message
