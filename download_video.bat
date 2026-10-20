@echo off
set /p url=Enter video URL: 
yt-dlp ^
    -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio/best" ^
    --merge-output-format mp4 ^
    --recode-video mp4 ^
    --embed-thumbnail ^
    --embed-metadata ^
    --embed-chapters ^
    --sponsorblock-mark default ^
    --cookies "%~dp0cookies.txt" ^
    --js-runtimes node ^
    -o "out/%%(title)s.%%(ext)s" ^
    %url%
pause