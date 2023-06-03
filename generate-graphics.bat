@ECHO OFF

setlocal EnableDelayedExpansion

SET GBDK=C:/gbdk
SET PNG2ASSET=%GBDK%/bin/png2asset.exe

:: Sprites, Backgrounds & Maps
FOR /R "gfx" %%X IN (*.png) DO (
    FOR /F "tokens=*" %%i IN ('type "%%X.meta"') DO SET FLAGS=%%i
    %PNG2ASSET% %%X -c gfx\%%~nX.c !FLAGS!
)

:: move .h files to their proper location
FOR /R "gfx" %%X IN (*.h) DO (
    move "%%X" "%cd%/include/gfx/"
)

:: move .c files to their proper location
FOR /R "gfx" %%X IN (*.c) DO (
    move "%%X" "%cd%/src/gfx/"
)