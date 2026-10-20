# YT-DLP Download Toolkit

A ready-to-go video/audio downloader built on [yt-dlp](https://github.com/yt-dlp/yt-dlp) and [ffmpeg](https://ffmpeg.org/). Clone it, run setup, and you're downloading.

## What's included

| File | Purpose |
|---|---|
| `yt-dlp.exe` | The downloader itself |
| `ffmpeg.exe`, `ffprobe.exe`, `ffplay.exe` | Used to merge/convert video and audio |
| `download_video.bat` | Double-click to download a video as MP4 |
| `download_audio.bat` | Double-click to download audio as MP3 |
| `cookies.txt` | Empty by default — only needed for age-restricted videos (see below) |
| `out/` | Your downloads will appear here |

> **Note:** the `.exe` files are stored with [Git LFS](https://git-lfs.com) because of their size (ffmpeg alone is ~227 MB per file). See step 2 below — without it, you'll get small text placeholders instead of working programs.

## Setup (one-time)

### 1. Install Git and Git LFS
If you don't already have them:
```
winget install Git.Git
winget install GitHub.GitLFS
```
Then, once (per machine):
```
git lfs install
```

### 2. Clone this repository
```
git clone https://github.com/<your-username>/yt-dlp-toolkit.git
cd yt-dlp-toolkit
```
Git LFS downloads the actual `.exe` files automatically as part of the clone. Keep all the files together in this folder — the scripts expect `yt-dlp.exe`, `ffmpeg.exe`, etc. to be right next to them.

### 3. Install Node.js
The scripts use `--js-runtimes node`, which requires Node.js to be installed on your system.

- Download the **LTS version** from [nodejs.org](https://nodejs.org)
- Run the installer with default settings
- Restart any open terminal/PowerShell windows afterward

That's it — everything else (yt-dlp, ffmpeg) is already in the folder.

## How to use it

1. Double-click **`download_video.bat`** (for video) or **`download_audio.bat`** (for audio/MP3)
2. A black window will open and ask for a URL — paste a YouTube link and press Enter
3. Wait for it to finish — the file will appear in the `out` folder
4. Playlists work too — just paste a playlist URL and every video/track will download into its own subfolder

## About `cookies.txt`

Some videos (age-restricted, or that require sign-in) won't download without proof you're logged into YouTube. That's what `cookies.txt` is for.

**The `cookies.txt` in this repo is intentionally empty.** Most videos will work fine without it. If you hit a "Sign in to confirm your age" error:

1. Install the **["Get cookies.txt LOCALLY"](https://chromewebstore.google.com/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc)** browser extension
2. Go to **youtube.com** while signed into your own YouTube account
3. Click the extension icon → **Export** → save it as `cookies.txt`, overwriting the one in this folder

> **⚠️ Important — never commit a filled-in `cookies.txt`**
> This file contains your personal YouTube login session. Anyone who has it can access your YouTube account. This repo's `.gitignore` already excludes `cookies.txt` so a filled-in version never gets pushed by accident — don't remove that line, and don't paste its contents anywhere public.

## Keeping things up to date

YouTube changes things often, so yt-dlp needs occasional updates. To update:

1. Open PowerShell or Command Prompt in this folder
2. Run:
   ```
   .\yt-dlp.exe -U
   ```

This updates `yt-dlp.exe` in place — no need to re-clone the repo. If you want the latest ffmpeg build too, delete the three ffmpeg `.exe` files and run `git lfs pull` to fetch them fresh.

## Troubleshooting

- **"Sign in to confirm your age"** → see the cookies section above
- **Formats missing / "n challenge solving failed"** → make sure Node.js is installed (step 3 above) and that you restarted your terminal after installing
- **`.exe` files are tiny text files, not programs** → Git LFS wasn't installed before cloning. Install it (`winget install GitHub.GitLFS` + `git lfs install`), then run `git lfs pull` from inside the folder to fetch the real files
- **Nothing happens / window closes instantly** → right-click the `.bat` file → "Edit" to check it wasn't corrupted, or run it from an open Command Prompt window to see the error message
