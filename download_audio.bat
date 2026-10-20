@echo off
set /p url=Enter audio URL: 
yt-dlp ^
    --js-runtimes node ^
    -f "bestaudio" ^
    -x ^
    --audio-format mp3 ^
    --audio-quality 0 ^
    --embed-thumbnail ^
    --embed-metadata ^
    --add-metadata ^
    --cookies "%~dp0cookies.txt" ^
    -o "out/%%(title)s.%%(ext)s" ^
    %url%
pause