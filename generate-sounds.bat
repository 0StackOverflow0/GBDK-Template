@ECHO OFF

setlocal EnableDelayedExpansion

:: utils are from github.com/untoxa/VGM2GBSFX

REM COMPILE VGMs
FOR /R "sfx" %%X IN (*.vgm) DO (
    FOR /F "tokens=*" %%i IN ('type "%%X.meta"') DO set FLAGS=%%i
    python utils/vgm2data.py !FLAGS! -o sfx/%%~nX.c "%%X"
)

REM COMPILE WAVs
FOR /R "sfx" %%X IN (*.wav) DO (
    FOR /F "tokens=*" %%i IN ('type "%%X.meta"') DO set FLAGS=%%i
    python utils/wav2data.py !FLAGS! -o sfx/%%~nX.c "%%X"
)

REM COMPILE FXHAMMERs
FOR /R "sfx" %%X IN (*.sav) DO (
    FOR /F "tokens=*" %%i IN ('type "%%X.meta"') DO set FLAGS=%%i
    python utils/fxhammer2data.py !FLAGS! -o sfx/%%~nX.c "%%X"
)

REM COMPILE UGEs
FOR /R "sfx" %%X IN (*.uge) DO (
    utils\uge2source "%%X" -b 255 %%~nX sfx/%%~nX.c 
)

:: move .h files to their proper location
FOR /R "sfx" %%X IN (*.h) DO (
    move "%%X" "%cd%/include/sfx/"
)

:: move .c files to their proper location
FOR /R "sfx" %%X IN (*.c) DO (
    move "%%X" "%cd%/src/sfx/"
)