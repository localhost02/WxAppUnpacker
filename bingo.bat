@echo off

set WXAPPUNPACKER_PATH=%~dp0

set FILE_FORMAT=wxapkg

:wxappUnpacker_pkg 

echo.
echo execute: [node %WXAPPUNPACKER_PATH%/wuWxapkg.js -s=%2 %1]
echo.

node %WXAPPUNPACKER_PATH%/wuWxapkg.js -s=%2 %1

goto:eof

:wxappUnpacker 

set de_dir=%1

  if "%de_dir%" == ""

      set de_dir=%WXAPPUNPACKER_PATH%

echo %de_dir%

echo "for wxapkg in `find %de_dir% "*.${FILE_FORMAT}"`"

for %%fname in `/f %de_dir% -name "*.%FILE_FORMAT%"`

  do

    (call :wxappUnpacker_pkg %fname% %2)

goto:eof

:de_pkg

  if "-d" == "%1"

    (call :wxappUnpacker %1 %2)

  else

    (call :wxappUnpacker_pkg %1 %2)

goto:eof

# $1: pkg file or pkg dir; $2: order

call :de_pkg %1 %2