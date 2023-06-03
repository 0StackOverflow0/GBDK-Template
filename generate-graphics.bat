@ECHO OFF

SET GBDK=C:/gbdk
SET PNG2ASSET=%GBDK%/bin/png2asset.exe

:: Sprites
FOR /R "gfx" %%X IN (*.png) DO (
    IF exist "%%X.sprite" (
        FOR /F "tokens=*" %%i IN ('type "%%X.sprite"') DO (
            %PNG2ASSET% %%X -c gfx/%%~nX.c %%i
        )
    )
)

:: Backgrounds & Maps
FOR /R "gfx" %%X IN (*.png) DO (
    IF exist "%%X.map" (
        FOR /F "tokens=*" %%i IN ('type "%%X.map"') DO (
            %PNG2ASSET% %%X -c gfx\%%~nX.c %%i
        )
    )
)

:: move .h files to their proper location
FOR /R "gfx" %%X IN (*.h) DO (
    move "%%X" "%cd%/include/gfx/"
)

:: move .c files to their proper location
FOR /R "gfx" %%X IN (*.c) DO (
    move "%%X" "%cd%/src/gfx/"
)