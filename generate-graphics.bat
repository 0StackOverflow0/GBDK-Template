ECHO OFF

SET GBDK=C:/gbdk
SET PNG2ASSET=%GBDK%/bin/png2asset.exe
:: following from ZGB but might be useful
SET GBM2C=%GBDK%/bin/gbm2c.exe
SET GBR2C=%GBDK%/bin/gbr2c.exe

:: Sprites
%PNG2ASSET% gfx\image.png -c gfx\image.c -b 2 -px 0 -py 0 -sx 0 -sy 0 -sw 32 -sh 32 -spr8x8 -noflip

:: Backgrounds & Maps
%PNG2ASSET% gfx\map.png -b 2 -c gfx\map.c -map -use_map_attributes -noflip

:: move .h files to their proper location
FOR /R "gfx" %%X IN (*.h) DO (
    move "%%X" "%cd%/include/gfx/"
)

:: move .c files to their proper location
FOR /R "gfx" %%X IN (*.c) DO (
    move "%%X" "%cd%/src/gfx/"
)