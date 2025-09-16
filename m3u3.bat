@echo off
color 02

:loop
cls
set /p userinput=Please enter the m3u8 link: 
if "%userinput%"=="" (
    echo M3U8 link cannot be empty.
    pause
    goto loop
)

set /p filename=Please enter the filename (without extension): 
if "%filename%"=="" (
    echo Filename cannot be empty.
    pause
    goto loop
)

set /p download_location=Please enter the download location (e.g., C:\Downloads\): 

if not "%download_location:~-1%"=="\" set download_location=%download_location%\

if not exist "%download_location%" mkdir "%download_location%"

color 07
echo.
echo Download has been started...

ffmpeg -i "%userinput%" -c copy "%download_location%%filename%.mp4"

if %errorlevel% neq 0 (
    echo.
    echo Download failed. Please check the M3U8 link and try again.
    pause
    goto loop
)

color 02
cls
echo The file "%filename%.mp4" has been successfully downloaded.
set /p ask=Do you want to download another file? (y/n): 
set fi=%ask:~0,1%
IF /I "%fi%"=="y" (
    goto loop
) ELSE (
    echo Exiting the program.
)

color 07
pause

